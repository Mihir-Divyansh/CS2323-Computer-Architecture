module fpadd
#(
    parameter DWIDTH = 32,
    parameter EWIDTH = 8,
    parameter MWIDTH = 23
)
(
    input clk,
    input rst,
    input valid,
    input [DWIDTH-1:0] a,
    input [DWIDTH-1:0] b,
    output reg [DWIDTH-1:0] sum,
    output reg [2:0] fex,
    output reg done
);
    // Valid signal pipeline tracking
    reg valid_s1, valid_s2, valid_s3, valid_s4;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            valid_s1 <= 0;
            valid_s2 <= 0;
            valid_s3 <= 0;
            valid_s4 <= 0;
        end else begin
            valid_s1 <= valid;
            valid_s2 <= valid_s1;
            valid_s3 <= valid_s2;
            valid_s4 <= valid_s3;
        end
    end

    // Stage 0 registers
    reg [EWIDTH-1:0] expa_s0, expb_s0;
    reg [MWIDTH-1:0] mana_s0, manb_s0;
    reg sign_a, sign_b;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            expa_s0 <= 0;
            expb_s0 <= 0;
            mana_s0 <= 0;
            manb_s0 <= 0;
            sign_a <= 0;
            sign_b <= 0;
        end else begin
            if (valid) begin
                expa_s0 <= a[DWIDTH-2 : DWIDTH-1-EWIDTH];
                expb_s0 <= b[DWIDTH-2 : DWIDTH-1-EWIDTH];
                mana_s0 <= a[MWIDTH-1:0];
                manb_s0 <= b[MWIDTH-1:0];
                sign_a <= a[DWIDTH-1];
                sign_b <= b[DWIDTH-1];
            end
        end
    end

    wire [EWIDTH-1:0] expa_wire_s0, expb_wire_s0;
    wire [MWIDTH-1:0] mana_wire_s0, manb_wire_s0;
    wire sign_a_wire_s0, sign_b_wire_s0;

    assign expa_wire_s0 = expa_s0;
    assign expb_wire_s0 = expb_s0;
    assign mana_wire_s0 = mana_s0;
    assign manb_wire_s0 = manb_s0;
    assign sign_a_wire_s0 = sign_a;
    assign sign_b_wire_s0 = sign_b;

    // Special case detection
    wire isnan_a, isnan_b;
    wire isinf_a, isinf_b;
    wire issubnorm_a, issubnorm_b;
    wire iszero_a, iszero_b;

    assign isnan_b     = ((expb_wire_s0 == {(EWIDTH){1'b1}})  &&  (manb_wire_s0 != 0));
    assign isnan_a     = ((expa_wire_s0 == {(EWIDTH){1'b1}})  &&  (mana_wire_s0 != 0));
    assign isinf_a     = ((expa_wire_s0 == {(EWIDTH){1'b1}})  &&  (mana_wire_s0 == 0));
    assign isinf_b     = ((expb_wire_s0 == {(EWIDTH){1'b1}})  &&  (manb_wire_s0 == 0));
    assign issubnorm_a = ((expa_wire_s0 == 0)                 &&  (mana_wire_s0 != 0));
    assign issubnorm_b = ((expb_wire_s0 == 0)                 &&  (manb_wire_s0 != 0));
    assign iszero_a    = ((expa_wire_s0 == 0)                 &&  (mana_wire_s0 == 0));
    assign iszero_b    = ((expb_wire_s0 == 0)                 &&  (manb_wire_s0 == 0));

    // Stage 0 special case handling
    reg [MWIDTH + 2:0] mana_full, manb_full;
    reg special_case_s0;
    reg [DWIDTH-1:0] special_result_s0;
    reg [2:0] special_fex_s0;
    reg [DWIDTH-1:0] input_a_s0, input_b_s0; // Store original inputs for special cases

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            special_case_s0 <= 0;
            special_result_s0 <= 0;
            special_fex_s0 <= 0;
            input_a_s0 <= 0;
            input_b_s0 <= 0;
        end else begin
            if (valid) begin
                input_a_s0 <= a;
                input_b_s0 <= b;
            end
            
            mana_full <= {~issubnorm_a, mana_wire_s0, 2'b0};
            manb_full <= {~issubnorm_b, manb_wire_s0, 2'b0};

            // Handle special cases
            if (isnan_a || isnan_b) begin
                special_case_s0 <= 1;
                special_result_s0 <= {1'b0, {EWIDTH{1'b1}}, 1'b1, {MWIDTH-1{1'b0}}}; 
                special_fex_s0 <= 3'b001;  
            end
            else if (isinf_a && isinf_b && (sign_a_wire_s0 != sign_b_wire_s0)) begin
                special_case_s0 <= 1;
                special_result_s0 <= {1'b0, {EWIDTH{1'b1}}, 1'b1, {MWIDTH-1{1'b0}}}; 
                special_fex_s0 <= 3'b001; 
            end
            else if (isinf_a) begin
                special_case_s0 <= 1;
                special_result_s0 <= {sign_a_wire_s0, {EWIDTH{1'b1}}, {MWIDTH{1'b0}}};
                special_fex_s0 <= 3'b000;
            end
            else if (isinf_b) begin
                special_case_s0 <= 1;
                special_result_s0 <= {sign_b_wire_s0, {EWIDTH{1'b1}}, {MWIDTH{1'b0}}};
                special_fex_s0 <= 3'b000;
            end
            else if (iszero_a && iszero_b) begin
                special_case_s0 <= 1;
                special_result_s0 <= {(sign_a_wire_s0 & sign_b_wire_s0), {EWIDTH{1'b0}}, {MWIDTH{1'b0}}};
                special_fex_s0 <= 3'b000;
            end
            else if (iszero_a) begin
                special_case_s0 <= 1;
                special_result_s0 <= input_b_s0;
                special_fex_s0 <= 3'b000;
            end
            else if (iszero_b) begin
                special_case_s0 <= 1;
                special_result_s0 <= input_a_s0;
                special_fex_s0 <= 3'b000;
            end
            else begin
                special_case_s0 <= 0;
                special_result_s0 <= 0;
                special_fex_s0 <= 0;
            end
        end
    end

    // Stage 1: Mantissa alignment based on exponent difference
    reg signed [EWIDTH:0] expdiff_s1;
    reg [MWIDTH + 4 : 0] mana_imm_s1, manb_imm_s1;
    reg [EWIDTH-1:0] max_exp_s1;
    reg sign_a_s1, sign_b_s1;
    reg special_case_s1;
    reg [DWIDTH-1:0] special_result_s1;
    reg [2:0] special_fex_s1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            expdiff_s1 <= 0;
            mana_imm_s1 <= 0;
            manb_imm_s1 <= 0;
            max_exp_s1 <= 0;
            sign_a_s1 <= 0;
            sign_b_s1 <= 0;
            special_case_s1 <= 0;
            special_result_s1 <= 0;
            special_fex_s1 <= 0;
        end else begin
            expdiff_s1 <= expa_wire_s0 - expb_wire_s0;
            sign_a_s1 <= sign_a_wire_s0;
            sign_b_s1 <= sign_b_wire_s0;
            special_case_s1 <= special_case_s0;
            special_result_s1 <= special_result_s0;
            special_fex_s1 <= special_fex_s0;

            if (expdiff_s1 < 0) begin
                mana_imm_s1 <= ({1'b0, mana_full, 2'b0} >> (-expdiff_s1));
                manb_imm_s1 <= {1'b0, manb_full, 2'b0};
                max_exp_s1 <= expb_wire_s0;
            end
            else begin
                manb_imm_s1 <= ({1'b0, manb_full, 2'b0} >> expdiff_s1);
                mana_imm_s1 <= {1'b0, mana_full, 2'b0};
                max_exp_s1 <= expa_wire_s0;
            end
        end
    end

    // Stage 2: Addition/Subtraction
    reg [MWIDTH + 5:0] man_result_s2;
    reg [EWIDTH-1:0] exp_result_s2;
    reg sign_result_s2;
    reg special_case_s2;
    reg [DWIDTH-1:0] special_result_s2;
    reg [2:0] special_fex_s2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            man_result_s2 <= 0;
            exp_result_s2 <= 0;
            sign_result_s2 <= 0;
            special_case_s2 <= 0;
            special_result_s2 <= 0;
            special_fex_s2 <= 0;
        end else begin
            special_case_s2 <= special_case_s1;
            special_result_s2 <= special_result_s1;
            special_fex_s2 <= special_fex_s1;
            exp_result_s2 <= max_exp_s1;

            if (sign_a_s1 == sign_b_s1) begin
                man_result_s2 <= mana_imm_s1 + manb_imm_s1;
                sign_result_s2 <= sign_a_s1;
            end else begin
                if (mana_imm_s1 >= manb_imm_s1) begin
                    man_result_s2 <= mana_imm_s1 - manb_imm_s1;
                    sign_result_s2 <= sign_a_s1;
                end else begin
                    man_result_s2 <= manb_imm_s1 - mana_imm_s1;
                    sign_result_s2 <= sign_b_s1;
                end
            end
        end
    end

    // Stage 3: Normalization
    reg [MWIDTH + 5:0] man_normalized_s3;
    reg [EWIDTH-1:0] exp_normalized_s3;
    reg sign_result_s3;
    reg special_case_s3;
    reg [DWIDTH-1:0] special_result_s3;
    reg [2:0] special_fex_s3;
    
    function [5:0] count_leading_zeros;
        input [MWIDTH+5:0] mantissa;
        integer j;
        reg found;
        begin
            count_leading_zeros = 0;
            found = 0;
            for (j = MWIDTH + 5; j >= 0; j = j - 1) begin
                if (mantissa[j] && !found) begin
                    count_leading_zeros = (MWIDTH + 5) - j;
                    found = 1;
                end else if ((j == 0) && !found) begin
                    count_leading_zeros = MWIDTH + 6;
                end
            end
            count_leading_zeros = count_leading_zeros - 1;
        end
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            man_normalized_s3 <= 0;
            exp_normalized_s3 <= 0;
            sign_result_s3 <= 0;
            special_case_s3 <= 0;
            special_result_s3 <= 0;
            special_fex_s3 <= 0;
        end else begin
            special_case_s3 <= special_case_s2;
            special_result_s3 <= special_result_s2;
            special_fex_s3 <= special_fex_s2;
            sign_result_s3 <= sign_result_s2;

            if (man_result_s2 == 0) begin
                // Result is zero
                man_normalized_s3 <= 0;
                exp_normalized_s3 <= 0;
            end else if (man_result_s2[MWIDTH + 5]) begin
                // Overflow, shift right
                man_normalized_s3 <= man_result_s2 >> 1;
                exp_normalized_s3 <= exp_result_s2 + 1;
            end else if (!man_result_s2[MWIDTH + 4]) begin
                // Underflow, shift left
                man_normalized_s3 <= man_result_s2 << count_leading_zeros(man_result_s2);
                exp_normalized_s3 <= exp_result_s2 - count_leading_zeros(man_result_s2);
            end else begin
                // Normal case
                man_normalized_s3 <= man_result_s2;
                exp_normalized_s3 <= exp_result_s2;
            end
        end
    end
    reg round_bit, sticky_bit, guard_bit, round_up;
    reg [MWIDTH-1:0] final_mantissa;

    // Stage 4: Rounding and final result
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 0;
            fex <= 0;
            done <= 0;
        end else begin
            // Done signal indicates when result is valid
            done <= valid_s4;
            
            if (valid_s4) begin
                if (special_case_s3) begin
                    sum <= special_result_s3;
                    fex <= special_fex_s3;
                end else begin
                    // check for exceptions
                    if (exp_normalized_s3 >= {EWIDTH{1'b1}}) begin
                        // overflow
                        sum <= {sign_result_s3, {EWIDTH{1'b1}}, {MWIDTH{1'b0}}};
                        fex <= 3'b100; 
                    end else if (exp_normalized_s3 == 0) begin
                        // Underflow
                        sum <= {sign_result_s3, {EWIDTH{1'b0}}, {MWIDTH{1'b0}}};
                        fex <= 3'b010;
                    end else begin
                        // Normal result with rounding
                        round_bit = man_normalized_s3[2];
                        sticky_bit = |man_normalized_s3[1:0];
                        guard_bit = man_normalized_s3[3];
                        round_up = round_bit & (guard_bit | sticky_bit);
                        
                        final_mantissa = man_normalized_s3[MWIDTH+3:4] + round_up;
                        sum <= {sign_result_s3, exp_normalized_s3, final_mantissa};
                        fex <= (round_up) ? 3'b001 : 3'b000;
                    end
                end
            end
        end
    end

endmodule