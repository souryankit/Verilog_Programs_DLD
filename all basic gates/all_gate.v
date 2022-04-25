`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2022 11:43:18
// Design Name: 
// Module Name: all_gate
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


module all_gate(
    input a,
    input b,
    output not_out1,
    output not_out2,
    output or_out,
    output and_out,
    output xor_out,
    output nor_out,
    output nand_out,
    output xnor_out
    );
    
    //GATE LEVEL modeling
    not(not_out1, a);
    not(not_out2, b);
    or(or_out, a, b);
    and(and_out, a, b);
    xor(xor_out, a ,b);
    nor(nor_out, a, b);
    nand(nand_out, a, b);
    xnor(xnor_out, a, b);
       
endmodule
