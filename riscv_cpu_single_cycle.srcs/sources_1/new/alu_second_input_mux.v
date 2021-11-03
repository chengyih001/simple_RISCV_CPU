`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 10:10:21 PM
// Design Name: 
// Module Name: alu_second_input_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Decide wheter the second input of ALU is register file content or data in instruction depending on instruction type
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_second_input_mux(reset, src_sel, reg_data, ins_data, alu_src);

input [0:0] reset;
input [0:0] src_sel;
input [31:0] reg_data;
input [31:0] ins_data;
output reg [31:0] alu_src;

always @(reset, src_sel, reg_data, ins_data) begin
    if (reset == 1) begin
        case (src_sel)
            1'b0: alu_src <= reg_data;      // second ALU input is register file content (for arithmetic or logical instructions)
            1'b1: alu_src <= ins_data;      // second ALU input is instruction data (for jump, immediate instructions)
        endcase
    end
end

endmodule
