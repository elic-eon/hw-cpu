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
               equal,      //1 bit equal    (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               bonus_op,   //bonus_op       (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               set,        //1 bit set      (output)
               overflow   //1 bit overslow (output)
               );

input         src1;
input         src2;
input         less;
input         equal;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;
input [3-1:0] bonus_op;

output        result;
output        cout;
output        set;
output        overflow;

reg           set;
reg           overflow;
reg           result;
reg           cout;
reg           A;
reg           B;
reg           o_and;
reg           o_or;
reg           o_sum;
reg           o_cout;

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

always @( A or B or cin)
begin
  o_and   <= A&B;
  o_or    <= A|B;
  o_cout  <= (A&B) | (cin&B) | (cin&A);
  o_sum   <= A ^ B ^ cin;
end

always @( * )
begin
  case(operation)
    2'd0:
    begin
      result   <= o_and;
      cout     <= 0;
      overflow <= 0;
      set      <= 0;
    end
    2'd1:
    begin
      result   <= o_or;
      cout     <= 0;
      overflow <= 0;
      set      <= 0;
    end
    2'd2:
    begin
      result   <= o_sum;
      cout     <= o_cout;
      overflow <= ( A&B&~o_sum ) | (~A&~B&o_sum);
      set      <= 0;
    end
    2'd3:
    begin
      case(bonus_op)
      3'd0:
      begin
        result <= less;
      end
      3'd1:
      begin
        result <= ~less & ~equal;
      end
      3'd2:
      begin
        result <= less | equal;
      end
      3'd3:
      begin
        result <= ~less;
      end
      3'd4:
      begin
        result <= equal;
      end
      3'd5:
      begin
        result <= ~equal;
      end
      3'd7:
      begin
        result <= 0;
      end
      endcase
      set      <= o_sum;
      cout     <= 0;
      overflow <= 0;
    end
  endcase
end

endmodule
