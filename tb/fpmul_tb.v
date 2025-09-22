`timescale 1ns / 1ps

module fpmul_tb;
    // Parameters
    parameter DWIDTH = 32;
    parameter EWIDTH = 8;
    parameter MWIDTH = 23;
    parameter CLK_PERIOD = 10;

    // Testbench signals
    reg clk;
    reg rst;
    reg valid;
    reg [DWIDTH-1:0] a, b;
    wire [DWIDTH-1:0] sum;
    wire [2:0] fex;
    wire done;

    integer i;

    // DUT instantiation
    fpmul #(
        .DWIDTH(DWIDTH),
        .EWIDTH(EWIDTH),
        .MWIDTH(MWIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .valid(valid),
        .a(a),
        .b(b),
        .result(sum),
        .fex(fex),
        .done(done)
    );

    // Clock
    always #(CLK_PERIOD/2) clk = ~clk;

    // Some normal inputs (decimal → IEEE-754 hex)
    reg [31:0] test_a [0:9];
    reg [31:0] test_b [0:9];
    reg [31:0] expected [0:9];

    initial begin
        // Example normal numbers
        test_a[0] = 32'h3F800000; test_b[0] = 32'h40000000; expected[0] = 32'h40000000; // 1 * 2 = 2
        test_a[1] = 32'h40490FDB; test_b[1] = 32'h3F800000; expected[1] = 32'h40490FDB; // pi * 1 = pi
        test_a[2] = 32'h40000000; test_b[2] = 32'h40400000; expected[2] = 32'h40C00000; // 2 * 3 = 6
        test_a[3] = 32'h41200000; test_b[3] = 32'h3F800000; expected[3] = 32'h41200000; // 10 * 1 = 10
        test_a[4] = 32'h3F000000; test_b[4] = 32'h3F800000; expected[4] = 32'h3F000000; // 0.5 * 1 = 0.5
        test_a[5] = 32'h3EAAAAAB; test_b[5] = 32'h3F800000; expected[5] = 32'h3EAAAAAB; // 0.3333 * 1 = 0.3333
        test_a[6] = 32'h40400000; test_b[6] = 32'h40400000; expected[6] = 32'h41100000; // 3 * 3 = 9
        test_a[7] = 32'h40A00000; test_b[7] = 32'h3F800000; expected[7] = 32'h40A00000; // 5 * 1 = 5
        test_a[8] = 32'h3FCCCCCD; test_b[8] = 32'h3F4CCCCD; expected[8] = 32'h3F9D70A4; // 1.6 * 0.8 ≈ 1.28
        test_a[9] = 32'h40700000; test_b[9] = 32'h3F800000; expected[9] = 32'h40700000; // 3.75 * 1 = 3.75
    end

    // Simulation
    initial begin
        clk = 0; rst = 1; valid = 0; a = 0; b = 0;
        #(CLK_PERIOD*3);
        rst = 0;

        for (i=0; i<10; i=i+1) begin
            a = test_a[i];
            b = test_b[i];
            valid = 1;
            @(posedge clk);
            valid = 0;

            // Wait for pipeline (3 cycles)
            repeat(3) @(posedge clk);

            $display("Test %0d: a=0x%08h, b=0x%08h -> product=0x%08h, expected=0x%08h, fex=%b", 
                      i, a, b, sum, expected[i], fex);

            if (sum !== expected[i])
                $display("  --> FAIL");
            else
                $display("  --> PASS");
        end

        $display("=== Testbench finished ===");
        $finish;
    end
endmodule
