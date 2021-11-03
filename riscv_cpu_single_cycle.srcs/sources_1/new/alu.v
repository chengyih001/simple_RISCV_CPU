`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2021 10:46:59 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Defines 10 32-bit instructions
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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

module alu(reset, data_read1, data_read2, alu_decode, alu_result);

input [0:0] reset;
input [31:0] data_read1;
input [31:0] data_read2;
input [3:0] alu_decode;
output reg [31:0] alu_result;

always @(reset, data_read1, data_read2, alu_decode) begin
    if (reset == 1) begin
        case (alu_decode)
            `AND: alu_result <= data_read1 & data_read2;
            `OR: alu_result <= data_read1 | data_read2;
            `ADD: alu_result <= data_read1 + data_read2;
            `SUB: alu_result <= data_read1 - data_read2;
            `XOR: alu_result <= data_read1 ^ data_read2;
            `SLL: alu_result <= data_read1 << data_read2;
            `SRL: alu_result <= data_read1 >> data_read2;
            `SRA: alu_result <= $signed(data_read1) >>> $signed(data_read2);
            `SLT: alu_result <= $signed(data_read1) < $signed(data_read2) ? 4'd1 : 4'd0;
            `SLTU: alu_result <= data_read1 < data_read2 ? 4'd1 : 4'd0;
        endcase
    end
end

endmodule
