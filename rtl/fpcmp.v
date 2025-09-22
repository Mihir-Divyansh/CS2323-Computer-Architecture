module fltcmp #(
    parameter DWIDTH = 32,
    parameter EWIDTH = 8,
    parameter MWIDTH = 23
)(
    input clk,
    input rst,
    input [DWIDTH-1:0] a,
    input [DWIDTH-1:0] b,
    output reg a_gt_b,
    output reg a_eq_b,
    output reg a_lt_b
);
    wire sign_a, sign_b;
    wire [EWIDTH-1:0] exp_a;
    wire [EWIDTH-1:0] exp_b;
    wire [MWIDTH-1:0] frac_a;
    wire [MWIDTH-1:0] frac_b;

    assign sign_a = a[DWIDTH-1];
    assign sign_b = b[DWIDTH-1];
    assign exp_a = a[DWIDTH-2:MWIDTH];
    assign exp_b = b[DWIDTH-2:MWIDTH];
    assign frac_a = a[MWIDTH-1:0];
    assign frac_b = b[MWIDTH-1:0];
    wire zero_a = (exp_a == 0) && (frac_a == 0);
    wire zero_b = (exp_b == 0) && (frac_b == 0);    
    wire nan_a = (exp_a == {EWIDTH{1'b1}}) && (frac_a != 0);   
    wire nan_b = (exp_b == {EWIDTH{1'b1}}) && (frac_b != 0);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_gt_b <= 0;
            a_eq_b <= 0;
            a_lt_b <= 0;
        end else begin
            if (nan_a || nan_b) begin
                a_gt_b = 0;
                a_eq_b = 0;
                a_lt_b = 0;
            end else begin
                if (exp_a != exp_b) begin
                    if (sign_a == 0) begin
                        a_gt_b = (exp_a > exp_b);
                        a_lt_b = (exp_a < exp_b);
                    end else begin
                        a_gt_b = (exp_a < exp_b);
                        a_lt_b = (exp_a > exp_b);
                    end
                end else begin
                    if (sign_a == 0) begin
                        a_gt_b = (frac_a > frac_b);
                        a_lt_b = (frac_a < frac_b);
                    end else begin
                        a_gt_b = (frac_a < frac_b);
                        a_lt_b = (frac_a > frac_b);
                    end
                end
            end
            a_eq_b = ~(a_gt_b | a_lt_b);
        end
    end
endmodule