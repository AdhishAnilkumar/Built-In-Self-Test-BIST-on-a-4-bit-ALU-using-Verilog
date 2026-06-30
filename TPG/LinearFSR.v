`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 02:00:08 PM
// Design Name: 
// Module Name: LinearFSR
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


module LinearFSR(
input clk,
input rst,
output Q0,
output Q1,
output Q2,
output Q3,
output Q4,
output Q5,
output Q6,
output Q7,
output Q8,
output Q9,
output Q10,
output Q11
 );
reg D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11;
 always @(*)begin
    if(rst==1)begin
     D0=0;
     D1=0;
     D2=0;
     D3=0;
     D4=0;
     D5=0;
     D6=0;
     D7=0;
     D8=0;
     D9=0;
     D10=0;
     D11=1;
     end
  else begin
 D11 = ((Q1 ^ Q0)^Q4)^Q6;
 D10 = Q11;
 D9 = Q10;
 D8 = Q9;
 D7 = Q8;
 D6 = Q7;
 D5 = Q6;
 D4 = Q5;
 D3 = Q4;
 D2 = Q3;
 D1 = Q2;
 D0 = Q1;
 end 
 end
 
 DFF d0(.D(D0),.clk(clk),.Q(Q0)); 
 DFF d1(.D(D1),.clk(clk),.Q(Q1)); 
 DFF d2(.D(D2),.clk(clk),.Q(Q2)); 
 DFF d3(.D(D3),.clk(clk),.Q(Q3)); 
 DFF d4(.D(D4),.clk(clk),.Q(Q4)); 
 DFF d5(.D(D5),.clk(clk),.Q(Q5)); 
 DFF d6(.D(D6),.clk(clk),.Q(Q6)); 
 DFF d7(.D(D7),.clk(clk),.Q(Q7)); 
 DFF d8(.D(D8),.clk(clk),.Q(Q8)); 
 DFF d9(.D(D9),.clk(clk),.Q(Q9)); 
 DFF d10(.D(D10),.clk(clk),.Q(Q10)); 
 DFF d11(.D(D11),.clk(clk),.Q(Q11)); 
 
 
 
 
 endmodule


