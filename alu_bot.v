`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    10:58:01 10/10/2011
// Design Name:
// Module Name:    alu_top
// Project Name:   Computer Arch
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu_bot(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               set,        //1 bit set      (output)
               overflow,   //1 bit overslow (output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result;
reg           A;
reg           B;
reg           o_and;
reg           o_or;
reg           o_sum;

always @( A_invert or B_invert or src1 or src2)
begin
  if ( A_invert )
  begin
    A = ~src1;
  end
  else
  begin
    A = src1;
  end

  if ( B_invert )
  begin
    B = ~src2;
  end
  else
  begin
    B = src2;
  end
end

always @( A or B)
begin
  o_and   <= A&B;
  o_or    <= A|B;
  o_sum   <= (A&B) | (cin&B) | (cin&A);
  cout    <= A ^ B ^ cin;
end

always @( o_and or o_or or o_sum or o_co )
begin
  case(operation)
  begin
    2'd0:
    begin
      result <= o_and;
    end
    2'd1:
    begin
      result <= o_or;
    end
    2'd2:
    begin
      result <= o_sum;
    end
    2'd3:
    begin
      result <= less;
      set    <= o_sum;
    end
  endcase
end

endmodule
