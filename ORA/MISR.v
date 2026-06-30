`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 01:30:34 AM
// Design Name: 
// Module Name: MISR
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

module MISR(
input rst,
input clk,
input [3:0]RES,
input C,
input B,
output [5:0]SIGN
);

reg D0,D1,D2,D3,D4,D5;
wire Q0,Q1,Q2,Q3,Q4,Q5;


DFF d0(.D(D0),.clk(clk),.Q(Q0));
DFF d1(.D(D1),.clk(clk),.Q(Q1));
DFF d2(.D(D2),.clk(clk),.Q(Q2));
DFF d3(.D(D3),.clk(clk),.Q(Q3));
DFF d4(.D(D4),.clk(clk),.Q(Q4));
DFF d5(.D(D5),.clk(clk),.Q(Q5));

always@(*)begin

if(rst==1)begin
 D0=0;
 D1=0;
 D2=0;
 D3=0;
 D4=0; 
 D5=0;
 end 
 
 else begin
 D0=Q5^RES[0];
 D1=Q5^Q0^RES[1]; 
 D2=Q1^RES[2];
 D3=Q2^RES[3];
 D4=Q3^C;
 D5=Q4^B;
 end
 end 
 
 assign SIGN[5:0]={Q5,Q4,Q3,Q2,Q1,Q0};
 
endmodule
