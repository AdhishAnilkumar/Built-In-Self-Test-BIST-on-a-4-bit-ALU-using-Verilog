`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 11:53:34 PM
// Design Name: 
// Module Name: ALU_FAULTY
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

module Addr1(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0]Sum,
    output Cout
    );
    
  assign {Cout, Sum} = A + B + Cin;
    
endmodule

module Subtrctr1(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Diff,
    output Brw
    );
assign {Brw, Diff} = A - B - Cin;

endmodule

module ALU_FAULTY(
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
    Addr1 a1(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
    Subtrctr1 a2(.A(A),.B(B),.Cin(Cin),.Diff(Diff),.Brw(Brw));
    
  always @(*)begin
  Result =4'b0000;
  Carry  =0;
  Borrow =1'b1;   //sa1 fault
    case (opcode)
    3'b000:begin
      Result = Sum;
      Carry  = Cout;
      Borrow =1'b1; 
      end
      3'b001:begin
      Result = Diff;
      Carry  =1'b0;
      Borrow = 1'b1;
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
        Borrow  =1'b1;
        end 
        endcase 
        end
        
endmodule

