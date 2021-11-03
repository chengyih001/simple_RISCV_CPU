`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2021 02:53:26 PM
// Design Name: 
// Module Name: immediate_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define I_TYPE_ARITH 7'b0010011
`define I_TYPE_LOAD 7'b0000011
`define S_TYPE 7'b0100011
`define SB_TYPE 7'b1100011

module immediate_gen(reset, instruction, immediate);

input [0:0] reset;
input [31:0] instruction;
output reg [31:0] immediate;

always @(reset) begin 
    if (reset == 1) begin
        case (instruction[6:0])     // Determine type of instruction (only for I, S, SB types)
            `I_TYPE_ARITH: begin
                immediate[11:0] <= instruction[31:20];
            end
            `I_TYPE_LOAD: begin
                immediate[11:0] <= instruction[31:20];
            end
            `S_TYPE: begin
                immediate[11:5] <= instruction[31:25];
                immediate[4:0] <= instruction[11:7];
            end
            `SB_TYPE: begin
                immediate[11] <= instruction[31];
                immediate[10] <= instruction[7];
                immediate[9:4] <= instruction[30:25];
                immediate[3:0] <= instruction[11:8];
            end
        endcase
        case (instruction[31])
            1'b0: begin
                immediate[31:12] <= 20'd0;
            end
            1'b1: begin
                immediate[31:12] <= 20'b11111111111111111111;
            end
        endcase
    end
end

endmodule
