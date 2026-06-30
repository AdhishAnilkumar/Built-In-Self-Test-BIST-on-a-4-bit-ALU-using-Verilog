`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 11:56:59 PM
// Design Name: 
// Module Name: testbench_BIST_FAULTY
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


module testbench_BIST_FAULTY;
reg clk,rst;
wire [5:0]SIGN;
wire PASS;

wire Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11;
wire [11:0]VECTR={Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0};
wire [3:0]RES;
wire Carry,Borrow;

LinearFSR F1 (
    .clk(clk),
    .rst(rst),
    .Q0(Q0),
    .Q1(Q1),
    .Q2(Q2),
    .Q3(Q3),
    .Q4(Q4),
    .Q5(Q5),
    .Q6(Q6),
    .Q7(Q7),
    .Q8(Q8),
    .Q9(Q9),
    .Q10(Q10),
    .Q11(Q11)
);



ALU_FAULTY A1( .A(VECTR[3:0]),
    .B(VECTR[7:4]),
    .opcode(VECTR[10:8]),
    .Cin(VECTR[11]),
    .Result(RES),
    .Carry(Carry),
    .Borrow(Borrow));
    
BIST_FAULTY i1(.clk(clk),.rst(rst),.SIGN(SIGN),.PASS(PASS));

    
    
initial begin
clk=0;
   forever 
   #5 clk=~clk;
   end 
 integer i;
 
  
 initial begin
    rst = 1;
    #12;
    rst = 0;
    
    
$display("Cycle   Vector          A       B       OP  Cin Res     C   B    Sign");
$display("%4d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b" ,0,{Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0},{Q3,Q2,Q1,Q0},{Q7,Q6,Q5,Q4},{Q10,Q9,Q8},Q11,RES,Carry,Borrow,SIGN);
 
 for(i=1; i<=4095; i=i+1) 
    begin
    @(posedge clk);
    $display("%4d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b" ,i,{Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0},{Q3,Q2,Q1,Q0},{Q7,Q6,Q5,Q4},{Q10,Q9,Q8},Q11,RES,Carry,Borrow,SIGN);
    end
#1
$finish;
end


endmodule