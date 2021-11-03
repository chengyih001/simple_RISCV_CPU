`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 08:32:29 PM
// Design Name: 
// Module Name: program_counter_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Decide whether next program counter is the next instruction or is a jump instruction
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module program_counter_mux(reset, pc_sel, pc_addr, jump_addr, next_pc);

input [0:0] reset;
input [0:0] pc_sel;
input [31:0] pc_addr;
input [31:0] jump_addr;
output reg [31:0] next_pc;

always @(reset, pc_sel, pc_addr, jump_addr) begin
    if (reset == 1) begin
        case (pc_sel)
            1'b0: next_pc <= pc_addr;     // program counter is incremented to next PC
            1'b1: next_pc <= jump_addr;       // program counter is moved to jump addr
        endcase
    end
end
    
endmodule
