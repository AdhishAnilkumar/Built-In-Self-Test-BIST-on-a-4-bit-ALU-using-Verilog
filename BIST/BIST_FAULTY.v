`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 11:55:21 PM
// Design Name: 
// Module Name: BIST_FAULTY
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


module BIST_FAULTY(
    input clk,
    input rst,
    output [5:0] SIGN,
    output PASS
    );
    
    wire [11:0]VECTR; 
    wire [3:0]RES;
    wire Carry;
    wire Borrow;
 
    
    LinearFSR L1(.clk(clk),.rst(rst),
    .Q0(VECTR[0]),
    .Q1(VECTR[1]),
    .Q2(VECTR[2]),
    .Q3(VECTR[3]),
    .Q4(VECTR[4]),
    .Q5(VECTR[5]),
    .Q6(VECTR[6]),
    .Q7(VECTR[7]),
    .Q8(VECTR[8]),
    .Q9(VECTR[9]),
    .Q10(VECTR[10]),
    .Q11(VECTR[11]));
    
    ALU_FAULTY A1( .A(VECTR[3:0]),
    .B(VECTR[7:4]),
    .opcode(VECTR[10:8]),
    .Cin(VECTR[11]),
    .Result(RES),
    .Carry(Carry),
    .Borrow(Borrow));
    
    MISR O1(.clk(clk),
    .rst(rst),
    .RES(RES),
    .C(Carry),
    .B(Borrow),
    .SIGN(SIGN));
    
    Comparator C1(.clk(clk),.rst(rst),.GSIGN(SIGN),.PASS(PASS));
    
    
    
endmodule

