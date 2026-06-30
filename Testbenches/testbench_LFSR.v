`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2026 08:49:35 PM
// Design Name: 
// Module Name: testbench_LFSR
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


module testbench_LFSR;
reg clk;
reg rst;
wire Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11;

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

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

integer i;

initial begin
    rst = 1;
    #12;
    rst = 0;

$display("Cycle  State");
$display("%4d\t%b", 0, {Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0});

for(i=1; i<=4096; i=i+1) begin
    @(posedge clk);
    $display("%4d\t%b", i, {Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0});
end



    $finish;
end

endmodule
