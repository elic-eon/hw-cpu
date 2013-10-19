`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2010
// Design Name:
// Module Name:    alu
// Project Name:
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

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
           bonus_control, // 3 bits bonus control input(input)
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );


input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
input   [3-1:0] bonus_control;

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

wire   [32-1:0] result;
reg             zero;
wire            cout;
wire            overflow;

wire   [31-1:0] t_cout;
wire   [31-1:0] t_equal;
wire            set;

//rst_n
//always @(negedge rst_n)
//begin
  //if (~rst_n)
  //begin
    //result   <= 32'd0;
    //zero     <= 0;
    //cout     <= 0;
    //overflow <= 0;
  //end
//end

//design

alu_top a0(
  .src1(src1[0]),
  .src2(src2[0]),
  .less(set),
  .equal(equal),
  .in_equal(1'd1),
  .bit_equal(t_equal[0]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(ALU_control[2]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(bonus_control),
  .result(result[0]),
  .cout(t_cout[0])
);
alu_top a1(
  .src1(src1[1]),
  .src2(src2[1]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[0]),
  .bit_equal(t_equal[1]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[0]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[1]),
  .cout(t_cout[1])
);
alu_top a2(
  .src1(src1[2]),
  .src2(src2[2]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[1]),
  .bit_equal(t_equal[2]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[1]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[2]),
  .cout(t_cout[2])
);
alu_top a3(
  .src1(src1[3]),
  .src2(src2[3]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[2]),
  .bit_equal(t_equal[3]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[2]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[3]),
  .cout(t_cout[3])
);
alu_top a4(
  .src1(src1[4]),
  .src2(src2[4]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[3]),
  .bit_equal(t_equal[4]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[3]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[4]),
  .cout(t_cout[4])
);
alu_top a5(
  .src1(src1[5]),
  .src2(src2[5]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[4]),
  .bit_equal(t_equal[5]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[4]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[5]),
  .cout(t_cout[5])
);
alu_top a6(
  .src1(src1[6]),
  .src2(src2[6]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[5]),
  .bit_equal(t_equal[6]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[5]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[6]),
  .cout(t_cout[6])
);
alu_top a7(
  .src1(src1[7]),
  .src2(src2[7]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[6]),
  .bit_equal(t_equal[7]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[6]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[7]),
  .cout(t_cout[7])
);
alu_top a8(
  .src1(src1[8]),
  .src2(src2[8]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[7]),
  .bit_equal(t_equal[8]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[7]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[8]),
  .cout(t_cout[8])
);
alu_top a9(
  .src1(src1[9]),
  .src2(src2[9]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[8]),
  .bit_equal(t_equal[9]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[8]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[9]),
  .cout(t_cout[9])
);
alu_top a10(
  .src1(src1[10]),
  .src2(src2[10]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[9]),
  .bit_equal(t_equal[10]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[9]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[10]),
  .cout(t_cout[10])
);
alu_top a11(
  .src1(src1[11]),
  .src2(src2[11]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[10]),
  .bit_equal(t_equal[11]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[10]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[11]),
  .cout(t_cout[11])
);
alu_top a12(
  .src1(src1[12]),
  .src2(src2[12]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[11]),
  .bit_equal(t_equal[12]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[11]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[12]),
  .cout(t_cout[12])
);
alu_top a13(
  .src1(src1[13]),
  .src2(src2[13]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[12]),
  .bit_equal(t_equal[13]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[12]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[13]),
  .cout(t_cout[13])
);
alu_top a14(
  .src1(src1[14]),
  .src2(src2[14]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[13]),
  .bit_equal(t_equal[14]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[13]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[14]),
  .cout(t_cout[14])
);
alu_top a15(
  .src1(src1[15]),
  .src2(src2[15]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[14]),
  .bit_equal(t_equal[15]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[14]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[15]),
  .cout(t_cout[15])
);
alu_top a16(
  .src1(src1[16]),
  .src2(src2[16]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[15]),
  .bit_equal(t_equal[16]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[15]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[16]),
  .cout(t_cout[16])
);
alu_top a17(
  .src1(src1[17]),
  .src2(src2[17]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[16]),
  .bit_equal(t_equal[17]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[16]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[17]),
  .cout(t_cout[17])
);
alu_top a18(
  .src1(src1[18]),
  .src2(src2[18]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[17]),
  .bit_equal(t_equal[18]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[17]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[18]),
  .cout(t_cout[18])
);
alu_top a19(
  .src1(src1[19]),
  .src2(src2[19]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[18]),
  .bit_equal(t_equal[19]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[18]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[19]),
  .cout(t_cout[19])
);
alu_top a20(
  .src1(src1[20]),
  .src2(src2[20]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[19]),
  .bit_equal(t_equal[20]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[19]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[20]),
  .cout(t_cout[20])
);
alu_top a21(
  .src1(src1[21]),
  .src2(src2[21]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[20]),
  .bit_equal(t_equal[21]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[20]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[21]),
  .cout(t_cout[21])
);
alu_top a22(
  .src1(src1[22]),
  .src2(src2[22]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[21]),
  .bit_equal(t_equal[22]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[21]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[22]),
  .cout(t_cout[22])
);
alu_top a23(
  .src1(src1[23]),
  .src2(src2[23]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[22]),
  .bit_equal(t_equal[23]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[22]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[23]),
  .cout(t_cout[23])
);
alu_top a24(
  .src1(src1[24]),
  .src2(src2[24]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[23]),
  .bit_equal(t_equal[24]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[23]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[24]),
  .cout(t_cout[24])
);
alu_top a25(
  .src1(src1[25]),
  .src2(src2[25]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[24]),
  .bit_equal(t_equal[25]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[24]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[25]),
  .cout(t_cout[25])
);
alu_top a26(
  .src1(src1[26]),
  .src2(src2[26]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[25]),
  .bit_equal(t_equal[26]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[25]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[26]),
  .cout(t_cout[26])
);
alu_top a27(
  .src1(src1[27]),
  .src2(src2[27]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[26]),
  .bit_equal(t_equal[27]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[26]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[27]),
  .cout(t_cout[27])
);
alu_top a28(
  .src1(src1[28]),
  .src2(src2[28]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[27]),
  .bit_equal(t_equal[28]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[27]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[28]),
  .cout(t_cout[28])
);
alu_top a29(
  .src1(src1[29]),
  .src2(src2[29]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[28]),
  .bit_equal(t_equal[29]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[28]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[29]),
  .cout(t_cout[29])
);
alu_top a30(
  .src1(src1[30]),
  .src2(src2[30]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[29]),
  .bit_equal(t_equal[30]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[29]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[30]),
  .cout(t_cout[30])
);
alu_bot a31(
  .src1(src1[31]),
  .src2(src2[31]),
  .less(1'd0),
  .equal(1'd0),
  .in_equal(t_equal[30]),
  .A_invert(ALU_control[3]),
  .B_invert(ALU_control[2]),
  .cin(t_cout[30]),
  .operation(ALU_control[2-1:0]),
  .bonus_op(3'd7),
  .result(result[31]),
  .cout(cout),
  .set(set),
  .set_equal(equal),
  .overflow(overflow)
);

always @(result)
begin
  if ( result == 32'd0 )
    zero <= 1;
  else
    zero <= 0;
end

endmodule
