`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2021 04:14:29 PM
// Design Name: 
// Module Name: alu_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Determine the next instruction depending on instruction type. e.g.: next instruction for JUMP is ADD.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define INS_BASIC 4'd2      // define alu_op for standard instructions
`define INS_JUMP 4'd0       // define alu_op for jump instruction
`define INS_BRANCH 4'd7     // define alu_op for branch instruction

`define AND 4'd0
`define OR 4'd1
`define ADD 4'd2
`define SUB 4'd3
`define XOR 4'd4
`define SLL 4'd5        // logical shift left
`define SRL 4'd6        // logical shift right
`define SRA 4'd7        // arithmetic shift right
`define SLT 4'd8        // set on less than
`define SLTU 4'd9       // set on less than unsigned

`define FUNCT3_ADD 4'd0
`define FUNCT3_SLL 4'd1
`define FUNCT3_SLT 4'd2
`define FUNCT3_SLTU 4'd3
`define FUNCT3_XOR 4'd4
`define FUNCT3_SRL 4'd5        // logical shift left
`define FUNCT3_OR 4'd6        // logical shift right
`define FUNCT3_AND 4'd7        // arithmetic shift right
`define FUNCT3_SUB 4'd0        // set on less than
`define FUNCT3_SRA 4'd5       // set on less than unsigned

module alu_control(reset, instruction, alu_op, alu_decode);

input [0:0] reset;
input [31:0] instruction;
input [3:0] alu_op;
output reg [3:0] alu_decode;

always @(reset, instruction, alu_op) begin
    if (reset == 1) begin
        if (alu_op == `INS_BASIC) begin
            if (instruction[31:25] == 7'b0000000) begin
                case (instruction[14:12])
                    `FUNCT3_ADD: alu_decode <= `ADD;
                    `FUNCT3_SLL: alu_decode <= `SLL;
                    `FUNCT3_SLT: alu_decode <= `SLT;
                    `FUNCT3_SLTU: alu_decode <= `SLTU;
                    `FUNCT3_XOR: alu_decode <= `XOR;
                    `FUNCT3_SRL: alu_decode <= `SRL;
                    `FUNCT3_OR: alu_decode <= `OR;
                    `FUNCT3_AND: alu_decode <= `AND;
                endcase
            end
            else if (instruction[31:25] == 7'b0100000) begin
                case (instruction[14:12])
                    `FUNCT3_SUB: alu_decode <= `SUB;
                    `FUNCT3_SRA: alu_decode <= `SRA;
                endcase
            end
        end
        else if (alu_op == `INS_JUMP) begin
            alu_decode <= `ADD;
        end
        else if (alu_op == `INS_BRANCH) begin
            alu_decode <= `XOR;
        end
    end
end

endmodule
