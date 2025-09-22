module insdec(
    input [23:0] ins,
    output isAdd,
    output isSub,
    output isMul,
    output isld,
    output issd,
    output iscmp,
    output [1:0] dest_sel,
    output isDouble,
    output [4:0] rs1,
    output [4:0] rs2,
    output [4:0] rd,
    output [8:0] imm
);

    assign isDouble = ins[23];
    assign isAdd = ~ins[22] & ins[21];
    assign isSub = ~ins[22] & ins[20];
    assign isMul = ~ins[22] & ins[19];
    assign isld =  ins[22] & ins[21];
    assign issd =  ins[22] & ins[20];
    assign iscmp = ins[22] & ins[19];
    assign imm = (issd) ? ins[8:0] : (isld ? ins[13:5] : 9'b0);
    assign rd = ins[4:0];
    assign rs1 = ins[18:14];
    assign rs2 = ins[13:9];
    assign dest_sel = {isld, ~ins[22]};
endmodule