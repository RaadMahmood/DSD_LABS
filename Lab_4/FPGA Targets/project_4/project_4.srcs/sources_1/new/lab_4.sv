`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 10:33:30 PM
// Design Name: 
// Module Name: lab_4
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


module lab_4(
input logic [1:0]a2,b2,
    output logic rd,grn,blu
    );
logic a,b,c,d;
assign a = a2[1];
assign b = a2[0];
assign c = b2[1];
assign d = b2[0];
assign rd =  ((~d | b) & (~c | a)) | (a & ~c);
assign grn = ((~b | d) & (~a | c)) | (~a & c);
assign blu = (~b & d) | (~a & c) | (b & ~d) | (a & ~c);
endmodule
