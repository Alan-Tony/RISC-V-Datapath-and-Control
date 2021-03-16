
module ALU_CU(ALUOp, Func, Operation);
  
    
  input wire [1:0] ALUOp;
  input wire [5:0] Func;
  output wire [3:0] Operation;
  
  wire ALUOp0_inv, ALUOp1_inv, Func2_inv;
  
  not G0(ALUOp0_inv, ALUOp[0]);
  not G1(ALUOp1_inv, ALUOp[1]);
  not G2(Func2_inv, Func[2]);
  
  wire w1;
  or G3(w1, Func[0], Func[3]);
  and G4(Operation[0], w1, ALUOp[1]);
  
  or G5(Operation[1], ALUOp1_inv, Func2_inv);
  
  wire w2;
  and G6(w2, Func[1], ALUOp[1]);
  or G7(Operation[2], ALUOp[0], w2);
  
  and G8(Operation[3], ALUOp[0], ALUOp0_inv);

endmodule