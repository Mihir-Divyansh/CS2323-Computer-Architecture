module regFile (
    input clk, 
    input rst,
    input [4:0] sel1,
    input [4:0] sel2,
    input [4:0] dest,
    input [63:0] data_in,
    output [63:0] data_out1,
    output [63:0] data_out2
);
    reg [63:0] reg_file [0:31];
    assign data_out1 = reg_file[sel1];
    assign data_out2 = reg_file[sel2];
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                reg_file[i] <= 0;
            end
        end else begin
            if (dest == 5'b0) begin
                // Do not write to register 0
                reg_file[dest] <= reg_file[dest];
            end
            else if (data_in) begin
                    reg_file[dest] <= data_in;
            end
        end
    end

endmodule