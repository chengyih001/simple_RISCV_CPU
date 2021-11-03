`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 09:29:03 PM
// Design Name: 
// Module Name: write_data_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Decide whether result of alu is a memory or a data content
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module write_data_mux(reset, sel_write, mem_data, alu_result, data_write);

input [0:0] reset;
input [0:0] sel_write;
input [31:0] mem_data;
input [31:0] alu_result;
output reg [31:0] data_write;

always @(reset, sel_write, mem_data, alu_result) begin
    if (reset == 1) begin
        case (sel_write)
            1'b0: data_write <= alu_result;       // store result of ALU itself back to register
            1'b1: data_write <= mem_data;       // store content of the memory that ALU produced back to register
        endcase
    end
end

endmodule
