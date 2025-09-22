// `timescale 1ns/1ps

// module fpadd_tb;

//     parameter DWIDTH = 32;
//     parameter EWIDTH = 8;
//     parameter MWIDTH = 23;

//     reg clk, rst, valid;
//     reg [DWIDTH-1:0] a, b;
//     wire [DWIDTH-1:0] sum;
//     wire [2:0] fex;
//     wire done;

//     // Instantiate DUT
//     fpadd #(
//         .DWIDTH(DWIDTH),
//         .EWIDTH(EWIDTH),
//         .MWIDTH(MWIDTH)
//     ) dut (
//         .clk(clk),
//         .rst(rst),
//         .valid(valid),
//         .a(a),
//         .b(b),
//         .sum(sum),
//         .fex(fex),
//         .done(done)
//     );

//     // Clock generation
//     initial begin
//         clk = 0;
//         forever #5 clk = ~clk;   // 100 MHz clock
//     end

//     // Stimulus
//     initial begin
//         $display("==== Floating Point Adder Testbench ====");
//         $dumpfile("fpadd_tb.vcd");
//         $dumpvars(0, fpadd_tb);

//         rst = 1;
//         valid = 0;
//         a = 0;
//         b = 0;

//         #20 rst = 0;

//         // Test 1: Normal numbers
//         valid = 1;
//         a = 32'h41dab852; // 27.34
//         b = 32'h420551ec; // 33.33
//         #20 valid = 0;
//         #50 $display("a=27.34, b=33.32, sum=0x%h, fex=%b", sum, fex);

//         // Test 2: Zero + Normal
//         valid = 1;
//         a = 32'hBF800000; // -1.0
//         b = 32'h3F800000; // 1.0
//         #20 valid = 0;
//         #50 $display("a=0.0, b=1.0, sum=0x%h, fex=%b", sum, fex);

//         // Test 3: Inf + Normal
//         valid = 1;
//         a = 32'h7F800000; // +Inf
//         b = 32'h40000000; // 2.0
//         #20 valid = 0;
//         #50 $display("a=+Inf, b=2.0, sum=0x%h, fex=%b", sum, fex);

//         // Test 4: NaN + Number
//         valid = 1;
//         a = 32'h7FC00001; // NaN
//         b = 32'h40400000; // 3.0
//         #20 valid = 0;
//         #50 $display("a=NaN, b=3.0, sum=0x%h, fex=%b", sum, fex);

//         // Test 5: Both zeros
//         valid = 1;
//         a = 32'h00000000; // 0.0
//         b = 32'h80000000; // -0.0
//         #20 valid = 0;
//         #50 $display("a=+0.0, b=-0.0, sum=0x%h, fex=%b", sum, fex);

//         // Test 6: Very small + very large
//         valid = 1;
//         a = 32'h00800000; // Smallest positive normal (1.175494e-38)
//         b = 32'h7F7FFFFF; // Largest finite float (3.402823e+38)
//         #20 valid = 0;
//         #50 $display("a=smallest normal, b=largest normal, sum=0x%h, fex=%b", sum, fex);

//         // Test 7: Subnormal + normal
//         valid = 1;
//         a = 32'h00000001; // Smallest positive subnormal
//         b = 32'h3F800000; // 1.0
//         #20 valid = 0;
//         #50 $display("a=subnormal, b=1.0, sum=0x%h, fex=%b", sum, fex);

//         // Test 8: Opposite large values (cancellation)
//         valid = 1;
//         a = 32'h7F7FFFFF; // Largest positive normal
//         b = 32'hFF7FFFFF; // Largest negative normal
//         #20 valid = 0;
//         #50 $display("a=largest +ve, b=largest -ve, sum=0x%h, fex=%b", sum, fex);

//         // Test 9: Numbers differing by 1 ULP
//         valid = 1;
//         a = 32'h3F800000; // 1.0
//         b = 32'h3F800001; // 1.0000001 (next representable float)
//         #20 valid = 0;
//         #50 $display("a=1.0, b=1.0+ULP, sum=0x%h, fex=%b", sum, fex);

//         // Test 10: Negative zero + positive zero
//         valid = 1;
//         a = 32'h4513076D; // SOME NUMBER
//         b = 32'h48653BDD; // some other number
//         #20 valid = 0;
//         #50 $display("a=some num, b=some other num, sum=0x%h, fex=%b", sum, fex);

//         // Test 11: Inf + Inf (same sign)
//         valid = 1;
//         a = 32'h7F800000; // +Inf
//         b = 32'h7F800000; // +Inf
//         #20 valid = 0;
//         #50 $display("a=+Inf, b=+Inf, sum=0x%h, fex=%b", sum, fex);

//         // Test 12: Inf + Inf (opposite sign)
//         valid = 1;
//         a = 32'h7F800000; // +Inf
//         b = 32'hFF800000; // -Inf
//         #20 valid = 0;
//         #50 $display("a=+Inf, b=-Inf, sum=0x%h, fex=%b", sum, fex);

//         // Test 13: NaN + NaN
//         valid = 1;
//         a = 32'h7FC00000; // NaN
//         b = 32'h7FC00001; // NaN
//         #20 valid = 0;
//         #50 $display("a=NaN, b=NaN, sum=0x%h, fex=%b", sum, fex);

