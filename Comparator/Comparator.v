`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 12:12:34 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator( 
    input clk,
    input rst,
    input [5:0] GSIGN,
    output reg PASS
    );

    integer i=0;
    
    always@(posedge clk)begin
    
    if (rst==0)begin 
    i=i+1;
    PASS=0;
    
    if(i==4095)begin
    if (GSIGN == 6'b100001)begin
    $display("TEST PASS.CUT is fault free.");
    PASS=1;
    end
    else begin
    PASS=0;
    $display("TEST FAIL. Fault present in CUT.");
    end 
   end 
end
  end 
  
  
endmodule