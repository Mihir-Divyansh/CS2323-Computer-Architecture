`timescale 1ns / 1ps

module tb_fputop();
    // Clock and reset
    reg clk;
    reg rst;
    
    // DUT inputs
    reg [23:0] ins;
    reg [63:0] dbus;
    
    // DUT outputs
    wire [63:0] result;
    wire [2:0] fex;
    wire [2:0] flags;
    wire [8:0] draddr;
    wire [8:0] wraddr;
    wire [63:0] wrdata;
    wire [31:0] bus1;
    assign {fex, flags, draddr, wraddr} = bus1[31:8];
    // Test variables
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // DUT instantiation
    fputop dut (
        .clk(clk),
        .rst(rst),
        .ins(ins),
        .dbus_high(dbus[63:32]),
        .dbus_low(dbus[31:0]),
        .result_low(result[31:0]),
        .result_high(result[63:32]),
        .bus1(bus1),
        .wrdata_high(wrdata[63:32]),
        .wrdata_low(wrdata[31:0])
    );
    
    // Clock generation
    always #7 clk = ~clk;
    
    // Test data - IEEE 754 format
    localparam [31:0] FLOAT_1_0   = 32'h3F800000; // 1.0
    localparam [31:0] FLOAT_2_0   = 32'h40000000; // 2.0
    localparam [31:0] FLOAT_3_0   = 32'h40400000; // 3.0
    localparam [31:0] FLOAT_0_5   = 32'h3F000000; // 0.5
    localparam [31:0] FLOAT_NEG_1 = 32'hBF800000; // -1.0
    localparam [31:0] FLOAT_ZERO  = 32'h00000000; // 0.0
    
    localparam [63:0] DOUBLE_1_0   = 64'h3FF0000000000000; // 1.0
    localparam [63:0] DOUBLE_2_0   = 64'h4000000000000000; // 2.0
    localparam [63:0] DOUBLE_3_0   = 64'h4008000000000000; // 3.0
    localparam [63:0] DOUBLE_0_5   = 64'h3FE0000000000000; // 0.5
    localparam [63:0] DOUBLE_NEG_1 = 64'hBFF0000000000000; // -1.0
    localparam [63:0] DOUBLE_ZERO  = 64'h0000000000000000; // 0.0
    
    // Instruction encoding helper task
    task encode_r_type;
        input [4:0] opcode;
        input [4:0] rs1;
        input [4:0] rs2;
        input [4:0] rd;
        begin
            ins = {opcode, rs1, rs2, 4'b0000, rd};
        end
    endtask
    
    task encode_store;
        input [4:0] opcode;
        input [4:0] rs1;
        input [4:0] rs2;
        input [8:0] imm;
        begin
            ins = {opcode, rs1, rs2, imm};
        end
    endtask
    
    task encode_load;
        input [4:0] opcode;
        input [4:0] rs1;
        input [8:0] imm;
        input [4:0] rd;
        begin
            ins = {opcode, rs1, imm, rd};
        end
    endtask
    
    // Opcode definitions based on specification
    // Bit 4 (MSB): precision (0=single, 1=double)
    // Bit 3 (sw): operation set (0=add/sub/mul, 1=ld/sd/cmp)
    // Bits 2,1,0: one-hot encoding for operations
    localparam [4:0] FADD_S  = 5'b00100; // Single precision add
    localparam [4:0] FSUB_S  = 5'b00010; // Single precision sub
    localparam [4:0] FMUL_S  = 5'b00001; // Single precision mul
    localparam [4:0] FADD_D  = 5'b10100; // Double precision add
    localparam [4:0] FSUB_D  = 5'b10010; // Double precision sub
    localparam [4:0] FMUL_D  = 5'b10001; // Double precision mul
    localparam [4:0] FLD_S   = 5'b01100; // Single precision load
    localparam [4:0] FSD_S   = 5'b01010; // Single precision store
    localparam [4:0] FCMP_S  = 5'b01001; // Single precision compare
    localparam [4:0] FLD_D   = 5'b11100; // Double precision load
    localparam [4:0] FSD_D   = 5'b11010; // Double precision store
    localparam [4:0] FCMP_D  = 5'b11001; // Double precision compare
    
    // 
    // 01100 00001 000000000 00010
    // 01010 00010 000000000 00000
    // 00100 000010 00010 0000 00010
    // Test result checking task
    task check_result;
        input [63:0] expected;
        input string test_name;
        begin
            test_count = test_count + 1;
            if (result == expected) begin
                $display("PASS: %s - Expected: %h, Got: %h", test_name, expected, result);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL: %s - Expected: %h, Got: %h", test_name, expected, result);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    task check_flags;
        input [2:0] expected;
        input string test_name;
        begin
            test_count = test_count + 1;
            if (flags == expected) begin
                $display("PASS: %s - Expected flags: %b, Got: %b", test_name, expected, flags);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL: %s - Expected flags: %b, Got: %b", test_name, expected, flags);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // Initialize register with value
    task init_register;
        input [4:0] reg_addr;
        input [63:0] value;
        input is_double;
        begin
            // Load value into register
            dbus = value;
            if (is_double)
                encode_load(FLD_D, 5'b00000, 9'b000000000, reg_addr);
            else
                encode_load(FLD_S, 5'b00000, 9'b000000000, reg_addr);
            @(posedge clk); // Issue the load instruction
            @(posedge clk); // Wait for load to complete (1 cycle)
            @(posedge clk); // Additional cycle to ensure register is updated
        end
    endtask
    
    initial begin
        // VCD dump setup
        $dumpfile("fpu_testbench.vcd");
        $dumpvars(0, tb_fputop);
        
        // Initialize
        clk = 0;
        rst = 1;
        ins = 24'b0;
        dbus = 64'b0;
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        
        $display("=== FPU Testbench Starting ===");
        
        // Reset sequence
        #20;
        rst = 0;
        #20;
        
        // Test 1: Single Precision Load/Store
        $display("\n--- Testing Single Precision Load/Store ---");
        dbus = {32'h00000000, FLOAT_2_0}; // 2.0 in lower 32 bits
        encode_load(FLD_S, 5'b00000, 9'h100, 5'b00001); // Load 2.0 into R1
        @(posedge clk);
        @(posedge clk); // Wait for load to complete
        
        // Store R1 to memory address 0x050
        encode_store(FSD_S, 5'b00001, 5'b00000, 9'h050);
        @(posedge clk); // Wait for store to complete
        @(posedge clk); // Check results after completion
        if (wraddr == 9'h050 && wrdata[31:0] == FLOAT_2_0) begin
            $display("PASS: Single precision store - Address: %h, Data: %h", wraddr, wrdata[31:0]);
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL: Single precision store - Expected addr: %h data: %h, Got addr: %h data: %h", 
                     9'h050, FLOAT_2_0, wraddr, wrdata[31:0]);
            fail_count = fail_count + 1;
        end
        test_count = test_count + 1;
        
        // Test 2: Double Precision Load/Store  
        $display("\n--- Testing Double Precision Load/Store ---");
        dbus = DOUBLE_3_0; // 3.0
        encode_load(FLD_D, 5'b00000, 9'h200, 5'b00010); // Load 3.0 into R2
        @(posedge clk);
        @(posedge clk); // Wait for load to complete
        
        // Store R2 to memory address 0x060
        encode_store(FSD_D, 5'b00010, 5'b00000, 9'h060);
        @(posedge clk); // Wait for store to complete
        @(posedge clk); // Check results after completion
        if (wraddr == 9'h060 && wrdata == DOUBLE_3_0) begin
            $display("PASS: Double precision store - Address: %h, Data: %h", wraddr, wrdata);
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL: Double precision store - Expected addr: %h data: %h, Got addr: %h data: %h", 
                     9'h060, DOUBLE_3_0, wraddr, wrdata);
            fail_count = fail_count + 1;
        end
        test_count = test_count + 1;
        
        // Initialize test registers
        $display("\n--- Initializing Test Registers ---");
        init_register(5'b00001, {32'h00000000, FLOAT_2_0}, 0);   // R1 = 2.0 (single)
        init_register(5'b00010, {32'h00000000, FLOAT_1_0}, 0);   // R2 = 1.0 (single) 
        init_register(5'b00011, DOUBLE_2_0, 1);                  // R3 = 2.0 (double)
        init_register(5'b00100, DOUBLE_1_0, 1);                  // R4 = 1.0 (double)
        init_register(5'b00101, {32'h00000000, FLOAT_0_5}, 0);   // R5 = 0.5 (single)
        init_register(5'b00110, DOUBLE_0_5, 1);                  // R6 = 0.5 (double)
        
        // Test 3: Single Precision Addition
        $display("\n--- Testing Single Precision Addition ---");
        encode_r_type(FADD_S, 5'b00001, 5'b00010, 5'b00111); // R7 = R1 + R2 = 2.0 + 1.0 = 3.0
        @(posedge clk);
        repeat(8) @(posedge clk); // Wait for ADD pipeline (4 stages + 3 initial delay + 1 for result)
        check_result({32'h00000000, FLOAT_3_0}, "Single ADD 2.0 + 1.0");
        
        // Test 4: Single Precision Subtraction
        $display("\n--- Testing Single Precision Subtraction ---");
        encode_r_type(FSUB_S, 5'b00001, 5'b00010, 5'b01000); // R8 = R1 - R2 = 2.0 - 1.0 = 1.0
        @(posedge clk);
        repeat(8) @(posedge clk); // Wait for ADD pipeline (4 stages + 3 initial delay + 1 for result)
        check_result({32'h00000000, FLOAT_1_0}, "Single SUB 2.0 - 1.0");
        
        // Test 5: Single Precision Multiplication
        $display("\n--- Testing Single Precision Multiplication ---");
        encode_r_type(FMUL_S, 5'b00001, 5'b00101, 5'b01001); // R9 = R1 * R5 = 2.0 * 0.5 = 1.0
        @(posedge clk);
        repeat(8) @(posedge clk); // Wait for MUL pipeline (5 stages + 3 initial delay)
        check_result({32'h00000000, FLOAT_1_0}, "Single MUL 2.0 * 0.5");
        
        // Test 6: Double Precision Addition
        $display("\n--- Testing Double Precision Addition ---");
        encode_r_type(FADD_D, 5'b00011, 5'b00100, 5'b01010); // R10 = R3 + R4 = 2.0 + 1.0 = 3.0
        @(posedge clk);
        repeat(8) @(posedge clk); // Wait for ADD pipeline (4 stages + 3 initial delay + 1 for result)
        check_result(DOUBLE_3_0, "Double ADD 2.0 + 1.0");
        
        // Test 7: Double Precision Subtraction  
        $display("\n--- Testing Double Precision Subtraction ---");
        encode_r_type(FSUB_D, 5'b00011, 5'b00100, 5'b01011); // R11 = R3 - R4 = 2.0 - 1.0 = 1.0
        @(posedge clk);
        repeat(8) @(posedge clk); // Wait for ADD pipeline (4 stages + 3 initial delay + 1 for result)
        check_result(DOUBLE_1_0, "Double SUB 2.0 - 1.0");
        
        // Test 8: Double Precision Multiplication
        $display("\n--- Testing Double Precision Multiplication ---");
        encode_r_type(FMUL_D, 5'b00011, 5'b00110, 5'b01100); // R12 = R3 * R6 = 2.0 * 0.5 = 1.0
        @(posedge clk);
        repeat(8) @(posedge clk); // Wait for MUL pipeline (5 stages + 3 initial delay)
        check_result(DOUBLE_1_0, "Double MUL 2.0 * 0.5");
        
        // Test 9: Single Precision Compare
        $display("\n--- Testing Single Precision Compare ---");
        
        // Test R1 > R2 (2.0 > 1.0) - should set gt flag
        encode_r_type(FCMP_S, 5'b00001, 5'b00010, 5'b00000); // Compare R1, R2
        @(posedge clk);
        repeat(2) @(posedge clk);
        check_flags(3'b100, "Single CMP 2.0 > 1.0 (gt flag)");
        
        // Test R2 < R1 (1.0 < 2.0) - should set lt flag  
        encode_r_type(FCMP_S, 5'b00010, 5'b00001, 5'b00000); // Compare R2, R1
        @(posedge clk);
        repeat(2) @(posedge clk);
        check_flags(3'b001, "Single CMP 1.0 < 2.0 (lt flag)");
        
        // Test R1 == R1 (2.0 == 2.0) - should set eq flag
        encode_r_type(FCMP_S, 5'b00001, 5'b00001, 5'b00000); // Compare R1, R1
        @(posedge clk);
        repeat(2) @(posedge clk);
        check_flags(3'b010, "Single CMP 2.0 == 2.0 (eq flag)");
        
        // Test 10: Double Precision Compare
        $display("\n--- Testing Double Precision Compare ---");
        
        // Test R3 > R4 (2.0 > 1.0) - should set gt flag
        encode_r_type(FCMP_D, 5'b00011, 5'b00100, 5'b00000); // Compare R3, R4
        @(posedge clk);
        repeat(2) @(posedge clk);
        check_flags(3'b100, "Double CMP 2.0 > 1.0 (gt flag)");
        
        // Test R4 < R3 (1.0 < 2.0) - should set lt flag
        encode_r_type(FCMP_D, 5'b00100, 5'b00011, 5'b00000); // Compare R4, R3
        @(posedge clk);
        repeat(2) @(posedge clk);
        check_flags(3'b001, "Double CMP 1.0 < 2.0 (lt flag)");
        
        // Test R3 == R3 (2.0 == 2.0) - should set eq flag
        encode_r_type(FCMP_D, 5'b00011, 5'b00011, 5'b00000); // Compare R3, R3
        @(posedge clk);
        repeat(2) @(posedge clk);
        check_flags(3'b010, "Double CMP 2.0 == 2.0 (eq flag)");
        
        // Test 11: Precision Mismatch Detection
        $display("\n--- Testing Precision Mismatch Detection ---");
        
        // Try to add single precision R1 with double precision R3 - should cause INV exception
        encode_r_type(FADD_S, 5'b00001, 5'b00011, 5'b01101); // R13 = R1 + R3 (mismatch)
        @(posedge clk);
        repeat(2) @(posedge clk);
        if (fex[2] == 1'b1) begin
            $display("PASS: Precision mismatch detected - INV exception set");
            pass_count = pass_count + 1;
        end else begin
            $display("FAIL: Precision mismatch not detected - INV exception should be set");
            fail_count = fail_count + 1;
        end
        test_count = test_count + 1;
        
        // Test 12: Pipeline Hazard Detection
        $display("\n--- Testing Pipeline Hazard Detection ---");
        
        // Test ADD followed by dependent operation
        $display("Testing ADD->MUL hazard...");
        encode_r_type(FADD_S, 5'b00001, 5'b00010, 5'b01110); // R14 = R1 + R2 (7 cycles total)
        @(posedge clk);
        
        // Immediately try to use R14 in a multiplication (should cause hazard/stall)
        encode_r_type(FMUL_S, 5'b01110, 5'b00101, 5'b01111); // R15 = R14 * R5 (7 cycles total)
        @(posedge clk);
        
        // The MUL should be stalled until ADD completes
        // Total time should be ADD latency + MUL latency = 7 + 7 = 14 cycles
        repeat(16) @(posedge clk); // Wait for both operations to complete (extra margin)
        
        // Verify the final result (should be 3.0 * 0.5 = 1.5)
        check_result({32'h00000000, 32'h3FC00000}, "Hazard test: (2.0+1.0)*0.5 = 1.5");
        
        // Test MUL followed by dependent ADD  
        $display("Testing MUL->ADD hazard...");
        encode_r_type(FMUL_S, 5'b00001, 5'b00101, 5'b10000); // R16 = R1 * R5 = 1.0 (7 cycles total)
        @(posedge clk);
        
        // Immediately try to use R16 in an addition (should cause hazard/stall)
        encode_r_type(FADD_S, 5'b10000, 5'b00010, 5'b10001); // R17 = R16 + R2 (7 cycles total)
        @(posedge clk);
        
        // Total time should be MUL latency + ADD latency = 7 + 7 = 14 cycles
        repeat(16) @(posedge clk); // Wait for both operations to complete (extra margin)
        
        // Verify the final result (should be 1.0 + 1.0 = 2.0)
        check_result({32'h00000000, FLOAT_2_0}, "Hazard test: (2.0*0.5)+1.0 = 2.0");
        
        $display("Pipeline hazard tests completed");
        
        // Test Summary
        $display("\n=== Test Summary ===");
        $display("Total Tests: %d", test_count);
        $display("Passed: %d", pass_count);
        $display("Failed: %d", fail_count);
        $display("Pass Rate: %.1f%%", (pass_count * 100.0) / test_count);
        
        if (fail_count == 0) begin
            $display("*** ALL TESTS PASSED ***");
        end else begin
            $display("*** SOME TESTS FAILED ***");
        end
        
        $finish;
    end
    
    // Monitor important signals
    initial begin
        $monitor("Time=%t, ins=%h, result=%h, fex=%b, flags=%b", 
                 $time, ins, result, fex, flags);
    end
    
endmodule