//         // Test 14: Large positive + small negative (no cancellation)
//         valid = 1;
//         a = 32'h7F7FFFFF; // Largest positive normal
//         b = 32'hBFC00000; // -1.5
//         #20 valid = 0;
//         #50 $display("a=largest +ve, b=-1.5, sum=0x%h, fex=%b", sum, fex);

//         // Test 15: 1.0 + 1.0 + ULP
//         valid = 1;
//         a = 32'h3F800000; // 1.0
//         b = 32'h3F800001; // 1.0 + ULP
//         #20 valid = 0;
//         #50 $display("a=1.0, b=1.0+ULP, sum=0x%h, fex=%b", sum, fex);

//         #100 $finish;
//     end

// endmodule


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
            $display("| %-20s | Single: sum=0x%h fex=%b | Double: sum=0x%h fex=%b |",
                     name, sum_s, fex_s, sum_d, fex_d);
        end
    endtask

    // Stimulus
    initial begin
        $display("==== Floating Point Adder Testbench (Single + Double) ====");
        $dumpfile("fpadd_tb.vcd");
        $dumpvars(0, fpadd_tb);

        rst = 1;
        valid = 0;
        a_s = 0; b_s = 0;
        a_d = 0; b_d = 0;

        #20 rst = 0;

        // Test 1: Normal numbers
        valid = 1;
        a_s = 32'h41dab852; a_d = 64'h403b570a3d70a3d7; // 27.34
        b_s = 32'h420551ec; b_d = 64'h4040a3d70a3d70a4; // 33.33
        #20 valid = 0; #50 print_result("Normal + Normal");

        // Test 2: Zero + Normal
        valid = 1;
        a_s = 32'hBF800000; a_d = 64'h412a4f6eaf33226c; // 862135.342187
        b_s = 32'h3F800000; b_d = 64'hc12a4f6aaf33226c; // -862133.342187
        #20 valid = 0; #50 print_result("Zero + Normal");

        // Test 3: Inf + Normal
        valid = 1;
        a_s = 32'h7F800000; a_d = 64'h7FF0000000000000; // +Inf
        b_s = 32'h40000000; b_d = 64'h4000000000000000; // 2.0
        #20 valid = 0; #50 print_result("Inf + Normal");

        // Test 4: NaN + Number
        valid = 1;
        a_s = 32'h7FC00001; a_d = 64'h7FF8000000000001; // NaN
        b_s = 32'h40400000; b_d = 64'h4008000000000000; // 3.0
        #20 valid = 0; #50 print_result("NaN + Number");

        // Test 5: Both zeros
        valid = 1;
        a_s = 32'h00000000; a_d = 64'h0000000000000000; // +0
        b_s = 32'h80000000; b_d = 64'h8000000000000000; // -0
        #20 valid = 0; #50 print_result("Zero + Zero");

        // Test 6: Very small + very large
        valid = 1;
        a_s = 32'h00800000; a_d = 64'h0010000000000000; // smallest normal
        b_s = 32'h7F7FFFFF; b_d = 64'h7FEFFFFFFFFFFFFF; // largest normal
        #20 valid = 0; #50 print_result("Smallest + Largest");

        // Test 7: Subnormal + normal
        valid = 1;
        a_s = 32'h00000001; a_d = 64'h0000000000000001; // smallest subnormal
        b_s = 32'h3F800000; b_d = 64'h3FF0000000000000; // 1.0
        #20 valid = 0; #50 print_result("Subnormal + Normal");

        // Test 8: Cancellation
        valid = 1;
        a_s = 32'h7F7FFFFF; a_d = 64'h7FEFFFFFFFFFFFFF; // +max
        b_s = 32'hFF7FFFFF; b_d = 64'hFFEFFFFFFFFFFFFF; // -max
        #20 valid = 0; #50 print_result("Cancellation");

        // Test 9: Numbers differing by 1 ULP
        valid = 1;
        a_s = 32'h3F800000; a_d = 64'h3FF0000000000000; // 1.0
        b_s = 32'h3F800001; b_d = 64'h3FF0000000000001; // 1.0 + ULP
        #20 valid = 0; #50 print_result("1.0 + 1.0+ULP");

        // Test 10: Inf + Inf (same sign)
        valid = 1;
        a_s = 32'h7F800000; a_d = 64'h7FF0000000000000; // +Inf
        b_s = 32'h7F800000; b_d = 64'h7FF0000000000000; // +Inf
        #20 valid = 0; #50 print_result("Inf + Inf same sign");

        // Test 11: Inf + Inf (opposite sign)
        valid = 1;
        a_s = 32'h7F800000; a_d = 64'h7FF0000000000000; // +Inf
        b_s = 32'hFF800000; b_d = 64'hFFF0000000000000; // -Inf
        #20 valid = 0; #50 print_result("Inf + -Inf");

        // Test 12: NaN + NaN
        valid = 1;
        a_s = 32'h7FC00000; a_d = 64'h7FF8000000000000; // NaN
        b_s = 32'h7FC00001; b_d = 64'h7FF8000000000001; // NaN
        #20 valid = 0; #50 print_result("NaN + NaN");

        #100 $finish;
    end
endmodule
