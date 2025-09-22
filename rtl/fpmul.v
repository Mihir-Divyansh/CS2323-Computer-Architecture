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
        reg found;
        begin
            found = 0;
            count_leading_zeros = MWIDTH;
            for (i = MWIDTH; i >= 0; i = i - 1) begin
                if (mantissa[i] == 1'b1 && !found) begin
                    count_leading_zeros = MWIDTH - i;
                    found = 1;
                end
            end
        end
    endfunction

    function [5:0] priority_encode_product;
        input [2*(MWIDTH+1)-1:0] product;
        integer i;
        reg found;
        begin
            priority_encode_product = 1;
            found = 0;
            for (i = 2*(MWIDTH+1)-2; i >= 2*(MWIDTH+1)-2-MWIDTH; i = i - 1) begin
                if ((product[i] == 1'b1) && !found) begin
                    priority_encode_product = (2*(MWIDTH+1)-2) - i;
                    found = 1;
                end else if ((i == 2*(MWIDTH+1)-2-MWIDTH) && !found) begin
                    priority_encode_product = MWIDTH + 1;
                    found = 1;
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
                        exp_result_s1 <= 0;
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

    wire [5:0] lz_count_product;
    wire [2*(MWIDTH+1)-1:0] normalized_product;
    wire signed [EWIDTH+1:0] normalized_exp;
    wire [MWIDTH:0] mantissa_rounded;
    wire [MWIDTH:0] subnormal_mantissa;
    wire guard_bit, round_bit, sticky_bit;
    wire should_round_up;

    assign lz_count_product = priority_encode_product(man_product_s1);

    wire product_overflow = man_product_s1[2*(MWIDTH+1)-1];
    wire product_underflow = !man_product_s1[2*(MWIDTH+1)-1] && !man_product_s1[2*(MWIDTH+1)-2] && (man_product_s1 != 0);

    // Calculate normalized product and exponent
    assign normalized_product = product_overflow ? (man_product_s1 >> 1) :
                            product_underflow ? (man_product_s1 << (lz_count_product > exp_result_s1 ? exp_result_s1[5:0] : lz_count_product)) :
                            man_product_s1;

    assign normalized_exp = product_overflow ? (exp_result_s1 + 1) :
                        product_underflow ? (exp_result_s1 - (lz_count_product > exp_result_s1 ? exp_result_s1[5:0] : lz_count_product)) :
                        exp_result_s1;

    assign mantissa_rounded = normalized_product[2*(MWIDTH+1)-2 : 2*(MWIDTH+1)-2-MWIDTH];
    assign guard_bit = normalized_product[2*(MWIDTH+1)-2-MWIDTH-1];
    assign round_bit = normalized_product[2*(MWIDTH+1)-2-MWIDTH-2];
    assign sticky_bit = |normalized_product[2*(MWIDTH+1)-2-MWIDTH-3:0];

    // Round to Zero (truncate)
    assign should_round_up = 0;

    wire is_subnormal = (normalized_exp <= 0);
    wire [5:0] subnormal_shift = is_subnormal ? (1 - normalized_exp) : 0;
    assign subnormal_mantissa = mantissa_rounded >> subnormal_shift;

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
                    // Handle special cases
                    sign_result_s2 <= special_result[DWIDTH-1];
                    exp_final_s2 <= special_result[DWIDTH-2:MWIDTH];
                    man_final_s2 <= special_result[MWIDTH-1:0];
                    fex_s2 <= special_fex;
                end else begin
                    sign_result_s2 <= sign_result_s1;
                    fex_s2 <= 3'b000; 
                    
                    // Check for overflow
                    if (normalized_exp >= MAX_EXP) begin
                        exp_final_s2 <= {EWIDTH{1'b1}};  
                        man_final_s2 <= {MWIDTH{1'b0}}; 
                        fex_s2 <= 3'b100; 
                    end
                    // Check for underflow to zero
                    else if (normalized_exp < -(MWIDTH)) begin
                        exp_final_s2 <= {EWIDTH{1'b0}};
                        man_final_s2 <= {MWIDTH{1'b0}};
                        fex_s2 <= 3'b010;  
                    end
                    // Subnormal result
                    else if (is_subnormal) begin
                        exp_final_s2 <= {EWIDTH{1'b0}};
                        if (should_round_up && (subnormal_mantissa != {(MWIDTH+1){1'b1}})) begin
                            man_final_s2 <= subnormal_mantissa[MWIDTH-1:0] + 1;
                        end else begin
                            man_final_s2 <= subnormal_mantissa[MWIDTH-1:0];
                        end
                        fex_s2[1] <= 1'b1; 
                        if (guard_bit || round_bit || sticky_bit) begin
                            fex_s2[0] <= 1'b1; 
                        end
                    end
                    // Normal result
                    else begin
                        if (should_round_up) begin
                            if (mantissa_rounded == {(MWIDTH+1){1'b1}}) begin
                                if ((normalized_exp + 1) >= MAX_EXP) begin
                                    exp_final_s2 <= {EWIDTH{1'b1}};
                                    man_final_s2 <= {MWIDTH{1'b0}};
                                    fex_s2 <= 3'b100;
                                end else begin
                                    exp_final_s2 <= normalized_exp[EWIDTH-1:0] + 1;
                                    man_final_s2 <= {MWIDTH{1'b0}};
                                    fex_s2 <= 3'b001;  // inexact
                                end
                            end else begin
                                exp_final_s2 <= normalized_exp[EWIDTH-1:0];
                                man_final_s2 <= mantissa_rounded[MWIDTH-1:0] + 1;
                                fex_s2 <= 3'b1;  // inexact
                            end
                        end else begin
                            exp_final_s2 <= normalized_exp[EWIDTH-1:0];
                            man_final_s2 <= mantissa_rounded[MWIDTH-1:0];
                            if (guard_bit || round_bit || sticky_bit) begin
                                fex_s2 <= 3'b1;  // inexact
                            end
                        end
                    end
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