`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2025 02:54:29 PM
// Design Name: 
// Module Name: lab_2_task
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


module lab_2_task(output logic x,y,
            input logic a,b,c
            );
   assign x = ~c ^ (a | b);
   assign y = ((a|b) & ((~(a&b))^(a|b)));

endmodule
