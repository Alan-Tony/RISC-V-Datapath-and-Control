//`include "ALU_1bit.v"  //Utility Modules are already included in ALU.v
`include "ALU_64bit.v"

module ALU_TopLevel_TB;
  
  reg signed [63:0] A, B;
  
  reg [1:0] ALUOp;
  reg [5:0] Func;  
  wire [3:0] Operation;
  
  wire signed [63:0] Result;
  wire Overflow, Zero;
  
  ALU_CU CU(.ALUOp (ALUOp), .Func (Func), .Operation (Operation));
  ALU_64bit ALU64(.A (A), .B (B), .Operation(Operation), .Result (Result), .Overflow, .Zero);
  
  initial
    begin
      
      //Load/Store. Basically addition (of addresses)
      A = 123;
      B = 4;
      ALUOp = 2'b00;
      Func = 6'bxxxxxx;
      #5 $display("\nTesting for Load/Store Adddress Calculation:\nA= %d, B= %d, Result= %d, Overflow= %d, Zero= %d", A, B, Result, Overflow, Zero);
      
      //BEQ (Check for equality. Zero bit is set on true unset on false)
      A = 254;
      B = 254;
      ALUOp = 2'b01;
      Func = 6'bxxxxxx;
      #5 $display("\nTesting for Branch On Equal:\nA= %d, B= %d, Result= %d, Overflow= %d, Zero= %d", A, B, Result, Overflow, Zero);
      
      //Add
      A = -5;
      B = 12;
      ALUOp = 2'b10;
      Func = 6'b100000;
      #5 $display("\nTesting for Addition:\nA= %d, B= %d, Result= %d, Overflow= %d, Zero= %d", A, B, Result, Overflow, Zero);
      
      //Sub
      A = 20;
      B = 111;
      ALUOp = 2'b10;
      Func = 6'b100010;
      #5 $display("\nTesting for Subtraction: A= %d, B= %d, Result= %d, \nOverflow= %d, Zero= %d", A, B, Result, Overflow, Zero);
      
      //AND
      A = 10;
      B = 12;
      ALUOp = 2'b10;
      Func = 6'b100100;
      #5 $display("\nTesting for Logical AND: \nA= %b, \nB= %b, \nResult= %b, Overflow= %d, Zero= %d", A, B, Result, Overflow, Zero);
      
      //OR
      A = 10;
      B = 12;
      ALUOp = 2'b10;
      Func = 6'b100101;
      #5 $display("\nTesting for Logical OR: \nA= %b, \nB= %b, \nResult= %b, Overflow= %d, Zero= %d", A, B, Result, Overflow, Zero);
      
      //SLT
      A = 123;
      B = 10242;
      ALUOp = 2'b10;
      Func = 6'b101010;
      #5 $display("\nTesting for Store Less Than:\nA= %d, B= %d, Result= %d, Overflow= %d, Zero= %d", A, B, Result, Overflow, Zero);    
                
    end
  
endmodule

module ALU_1b_MSB_TB;
  
  reg a, b, Less, Ainvert, Binvert, CarryIn;
  reg [1:0] Operation;
  
  wire Result, CarryOut, Set, Overflow;
  
  ALU_1bit_MSB ALU1(
  .a (a),
  .b (b),
  .Less (Less),
  .Ainvert (Ainvert),
  .Binvert (Binvert),
  .CarryIn (CarryIn),
  .Operation (Operation),
  .Result (Result),
  .CarryOut (CarryOut),
  .Set (Set),
  .Overflow (Overflow)
  );
  
  initial
    begin
      a = 0;
      b = 1;
      Less = 0; //Less is used to check for a<b
      Ainvert = 0;
      Binvert = 0;
      CarryIn = 0;
      
      Operation = 2'b00;  //For and operation      
      #1 $display("\na AND b = %d, Overflow= %d, SLT= %d", Result, Overflow, Set);
      
      Operation = 2'b01;  //For OR operation      
      #1 $display("\na OR b = %d, Overflow= %d, SLT= %d", Result, Overflow, Set);

      Operation = 2'b10;  //For Add operation      
      #1 $display("\na + b = %d, CarryOut= %d, Overflow= %d, SLT= %d", Result, CarryOut, Overflow, Set);
            
    end
  
endmodule

module ALU_1b_Ordinary_TB;
  
  reg a, b, Less, Ainvert, Binvert, CarryIn;
  reg [1:0] Operation;
  
  wire Result, CarryOut;
  
  ALU_1b_Ordinary ALU1(
  .a (a),
  .b (b),
  .Less (Less),
  .Ainvert (Ainvert),
  .Binvert (Binvert),
  .CarryIn (CarryIn),
  .Operation (Operation),
  .Result (Result),
  .CarryOut (CarryOut)
  );
  
  initial
    begin
      a = 1;
      b = 1;
      Less = 0; //Less is used to check for a<b
      Ainvert = 0;
      Binvert = 0;
      CarryIn = 1;
      
      Operation = 2'b00;  //For and operation      
      #1 $display("\na AND b = %d", Result);
      
      Operation = 2'b01;  //For OR operation      
      #1 $display("\na OR b = %d", Result);

      Operation = 2'b10;  //For Add operation      
      #1 $display("\na + b = %d, CarryOut= %d", Result, CarryOut);
            
    end
  
endmodule

module fullAdder_TB;
  
  reg a, b, Cin;
  wire sum, Cout;
  
  //Instantiating a full adder
  fullAdder A1(
  .a (a),
  .b (b),
  .Cin (Cin),
  .sum (sum),
  .Cout (Cout)
  );
  
  //Test block
  initial
    begin
      
      a = 1'b0;
      b = 1'b0;
      Cin = 1'b0;
      
      #1 $display("\nSum= %d, Carry-out= %d", sum, Cout);
          
    end 
  
endmodule


//Testbench for 4:1 mux
module mux4to1_TB;
  
  reg [3:0] inp;
  reg [1:0] select;
  
  wire op;
  
  mux4to1 M1(op, inp, select);
  
  initial
    begin
      
      inp = 4'b0101;
      
      select = 2'b00;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      select = 2'b01;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      select = 2'b10;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      select = 2'b11;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      #1 $display("First bit= %d", inp[0]);
    
    end

endmodule  