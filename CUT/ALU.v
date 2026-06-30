`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2026 04:00:41 AM
// Design Name: 
// Module Name: ALU
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
module Addr(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0]Sum,
    output Cout
    );
    
  assign {Cout, Sum} = A + B + Cin;
    
endmodule

module Subtrctr(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Diff,
    output Brw
    );
assign {Brw, Diff} = A - B - Cin;

endmodule

module ALU(
    input [3:0]A,
    input [3:0]B,
    input [2:0]opcode,
    input Cin,
    output reg [3:0]Result,
    output reg Carry,
    output reg Borrow
    );
    
wire [3:0] Sum;
wire [3:0] Diff;
wire Cout;
wire Brw;
    Addr a1(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
    Subtrctr a2(.A(A),.B(B),.Cin(Cin),.Diff(Diff),.Brw(Brw));
    
  always @(*)begin
  Result =4'b0000;
  Carry  =0;
  Borrow =0;
    case (opcode)
    3'b000:begin
      Result = Sum;
      Carry  = Cout;
      Borrow =1'b0;
      end
      3'b001:begin
      Result = Diff;
      Carry  =1'b0;
      Borrow = Brw;
      end
      3'b010:begin
      Result = A&B;
      end
      3'b011:begin
      Result = A|B;
      end
      3'b100:begin
      Result = A^B;
      end
      3'b101:begin
      Result = ~A;
      end
      3'b110:begin
      Result = A<<1;
      end
      3'b111:begin
      Result = A>>1;
      end
      default:begin
        Result =4'b0000;
        Carry   =0;
        Borrow  =0;
        end 
        endcase 
        end
        
endmodule
