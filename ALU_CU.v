//`timescale 1ns/1ps

module ALU_CU(ALUOp, Func, Operation);
  
  input [1:0] ALUOp;
  input [3:0] Func;
  output [3:0] Operation;
  
  wire w1, w2, w3, w4, ALUOp0_inv, Func0_inv, Func2_inv;
  
  not G0(ALUOp0_inv, ALUOp[0]);
  not G1(Func0_inv, Func[0]);
  not G2(Func2_inv, Func[2]);
  
  and G3(Operation[0], ALUOp[1], ALUOp0_inv, Func[1], Func0_inv);
  
  and G4(w1, ALUOp[1], ALUOp0_inv, Func[1], Func[2]);
  not G5(Operation[1], w1);
  
  and G6(w2, Func2_inv, Func[1]);
  or G7(w3, Func[3], w2);
  and G8(w4, ALUOp[1], ALUOp0_inv, w3);
  or G9(Operation[2], w4, ALUOp[0]);
  
  assign Operation[3] = 0;  
    
endmodule
