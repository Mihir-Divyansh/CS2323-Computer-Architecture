module fputop(
    input clk,
    input rst,
    input [23:0] ins,
    input [31:0] dbus_low,
    input [31:0] dbus_high,
    output [31:0] result_low,
    output [31:0] result_high,
    output [31:0] bus1,
    output [31:0] wrdata_low,
    output [31:0] wrdata_high
);
    reg [2:0] fex;
    reg [2:0] flags;
    reg [8:0] draddr;
    reg [8:0] wraddr;
    wire [63:0] dbus;
    reg [63:0] result;
    reg [63:0] wrdata;
    assign result_low = result[31:0];
    assign result_high = result[63:32];
    assign wrdata_low = wrdata[31:0];
    assign wrdata_high = wrdata[63:32];
    
    assign dbus = {dbus_high, dbus_low};
    assign bus1 = {fex, flags, draddr, wraddr, {8'b0}};
    // exceptions
    reg inv, inx, ovf, unf;
    reg double;
    
    reg [31:0] reg_precision_map;
    
    // valid signals
    reg add32_valid, add64_valid, mul32_valid, mul64_valid;
    

    reg [4:0] pending_dest_stage1, pending_dest_stage2, pending_dest_stage3, pending_dest_stage4, pending_dest_stage5;
    reg pending_write_stage1, pending_write_stage2, pending_write_stage3, pending_write_stage4, pending_write_stage5;
    reg pending_mul_stage1, pending_mul_stage2, pending_mul_stage3, pending_mul_stage4, pending_mul_stage5;
    reg pending_double_stage1, pending_double_stage2, pending_double_stage3, pending_double_stage4, pending_double_stage5;
    wire hazard_detected;
    
    wire precision_mismatch;
    wire rs1_is_double, rs2_is_double;
    
    // check if current instruction has a dependency on pending writes
    assign hazard_detected = (pending_write_stage1 && (rsel1 == pending_dest_stage1 || rsel2 == pending_dest_stage1)) ||
                           (pending_write_stage2 && (rsel1 == pending_dest_stage2 || rsel2 == pending_dest_stage2)) ||
                           (pending_write_stage3 && (rsel1 == pending_dest_stage3 || rsel2 == pending_dest_stage3)) ||
                           (pending_write_stage4 && (rsel1 == pending_dest_stage4 || rsel2 == pending_dest_stage4)) ||
                           (pending_write_stage5 && (rsel1 == pending_dest_stage5 || rsel2 == pending_dest_stage5));

    wire isAdd, isSub, isMul, isld, issd, iscmp, isDouble;
    wire [1:0] dest_sel;
    wire [4:0] rsel1, rsel2, dest;
    wire [8:0] imm;
    wire [31:0] a_single, b_single;
    wire [63:0] a_double, b_double;
    
    wire [31:0] add32_result, mul32_result;
    wire [63:0] add64_result, mul64_result;
    wire [2:0] fex_add32, fex_add64, fex_mul32, fex_mul64;
    
    wire a_gt_bs, a_eq_bs, a_lt_bs;
    wire a_gt_bd, a_eq_bd, a_lt_bd;

    assign rs1_is_double = reg_precision_map[rsel1];
    assign rs2_is_double = reg_precision_map[rsel2];
    
    // check for precision mismatch
    assign precision_mismatch = (isAdd || isSub || isMul || iscmp) && 
                               (rs1_is_double != rs2_is_double);

    insdec decoder (
        .ins(ins),
        .isAdd(isAdd),
        .isSub(isSub),
        .isMul(isMul),
        .isld(isld),
        .issd(issd),
        .iscmp(iscmp),
        .dest_sel(dest_sel),
        .isDouble(isDouble),
        .rs1(rsel1),
        .rs2(rsel2),
        .rd(dest),
        .imm(imm)
    );

    wire [63:0] rs1, rs2;
    wire [63:0] inRfile;

    regFile rFile (
        .clk(clk),
        .rst(rst),
        .data_out1(rs1),
        .data_out2(rs2),
        .dest(dest),
        .data_in(inRfile),
        .sel1(rsel1),
        .sel2(rsel2)
    );

    assign inRfile = result;

    fpadd #(
        .DWIDTH(32),
        .MWIDTH(23),
        .EWIDTH(8)
    ) add32 (
        .clk(clk),
        .rst(rst),
        .valid(add32_valid),
        .a(rs1[31:0]),
        .b((isSub) ? {~rs2[31], rs2[30:0]} : rs2[31:0]),
        .sum(add32_result),
        .fex(fex_add32)
    );

    fpadd #(
        .DWIDTH(64),
        .MWIDTH(52),
        .EWIDTH(11)
    ) add64 (
        .clk(clk),
        .rst(rst),
        .valid(add64_valid),
        .a(rs1),
        .b((isSub) ? {~rs2[63], rs2[62:0]} : rs2),
        .sum(add64_result),
        .fex(fex_add64)
    );

    fpmul #(
        .DWIDTH(32),
        .MWIDTH(23),
        .EWIDTH(8)
    ) mul32 (
        .clk(clk),
        .rst(rst),
        .valid(mul32_valid),
        .a(rs1[31:0]),
        .b(rs2[31:0]),
        .result(mul32_result),
        .fex(fex_mul32)
    );

    fpmul #(
        .DWIDTH(64),
        .MWIDTH(52),
        .EWIDTH(11)
    ) mul64 (
        .clk(clk),
        .rst(rst),
        .valid(mul64_valid),
        .a(rs1),
        .b(rs2),
        .result(mul64_result),
        .fex(fex_mul64)
    );

    fltcmp #(
        .DWIDTH(32),
        .MWIDTH(23),
        .EWIDTH(8)
    ) cmp32 (
        .clk(clk),
        .rst(rst),
        .a(rs1[31:0]),
        .b(rs2[31:0]),
        .a_gt_b(a_gt_bs),
        .a_eq_b(a_eq_bs),
        .a_lt_b(a_lt_bs)
    );

    fltcmp #(
        .DWIDTH(64),
        .MWIDTH(52),
        .EWIDTH(11)
    ) cmp64 (
        .clk(clk),
        .rst(rst),
        .a(rs1),
        .b(rs2),
        .a_gt_b(a_gt_bd),
        .a_eq_b(a_eq_bd),
        .a_lt_b(a_lt_bd)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            inv <= 1'b0;
            inx <= 1'b0;
            ovf <= 1'b0;
            unf <= 1'b0;
            fex <= 3'b0;
            result <= 64'b0;
            flags <= 3'b0;
            draddr <= 9'b0;
            wraddr <= 9'b0;
            wrdata <= 64'b0;
            double <= 1'b0;
            add32_valid <= 1'b0;
            add64_valid <= 1'b0;
            mul32_valid <= 1'b0;
            mul64_valid <= 1'b0;
            pending_dest_stage1 <= 5'b0;
            pending_dest_stage2 <= 5'b0;
            pending_dest_stage3 <= 5'b0;
            pending_dest_stage4 <= 5'b0;
            pending_dest_stage5 <= 5'b0;
            pending_write_stage1 <= 1'b0;
            pending_write_stage2 <= 1'b0;
            pending_write_stage3 <= 1'b0;
            pending_write_stage4 <= 1'b0;
            pending_write_stage5 <= 1'b0;
            pending_mul_stage1 <= 1'b0;
            pending_mul_stage2 <= 1'b0;
            pending_mul_stage3 <= 1'b0;
            pending_mul_stage4 <= 1'b0;
            pending_mul_stage5 <= 1'b0;
            pending_double_stage1 <= 1'b0;
            pending_double_stage2 <= 1'b0;
            pending_double_stage3 <= 1'b0;
            pending_double_stage4 <= 1'b0;
            pending_double_stage5 <= 1'b0;
            reg_precision_map <= 32'b0;
        end else begin 
        if (!hazard_detected) begin  // only proceed if no hazards - implicit stall 
            double <= isDouble;
            
            // precision mismatch sets INV exception
            if (precision_mismatch) begin
                inv <= 1'b1;
                fex[2] <= 1'b1; 
            end else begin
                inv <= 1'b0;
            end
            
            // Pipeline tracking - shift pending writes through stages
            pending_write_stage5 <= pending_write_stage4;
            pending_dest_stage5 <= pending_dest_stage4;
            pending_mul_stage5 <= pending_mul_stage4;
            pending_double_stage5 <= pending_double_stage4;
            
            pending_write_stage4 <= pending_write_stage3;
            pending_dest_stage4 <= pending_dest_stage3;
            pending_mul_stage4 <= pending_mul_stage3;
            pending_double_stage4 <= pending_double_stage3;
            
            pending_write_stage3 <= pending_write_stage2;
            pending_dest_stage3 <= pending_dest_stage2;
            pending_mul_stage3 <= pending_mul_stage2;
            pending_double_stage3 <= pending_double_stage2;
            
            pending_write_stage2 <= pending_write_stage1;
            pending_dest_stage2 <= pending_dest_stage1;
            pending_mul_stage2 <= pending_mul_stage1;
            pending_double_stage2 <= pending_double_stage1;
            
            if ((isAdd || isSub || isMul) && !precision_mismatch) begin
                add32_valid <= (isAdd || isSub) && !isDouble;
                add64_valid <= (isAdd || isSub) && isDouble;
                mul32_valid <= isMul && !isDouble;
                mul64_valid <= isMul && isDouble;
                
                pending_write_stage1 <= 1'b1;
                pending_dest_stage1 <= dest;
                pending_mul_stage1 <= isMul;
                pending_double_stage1 <= isDouble;
            end else begin
                add32_valid <= 1'b0;
                add64_valid <= 1'b0;
                mul32_valid <= 1'b0;
                mul64_valid <= 1'b0;
                pending_write_stage1 <= 1'b0;
                pending_dest_stage1 <= 5'b0;
                pending_mul_stage1 <= 1'b0;
                pending_double_stage1 <= 1'b0;
            end
            
            if (iscmp && !precision_mismatch) begin
                flags <= (double) ? {a_gt_bd, a_eq_bd, a_lt_bd} : {a_gt_bs, a_eq_bs, a_lt_bs};
            end
            
            if (issd) begin
                wraddr <= imm;
                wrdata <= rs1;
            end
            
            if (isld) begin
                draddr <= imm ;
                result <= dbus; 
                reg_precision_map[dest] <= isDouble;
            end
        end
        
        // Write back results from stage 4 for ADD operations
        if (pending_write_stage4 && !pending_mul_stage4) begin
            reg_precision_map[pending_dest_stage4] <= pending_double_stage4;
            
            if (pending_double_stage4) begin
                result <= add64_result;
                fex <= fex_add64;
            end else begin
                result <= {{32{add32_result[31]}}, add32_result};
                fex <= fex_add32;
            end
        end
        
        // Write back results from stage 5 for MUL operations
        if (pending_write_stage5 && pending_mul_stage5) begin
            reg_precision_map[pending_dest_stage5] <= pending_double_stage5;
            
            if (pending_double_stage5) begin
                result <= mul64_result;
                fex <= fex_mul64;
            end else begin
                result <= {{32{mul32_result[31]}}, mul32_result};
                fex <= fex_mul32;
            end
        end
        end
    end

endmodule