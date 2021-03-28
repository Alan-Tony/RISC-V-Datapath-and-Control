//`timescale 1ns/1ps
//`include "ALU_1bit.v"

module ALU_64bit(A, B, Operation, Result, Overflow, Zero);
  
  input wire signed [63:0] A, B, Result;
  input wire [3:0] Operation;  
  output wire Overflow, Zero;
  
  wire [63:0] CarryOut;
  wire Set;
  
  ALU_1b_Ordinary ALU0(.a (A[0]), .b (B[0]), .Less (Set), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (Operation[2]), .Operation (Operation[1:0]), .Result (Result[0]), .CarryOut (CarryOut[0]));
  ALU_1b_Ordinary ALU1(.a (A[1]), .b (B[1]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[0]), .Operation (Operation[1:0]), .Result (Result[1]), .CarryOut (CarryOut[1]));
  ALU_1b_Ordinary ALU2(.a (A[2]), .b (B[2]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[1]), .Operation (Operation[1:0]), .Result (Result[2]), .CarryOut (CarryOut[2]));
  ALU_1b_Ordinary ALU3(.a (A[3]), .b (B[3]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[2]), .Operation (Operation[1:0]), .Result (Result[3]), .CarryOut (CarryOut[3]));
  ALU_1b_Ordinary ALU4(.a (A[4]), .b (B[4]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[3]), .Operation (Operation[1:0]), .Result (Result[4]), .CarryOut (CarryOut[4]));
  ALU_1b_Ordinary ALU5(.a (A[5]), .b (B[5]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[4]), .Operation (Operation[1:0]), .Result (Result[5]), .CarryOut (CarryOut[5]));
  ALU_1b_Ordinary ALU6(.a (A[6]), .b (B[6]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[5]), .Operation (Operation[1:0]), .Result (Result[6]), .CarryOut (CarryOut[6]));
  ALU_1b_Ordinary ALU7(.a (A[7]), .b (B[7]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[6]), .Operation (Operation[1:0]), .Result (Result[7]), .CarryOut (CarryOut[7]));
  ALU_1b_Ordinary ALU8(.a (A[8]), .b (B[8]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[7]), .Operation (Operation[1:0]), .Result (Result[8]), .CarryOut (CarryOut[8]));
  ALU_1b_Ordinary ALU9(.a (A[9]), .b (B[9]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[8]), .Operation (Operation[1:0]), .Result (Result[9]), .CarryOut (CarryOut[9]));
  ALU_1b_Ordinary ALU10(.a (A[10]), .b (B[10]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[9]), .Operation (Operation[1:0]), .Result (Result[10]), .CarryOut (CarryOut[10]));
  ALU_1b_Ordinary ALU11(.a (A[11]), .b (B[11]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[10]), .Operation (Operation[1:0]), .Result (Result[11]), .CarryOut (CarryOut[11]));
  ALU_1b_Ordinary ALU12(.a (A[12]), .b (B[12]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[11]), .Operation (Operation[1:0]), .Result (Result[12]), .CarryOut (CarryOut[12]));
  ALU_1b_Ordinary ALU13(.a (A[13]), .b (B[13]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[12]), .Operation (Operation[1:0]), .Result (Result[13]), .CarryOut (CarryOut[13]));
  ALU_1b_Ordinary ALU14(.a (A[14]), .b (B[14]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[13]), .Operation (Operation[1:0]), .Result (Result[14]), .CarryOut (CarryOut[14]));
  ALU_1b_Ordinary ALU15(.a (A[15]), .b (B[15]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[14]), .Operation (Operation[1:0]), .Result (Result[15]), .CarryOut (CarryOut[15]));
  ALU_1b_Ordinary ALU16(.a (A[16]), .b (B[16]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[15]), .Operation (Operation[1:0]), .Result (Result[16]), .CarryOut (CarryOut[16]));
  ALU_1b_Ordinary ALU17(.a (A[17]), .b (B[17]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[16]), .Operation (Operation[1:0]), .Result (Result[17]), .CarryOut (CarryOut[17]));
  ALU_1b_Ordinary ALU18(.a (A[18]), .b (B[18]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[17]), .Operation (Operation[1:0]), .Result (Result[18]), .CarryOut (CarryOut[18]));
  ALU_1b_Ordinary ALU19(.a (A[19]), .b (B[19]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[18]), .Operation (Operation[1:0]), .Result (Result[19]), .CarryOut (CarryOut[19]));
  ALU_1b_Ordinary ALU20(.a (A[20]), .b (B[20]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[19]), .Operation (Operation[1:0]), .Result (Result[20]), .CarryOut (CarryOut[20]));
  ALU_1b_Ordinary ALU21(.a (A[21]), .b (B[21]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[20]), .Operation (Operation[1:0]), .Result (Result[21]), .CarryOut (CarryOut[21]));
  ALU_1b_Ordinary ALU22(.a (A[22]), .b (B[22]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[21]), .Operation (Operation[1:0]), .Result (Result[22]), .CarryOut (CarryOut[22]));
  ALU_1b_Ordinary ALU23(.a (A[23]), .b (B[23]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[22]), .Operation (Operation[1:0]), .Result (Result[23]), .CarryOut (CarryOut[23]));
  ALU_1b_Ordinary ALU24(.a (A[24]), .b (B[24]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[23]), .Operation (Operation[1:0]), .Result (Result[24]), .CarryOut (CarryOut[24]));
  ALU_1b_Ordinary ALU25(.a (A[25]), .b (B[25]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[24]), .Operation (Operation[1:0]), .Result (Result[25]), .CarryOut (CarryOut[25]));
  ALU_1b_Ordinary ALU26(.a (A[26]), .b (B[26]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[25]), .Operation (Operation[1:0]), .Result (Result[26]), .CarryOut (CarryOut[26]));
  ALU_1b_Ordinary ALU27(.a (A[27]), .b (B[27]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[26]), .Operation (Operation[1:0]), .Result (Result[27]), .CarryOut (CarryOut[27]));
  ALU_1b_Ordinary ALU28(.a (A[28]), .b (B[28]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[27]), .Operation (Operation[1:0]), .Result (Result[28]), .CarryOut (CarryOut[28]));
  ALU_1b_Ordinary ALU29(.a (A[29]), .b (B[29]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[28]), .Operation (Operation[1:0]), .Result (Result[29]), .CarryOut (CarryOut[29]));
  ALU_1b_Ordinary ALU30(.a (A[30]), .b (B[30]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[29]), .Operation (Operation[1:0]), .Result (Result[30]), .CarryOut (CarryOut[30]));
  ALU_1b_Ordinary ALU31(.a (A[31]), .b (B[31]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[30]), .Operation (Operation[1:0]), .Result (Result[31]), .CarryOut (CarryOut[31]));
  ALU_1b_Ordinary ALU32(.a (A[32]), .b (B[32]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[31]), .Operation (Operation[1:0]), .Result (Result[32]), .CarryOut (CarryOut[32]));
  ALU_1b_Ordinary ALU33(.a (A[33]), .b (B[33]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[32]), .Operation (Operation[1:0]), .Result (Result[33]), .CarryOut (CarryOut[33]));
  ALU_1b_Ordinary ALU34(.a (A[34]), .b (B[34]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[33]), .Operation (Operation[1:0]), .Result (Result[34]), .CarryOut (CarryOut[34]));
  ALU_1b_Ordinary ALU35(.a (A[35]), .b (B[35]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[34]), .Operation (Operation[1:0]), .Result (Result[35]), .CarryOut (CarryOut[35]));
  ALU_1b_Ordinary ALU36(.a (A[36]), .b (B[36]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[35]), .Operation (Operation[1:0]), .Result (Result[36]), .CarryOut (CarryOut[36]));
  ALU_1b_Ordinary ALU37(.a (A[37]), .b (B[37]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[36]), .Operation (Operation[1:0]), .Result (Result[37]), .CarryOut (CarryOut[37]));
  ALU_1b_Ordinary ALU38(.a (A[38]), .b (B[38]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[37]), .Operation (Operation[1:0]), .Result (Result[38]), .CarryOut (CarryOut[38]));
  ALU_1b_Ordinary ALU39(.a (A[39]), .b (B[39]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[38]), .Operation (Operation[1:0]), .Result (Result[39]), .CarryOut (CarryOut[39]));
  ALU_1b_Ordinary ALU40(.a (A[40]), .b (B[40]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[39]), .Operation (Operation[1:0]), .Result (Result[40]), .CarryOut (CarryOut[40]));
  ALU_1b_Ordinary ALU41(.a (A[41]), .b (B[41]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[40]), .Operation (Operation[1:0]), .Result (Result[41]), .CarryOut (CarryOut[41]));
  ALU_1b_Ordinary ALU42(.a (A[42]), .b (B[42]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[41]), .Operation (Operation[1:0]), .Result (Result[42]), .CarryOut (CarryOut[42]));
  ALU_1b_Ordinary ALU43(.a (A[43]), .b (B[43]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[42]), .Operation (Operation[1:0]), .Result (Result[43]), .CarryOut (CarryOut[43]));
  ALU_1b_Ordinary ALU44(.a (A[44]), .b (B[44]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[43]), .Operation (Operation[1:0]), .Result (Result[44]), .CarryOut (CarryOut[44]));
  ALU_1b_Ordinary ALU45(.a (A[45]), .b (B[45]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[44]), .Operation (Operation[1:0]), .Result (Result[45]), .CarryOut (CarryOut[45]));
  ALU_1b_Ordinary ALU46(.a (A[46]), .b (B[46]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[45]), .Operation (Operation[1:0]), .Result (Result[46]), .CarryOut (CarryOut[46]));
  ALU_1b_Ordinary ALU47(.a (A[47]), .b (B[47]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[46]), .Operation (Operation[1:0]), .Result (Result[47]), .CarryOut (CarryOut[47]));
  ALU_1b_Ordinary ALU48(.a (A[48]), .b (B[48]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[47]), .Operation (Operation[1:0]), .Result (Result[48]), .CarryOut (CarryOut[48]));
  ALU_1b_Ordinary ALU49(.a (A[49]), .b (B[49]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[48]), .Operation (Operation[1:0]), .Result (Result[49]), .CarryOut (CarryOut[49]));
  ALU_1b_Ordinary ALU50(.a (A[50]), .b (B[50]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[49]), .Operation (Operation[1:0]), .Result (Result[50]), .CarryOut (CarryOut[50]));
  ALU_1b_Ordinary ALU51(.a (A[51]), .b (B[51]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[50]), .Operation (Operation[1:0]), .Result (Result[51]), .CarryOut (CarryOut[51]));
  ALU_1b_Ordinary ALU52(.a (A[52]), .b (B[52]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[51]), .Operation (Operation[1:0]), .Result (Result[52]), .CarryOut (CarryOut[52]));
  ALU_1b_Ordinary ALU53(.a (A[53]), .b (B[53]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[52]), .Operation (Operation[1:0]), .Result (Result[53]), .CarryOut (CarryOut[53]));
  ALU_1b_Ordinary ALU54(.a (A[54]), .b (B[54]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[53]), .Operation (Operation[1:0]), .Result (Result[54]), .CarryOut (CarryOut[54]));
  ALU_1b_Ordinary ALU55(.a (A[55]), .b (B[55]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[54]), .Operation (Operation[1:0]), .Result (Result[55]), .CarryOut (CarryOut[55]));
  ALU_1b_Ordinary ALU56(.a (A[56]), .b (B[56]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[55]), .Operation (Operation[1:0]), .Result (Result[56]), .CarryOut (CarryOut[56]));
  ALU_1b_Ordinary ALU57(.a (A[57]), .b (B[57]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[56]), .Operation (Operation[1:0]), .Result (Result[57]), .CarryOut (CarryOut[57]));
  ALU_1b_Ordinary ALU58(.a (A[58]), .b (B[58]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[57]), .Operation (Operation[1:0]), .Result (Result[58]), .CarryOut (CarryOut[58]));
  ALU_1b_Ordinary ALU59(.a (A[59]), .b (B[59]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[58]), .Operation (Operation[1:0]), .Result (Result[59]), .CarryOut (CarryOut[59]));
  ALU_1b_Ordinary ALU60(.a (A[60]), .b (B[60]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[59]), .Operation (Operation[1:0]), .Result (Result[60]), .CarryOut (CarryOut[60]));
  ALU_1b_Ordinary ALU61(.a (A[61]), .b (B[61]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[60]), .Operation (Operation[1:0]), .Result (Result[61]), .CarryOut (CarryOut[61]));
  ALU_1b_Ordinary ALU62(.a (A[62]), .b (B[62]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[61]), .Operation (Operation[1:0]), .Result (Result[62]), .CarryOut (CarryOut[62]));
  ALU_1bit_MSB ALU63(.a (A[63]), .b (B[63]), .Less (1'b0), .Ainvert (Operation[3]), .Binvert (Operation[2]), .CarryIn (CarryOut[62]), .Operation (Operation[1:0]), .Result (Result[63]), .CarryOut (CarryOut[63]), .Set (Set), .Overflow (Overflow));

  nor G1(Zero, Result[0], Result[1], Result[2], Result[3], Result[4], Result[5], Result[6], Result[7], Result[8], Result[9], Result[10], Result[11], Result[12], Result[13], Result[14], Result[15], Result[16], Result[17], Result[18], Result[19], Result[20], Result[21], Result[22], Result[23], Result[24], Result[25], Result[26], Result[27], Result[28], Result[29], Result[30], Result[31], Result[32], Result[33], Result[34], Result[35], Result[36], Result[37], Result[38], Result[39], Result[40], Result[41], Result[42], Result[43], Result[44], Result[45], Result[46], Result[47], Result[48], Result[49], Result[50], Result[51], Result[52], Result[53], Result[54], Result[55], Result[56], Result[57], Result[58], Result[59], Result[60], Result[61], Result[62], Result[63]);

endmodule
