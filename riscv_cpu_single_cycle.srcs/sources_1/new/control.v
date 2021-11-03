`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2021 03:14:58 PM
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: control all the operations depending on instruction type
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define R_TYPE 7'b0110011
`define I_TYPE_ARITH 7'b0010011
`define I_TYPE_LOAD 7'b0000011
`define S_TYPE 7'b0100011
`define SB_TYPE 7'b1100011

module control(reset, opcode, branch, mem_read, sel_write, alu_op, mem_write, alu_src, reg_write);

input [0:0] reset;
input [6:0] opcode;
output reg [0:0] branch;
output reg [0:0] mem_read;
output reg [0:0] sel_write;
output reg [3:0] alu_op;
output reg [0:0] mem_write;
output reg [0:0] alu_src;
output reg [0:0] reg_write;

always @(reset, opcode) begin
    if (reset == 1) begin
        case (opcode)
            `R_TYPE: begin
                branch <= 1'b0;
                mem_read <= 1'b0;
                sel_write <= 1'b0;
                alu_op <= 4'd2;
                mem_write <= 1'b0;
                alu_src <= 1'b0;
                reg_write <= 1'b1;
            end
            `I_TYPE_ARITH: begin
                branch <= 1'b0;
                mem_read <= 1'b0;
                sel_write <= 1'b0;
                alu_op <= 4'd2;
                mem_write <= 1'b0;
                alu_src <= 1'b0;
                reg_write <= 1'b1;
            end
            `I_TYPE_LOAD: begin
                branch <= 1'b0;
                mem_read <= 1'b1;
                sel_write <= 1'b1;
                alu_op <= 4'd0;
                mem_write <= 1'b0;
                alu_src <= 1'b1;
                reg_write <= 1'b1;
            end 
            `S_TYPE: begin
                branch <= 1'b0;
                mem_read <= 1'b0;
                sel_write <= 1'b0;
                alu_op <= 4'd0;
                mem_write <= 1'b1;
                alu_src <= 1'b1;
                reg_write <= 1'b0;
            end 
            `SB_TYPE: begin
                branch <= 1'b1;
                mem_read <= 1'b0;
                sel_write <= 1'b0;
                alu_op <= 4'd7;
                mem_write <= 1'b0;
                alu_src <= 1'b0;
                reg_write <= 1'b0;
            end 
        endcase
    end
end

endmodule
