`timescale 1ns/1ps

module fpadd_tb;

    // Parameters for single and double
    parameter DWIDTH_S = 32;
    parameter EWIDTH_S = 8;
    parameter MWIDTH_S = 23;

    parameter DWIDTH_D = 64;
    parameter EWIDTH_D = 11;
    parameter MWIDTH_D = 52;

    reg clk, rst, valid;
    reg [DWIDTH_S-1:0] a_s, b_s;
    reg [DWIDTH_D-1:0] a_d, b_d;
    wire [DWIDTH_S-1:0] sum_s;
    wire [DWIDTH_D-1:0] sum_d;
    wire [2:0] fex_s, fex_d;
    wire done_s, done_d;

    // Instantiate DUT (single precision)
    fpadd #(
        .DWIDTH(DWIDTH_S),
        .EWIDTH(EWIDTH_S),
        .MWIDTH(MWIDTH_S)
    ) dut_single (
        .clk(clk), .rst(rst), .valid(valid),
        .a(a_s), .b(b_s),
        .sum(sum_s), .fex(fex_s), .done(done_s)
    );

    // Instantiate DUT (double precision)
    fpadd #(
        .DWIDTH(DWIDTH_D),
        .EWIDTH(EWIDTH_D),
        .MWIDTH(MWIDTH_D)
    ) dut_double (
        .clk(clk), .rst(rst), .valid(valid),
        .a(a_d), .b(b_d),
        .sum(sum_d), .fex(fex_d), .done(done_d)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 100 MHz
    end

    // Helper task for printing results
    task print_result;
        input [1023:0] name;
        begin
            $display("| %-25s | Single: sum=0x%h fex=%b | Double: sum=0x%h fex=%b |",
                     name, sum_s, fex_s, sum_d, fex_d);
        end
    endtask

    // Stimulus
    initial begin
        $display("==== Floating Point Adder Testbench (Regular Numbers Only) ====");
        $dumpfile("fpadd_tb.vcd");
        $dumpvars(0, fpadd_tb);

        rst = 1;
        valid = 0;
        a_s = 0; b_s = 0;
        a_d = 0; b_d = 0;

        #20 rst = 0;

        // Regular number tests only
        // Test 1
        valid = 1;
        a_s = 32'h41200000; a_d = 64'h4034000000000000; // 10.0
        b_s = 32'h41600000; b_d = 64'h4039000000000000; // 14.0
        #20 valid = 0; #50 print_result("10.0 + 14.0");

        // Test 2
        valid = 1;
        a_s = 32'h42200000; a_d = 64'h4044000000000000; // 40.0
        b_s = 32'h42A00000; b_d = 64'h404E000000000000; // 80.0
        #20 valid = 0; #50 print_result("40.0 + 80.0");

        // Test 3
        valid = 1;
        a_s = 32'h3F800000; a_d = 64'h3FF0000000000000; // 1.0
        b_s = 32'h40000000; b_d = 64'h4000000000000000; // 2.0
        #20 valid = 0; #50 print_result("1.0 + 2.0");

        // Test 4
        valid = 1;
        a_s = 32'h42700000; a_d = 64'h4055000000000000; // 60.0
        b_s = 32'h42F00000; b_d = 64'h4062000000000000; // 120.0
        #20 valid = 0; #50 print_result("60.0 + 120.0");

        // Test 5
        valid = 1;
        a_s = 32'h447A0000; a_d = 64'h40E4000000000000; // 1000.0
        b_s = 32'h44FA0000; b_d = 64'h4113880000000000; // 2000.5
        #20 valid = 0; #50 print_result("1000.0 + 2000.5");

        // Test 6
        valid = 1;
        a_s = 32'h461C4000; a_d = 64'h412E848000000000; // 10000.0
        b_s = 32'h469C4000; b_d = 64'h4173880000000000; // 20000.0
        #20 valid = 0; #50 print_result("10000.0 + 20000.0");

        // Test 7
        valid = 1;
        a_s = 32'h3FA66666; a_d = 64'h3FF199999999999A; // 1.3
        b_s = 32'h40266666; b_d = 64'h4004CCCCCCCCCCCD; // 2.6
        #20 valid = 0; #50 print_result("1.3 + 2.6");

        // Test 8
        valid = 1;
        a_s = 32'h40A00000; a_d = 64'h4014000000000000; // 5.0
        b_s = 32'hC0A00000; b_d = 64'hC014000000000000; // -5.0
        #20 valid = 0; #50 print_result("5.0 + -5.0");

        // Test 9
        valid = 1;
        a_s = 32'hC1200000; a_d = 64'hC034000000000000; // -10.0
        b_s = 32'h41600000; b_d = 64'h4039000000000000; // 14.0
        #20 valid = 0; #50 print_result("-10.0 + 14.0");

        // Test 10
        valid = 1;
        a_s = 32'hC2480000; a_d = 64'hC045000000000000; // -50.0
        b_s = 32'h41A00000; b_d = 64'h403A000000000000; // 20.0
        #20 valid = 0; #50 print_result("-50.0 + 20.0");

        #100 $finish;
    end
endmodule
