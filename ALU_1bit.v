`include "Utility_Modules.v"

//1-bit ALU module
module ALU_1b_Ordinary(a, b, Less, Ainvert, Binvert, CarryIn, Operation, Result, CarryOut);
  
  input wire a, b, Less, Ainvert, Binvert, CarryIn;
  input wire [1:0] Operation;
  output wire Result, CarryOut;
  
  //Mux to feed a or a'
  wire [1:0] inputs2to1_0;
  wire op1;
  mux2to1 M0(.op (op1), .ip (inputs2to1_0), .select (Ainvert));
  
  //Giving inputs as a or a'
  assign inputs2to1_0[0] = a;
  wire inverted_a;
  not G0(inverted_a, a);
  assign inputs2to1_0[1] = inverted_a;
  
  
  //Mux to feed b or b'
  wire [1:0] inputs2to1_1;
  wire op2;
  mux2to1 M1(.op (op2), .ip (inputs2to1_1), .select (Binvert));
  
  //Giving inputs as b or b'
  assign inputs2to1_1[0] = b;
  wire inverted_b;
  not G1(inverted_b, b);
  assign inputs2to1_1[1] = inverted_b;
  
  
  //Generating outputs for the final result 4:1 mux
  
  //Mux to decide final output
  wire [3:0] inputs4to1;
  mux4to1 M2(.op (Result), .ip (inputs4to1), .select (Operation[1:0]));
  
  //1. AND gate
  and G2(inputs4to1[0], op1, op2);
  
  //2. OR gate
  or G3(inputs4to1[1], op1, op2);
  
  //3. Full-adder
  fullAdder A0(.a (op1), .b (op2), .Cin (CarryIn), .sum (inputs4to1[2]), .Cout (CarryOut));
  
  //4. Less
  assign inputs4to1[3] = Less; 
  
endmodule

//Defining 1-bit ALU module for the MSB
module ALU_1bit_MSB(a, b, Less, Ainvert, Binvert, CarryIn, Operation, Result, CarryOut, Set, Overflow);
  
  input wire a, b, Less, Ainvert, Binvert, CarryIn;
  input wire [1:0] Operation;
  output wire Result, CarryOut, Set, Overflow;
  
  //Mux to feed a or a'
  wire [1:0] inputs2to1_0;
  wire op1;
  mux2to1 M0(.op (op1), .ip (inputs2to1_0), .select (Ainvert));
  
  //Giving inputs as a or a'
  assign inputs2to1_0[0] = a;
  wire inverted_a;
  not G0(inverted_a, a);
  assign inputs2to1_0[1] = inverted_a;
  
  
  //Mux to feed b or b'
  wire [1:0] inputs2to1_1;
  wire op2;
  mux2to1 M1(.op (op2), .ip (inputs2to1_1), .select (Binvert));
  
  //Giving inputs as b or b'
  assign inputs2to1_1[0] = b;
  wire inverted_b;
  not G1(inverted_b, b);
  assign inputs2to1_1[1] = inverted_b;
  
  
  //Generating outputs for the final result 4:1 mux
  
  //Mux to decide final output
  wire [3:0] inputs4to1;
  mux4to1 M2(.op (Result), .ip (inputs4to1), .select (Operation[1:0]));
  
  //1. AND gate
  and G2(inputs4to1[0], op1, op2);
  
  //2. OR gate
  or G3(inputs4to1[1], op1, op2);
  
  //3. Full-adder
  fullAdder A0(.a (op1), .b (op2), .Cin (CarryIn), .sum (inputs4to1[2]), .Cout (CarryOut));
  
  //4. Less
  assign inputs4to1[3] = Less;
  
  //Calculating whether overflow has occured
  xor G4(Overflow, CarryIn, CarryOut);
  
  //Checking SLT
  xor G5(Set, Overflow, inputs4to1[2]); //Checks for a-b<0 for no overflow, or for negative overflow. 
  
endmodule