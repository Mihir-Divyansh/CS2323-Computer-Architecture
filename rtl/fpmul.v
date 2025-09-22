module fpmul #(
    parameter DWIDTH = 32,
    parameter EWIDTH = 8,
    parameter MWIDTH = 23
)(
    input  clk,
    input  rst,
    input  valid,
    input  [DWIDTH-1:0] a,
    input  [DWIDTH-1:0] b,
    output reg [DWIDTH-1:0] result,
    output reg [2:0] fex,  // [overflow, underflow, inexact]
    output reg done
);

    localparam BIAS = (1 << (EWIDTH-1)) - 1;
    localparam MAX_EXP = (1 << EWIDTH) - 1;
    
    // Stage 0: Unpack and classify
    reg signed [EWIDTH:0] expa_s0, expb_s0;
    reg [MWIDTH-1:0] mana_s0, manb_s0;
    reg sign_a_s0, sign_b_s0;
    reg valid_s0, valid_s1, valid_s2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            expa_s0 <= 0; expb_s0 <= 0;
            mana_s0 <= 0; manb_s0 <= 0;
            sign_a_s0 <= 0; sign_b_s0 <= 0;
            valid_s0 <= 0;
        end else if (valid) begin
            expa_s0 <= {1'b0, a[DWIDTH-2 : MWIDTH]};
            expb_s0 <= {1'b0, b[DWIDTH-2 : MWIDTH]};
            mana_s0 <= a[MWIDTH-1:0];
            manb_s0 <= b[MWIDTH-1:0];
            sign_a_s0 <= a[DWIDTH-1];
            sign_b_s0 <= b[DWIDTH-1];
            valid_s0 <= 1;
        end else begin
            valid_s0 <= valid;
        end
    end

    wire isnan_a     = (expa_s0[EWIDTH-1:0] == MAX_EXP) && (mana_s0 != 0);
    wire isnan_b     = (expb_s0[EWIDTH-1:0] == MAX_EXP) && (manb_s0 != 0);
    wire isinf_a     = (expa_s0[EWIDTH-1:0] == MAX_EXP) && (mana_s0 == 0);
    wire isinf_b     = (expb_s0[EWIDTH-1:0] == MAX_EXP) && (manb_s0 == 0);
    wire issubnorm_a = (expa_s0[EWIDTH-1:0] == 0) && (mana_s0 != 0);
    wire issubnorm_b = (expb_s0[EWIDTH-1:0] == 0) && (manb_s0 != 0);
    wire iszero_a    = (expa_s0[EWIDTH-1:0] == 0) && (mana_s0 == 0);
    wire iszero_b    = (expb_s0[EWIDTH-1:0] == 0) && (manb_s0 == 0);

    wire [MWIDTH:0] mana_full = issubnorm_a ? {1'b0, mana_s0} : {1'b1, mana_s0};
    wire [MWIDTH:0] manb_full = issubnorm_b ? {1'b0, manb_s0} : {1'b1, manb_s0};

    function [5:0] count_leading_zeros;
        input [MWIDTH:0] mantissa;
        integer i;
        begin
            count_leading_zeros = MWIDTH + 1;
            for (i = MWIDTH; i >= 0; i = i - 1) begin
                if (mantissa[i] == 1'b1) begin
                    count_leading_zeros = MWIDTH - i;
                end
            end
        end
    endfunction

    function [5:0] priority_encode_product;
        input [2*(MWIDTH+1)-1:0] product;
        integer i;
        begin
            priority_encode_product = 0;
            for (i = 2*(MWIDTH+1)-2; i >= 2*(MWIDTH+1)-2-MWIDTH; i = i - 1) begin
                if (product[i] == 1'b1) begin
                    priority_encode_product = (2*(MWIDTH+1)-2) - i;
                end else if (i == 2*(MWIDTH+1)-2-MWIDTH) begin
                    priority_encode_product = MWIDTH + 1;
                end
            end
        end
    endfunction

    wire [5:0] lz_count_a = issubnorm_a ? count_leading_zeros(mana_full) : 0;
    wire [5:0] lz_count_b = issubnorm_b ? count_leading_zeros(manb_full) : 0;

    wire [MWIDTH:0] mana_norm = issubnorm_a ? (mana_full << lz_count_a) : mana_full;
    wire [MWIDTH:0] manb_norm = issubnorm_b ? (manb_full << lz_count_b) : manb_full;

    wire special_case = isnan_a || isnan_b || isinf_a || isinf_b || iszero_a || iszero_b;
    
    reg [DWIDTH-1:0] special_result;
    reg [2:0] special_fex;
    reg special_case_s0, special_case_s1, special_case_s2;

    always @(*) begin
        special_result = 0;
        special_fex = 3'b000;
        
        if (isnan_a || isnan_b) begin
            special_result = {1'b0, {EWIDTH{1'b1}}, 1'b1, {(MWIDTH-1){1'b0}}};
            special_fex = 3'b000;
        end
        else if ((iszero_a && isinf_b) || (isinf_a && iszero_b)) begin
            special_result = {1'b0, {EWIDTH{1'b1}}, 1'b1, {(MWIDTH-1){1'b0}}};
            special_fex = 3'b000;
        end
        else if (isinf_a || isinf_b) begin
            special_result = {sign_a_s0 ^ sign_b_s0, {EWIDTH{1'b1}}, {MWIDTH{1'b0}}};
            special_fex = 3'b000;
        end
        else if (iszero_a || iszero_b) begin
            special_result = {sign_a_s0 ^ sign_b_s0, {(EWIDTH+MWIDTH){1'b0}}};
            special_fex = 3'b000;
        end
    end

    // Stage 1: Multiply
    reg sign_result_s1;
    reg signed [EWIDTH+1:0] exp_result_s1;
    reg [2*(MWIDTH+1)-1:0] man_product_s1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            valid_s1 <= 0;
            special_case_s1 <= 0;
            sign_result_s1 <= 0;
            exp_result_s1 <= 0;
            man_product_s1 <= 0;
        end else begin
            valid_s1 <= valid_s0;
            special_case_s1 <= special_case;
            
            if (valid_s0) begin
                sign_result_s1 <= sign_a_s0 ^ sign_b_s0;
                man_product_s1 <= mana_norm * manb_norm;
                
                if (special_case) begin
                    exp_result_s1 <= 0;
                end else begin
                    if (issubnorm_a && issubnorm_b) begin
                        exp_result_s1 <= 2 - BIAS - lz_count_a - lz_count_b;
                    end else if (issubnorm_a) begin
                        exp_result_s1 <= expb_s0 + 1 - BIAS - lz_count_a;
                    end else if (issubnorm_b) begin
                        exp_result_s1 <= expa_s0 + 1 - BIAS - lz_count_b;
                    end else begin
                        exp_result_s1 <= expa_s0 + expb_s0 - BIAS;
                    end
                end
            end
        end
    end

    // Stage 2: Normalize and round
    reg sign_result_s2;
    reg [EWIDTH-1:0] exp_final_s2;
    reg [MWIDTH-1:0] man_final_s2;
    reg [2:0] fex_s2;
    reg [5:0] lz_count;
    reg [5:0] shift_amount;
    reg [MWIDTH:0] rounded_man;
    reg [MWIDTH:0] subnormal_man;
    reg guard, round_bit, sticky;
    reg [2*(MWIDTH+1)-1:0] product;
    reg signed [EWIDTH+1:0] adjusted_exp;
    reg [2:0] temp_fex;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            valid_s2 <= 0;
            special_case_s2 <= 0;
            sign_result_s2 <= 0;
            exp_final_s2 <= 0;
            man_final_s2 <= 0;
            fex_s2 <= 0;
        end else begin
            valid_s2 <= valid_s1;
            special_case_s2 <= special_case_s1;
            
            if (valid_s1) begin
                if (special_case_s1) begin
                    sign_result_s2 <= special_result[DWIDTH-1];
                    exp_final_s2 <= special_result[DWIDTH-2:MWIDTH];
                    man_final_s2 <= special_result[MWIDTH-1:0];
                    fex_s2 <= special_fex;
                end else begin
                    sign_result_s2 <= sign_result_s1;
                    
                    product = man_product_s1;
                    adjusted_exp = exp_result_s1;
                    temp_fex = 3'b000;
                    
                    if (product[2*(MWIDTH+1)-1] == 1'b1) begin
                        product = product >> 1;
                        adjusted_exp = adjusted_exp + 1;
                    end else if (product[2*(MWIDTH+1)-2] == 1'b0 && product != 0) begin
                        lz_count = priority_encode_product(product);
                        
                        if (lz_count > adjusted_exp) begin
                            shift_amount = adjusted_exp[5:0];
                        end else begin
                            shift_amount = lz_count;
                        end
                        
                        if (shift_amount > 0) begin
                            product = product << shift_amount;
                            adjusted_exp = adjusted_exp - shift_amount;
                        end
                    end
                    
                    if (adjusted_exp >= MAX_EXP) begin
                        exp_final_s2 <= MAX_EXP;
                        man_final_s2 <= 0;
                        temp_fex[2] = 1'b1;
                        temp_fex[0] = 1'b1;
                    end
                    else if (adjusted_exp <= 0) begin
                        exp_final_s2 <= 0;
                        if (adjusted_exp < -(MWIDTH)) begin
                            man_final_s2 <= 0;
                            temp_fex[1] = 1'b1;
                            temp_fex[0] = 1'b1;
                        end else begin
                            subnormal_man = product[2*(MWIDTH+1)-2 : 2*(MWIDTH+1)-2-MWIDTH];
                            subnormal_man = subnormal_man >> (1 - adjusted_exp);
                            man_final_s2 <= subnormal_man[MWIDTH-1:0];
                            temp_fex[1] = 1'b1;
                            if (product[2*(MWIDTH+1)-2-MWIDTH-1:0] != 0) begin
                                temp_fex[0] = 1'b1;
                            end
                        end
                    end
                    else begin
                        exp_final_s2 <= adjusted_exp[EWIDTH-1:0];
                        
                        rounded_man = product[2*(MWIDTH+1)-2 : 2*(MWIDTH+1)-2-MWIDTH];
                        guard = product[2*(MWIDTH+1)-2-MWIDTH-1];
                        round_bit = product[2*(MWIDTH+1)-2-MWIDTH-2];
                        sticky = |product[2*(MWIDTH+1)-2-MWIDTH-3:0];
                        
                        if (guard && (round_bit || sticky || rounded_man[0])) begin
                            rounded_man = rounded_man + 1;
                            temp_fex[0] = 1'b1;
                            
                            if (rounded_man[MWIDTH] == 1'b1) begin
                                rounded_man = rounded_man >> 1;
                                adjusted_exp = adjusted_exp + 1;
                                
                                if (adjusted_exp >= MAX_EXP) begin
                                    exp_final_s2 <= MAX_EXP;
                                    man_final_s2 <= 0;
                                    temp_fex[2] = 1'b1;
                                end else begin
                                    exp_final_s2 <= adjusted_exp[EWIDTH-1:0];
                                    man_final_s2 <= rounded_man[MWIDTH-1:0];
                                end
                            end else begin
                                man_final_s2 <= rounded_man[MWIDTH-1:0];
                            end
                        end else begin
                            man_final_s2 <= rounded_man[MWIDTH-1:0];
                            if (guard || round_bit || sticky) begin
                                temp_fex[0] = 1'b1;
                            end
                        end
                    end
                    
                    fex_s2 <= temp_fex;
                end
            end
        end
    end

    // Output
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 0;
            fex <= 0;
            done <= 0;
        end else begin
            done <= valid_s2;
            if (valid_s2) begin
                result <= {sign_result_s2, exp_final_s2, man_final_s2};
                fex <= fex_s2;
            end
        end
    end

endmodule