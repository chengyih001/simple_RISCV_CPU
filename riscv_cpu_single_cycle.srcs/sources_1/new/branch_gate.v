`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2021 12:11:04 AM
// Design Name: 
// Module Name: branch_gate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Decides whether the instruction requires branching or not
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module branch_gate(branch, alu_result, pc_sel);

input [0:0] branch;
input [31:0] alu_result;
output reg [0:0] pc_sel;

always @(branch, alu_result) begin
    if (branch & !alu_result) begin     // If branch is true and alu_result is 0, branching is required.
        pc_sel <= 1'b1; 
    end
    else begin
        pc_sel <= 1'b0;
    end
end

endmodule
