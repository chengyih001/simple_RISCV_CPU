`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2021 07:41:17 PM
// Design Name: 
// Module Name: register_bank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Register bank contains 32 registers, each with 32 bits. Read/Write operations are performed to registers.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_bank(reset, clk, addr_read1, addr_read2, addr_write, reg_write, data_write, data_read1, data_read2);

input [0:0] reset;
input [0:0] clk;
input [4:0] addr_read1;
input [4:0] addr_read2;
input [4:0] addr_write;
input [0:0] reg_write;
input [31:0] data_write;
output reg [31:0] data_read1;
output reg [31:0] data_read2;

reg [31:0] register [0:31];

always @(reset, addr_read1, addr_read2) begin       // register files are read when read_addrs are changed
    if (reset == 1) begin
        if (addr_read1) begin
            data_read1 <= register[addr_read1];
        end
        if (addr_read2) begin
            data_read2 <= register[addr_read2];
        end
    end
end

always @(posedge clk) begin
    if (reset == 1) begin
        if ((addr_write > 0) && reg_write) begin        // data are written according to write_reg and write_addr
            register[addr_write] <= data_write;
        end 
    end
end

endmodule
