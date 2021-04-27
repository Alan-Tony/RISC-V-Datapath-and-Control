`include "Instruction_Fetch.v"
`include "ID_and_RF.v"
`include "Memory.v"
`include "Execution.v";

//Testnech for Write Back
module WB_TB();

  reg clk = 0;

  reg [63:0] Result = 64'd1, ReadData = 64'd2;
  wire [63:0] WriteData;

  reg Mem_to_Reg = 1, regWrite_receive = 1;
  wire regWrite;

  Write_Back WB(
    clk,
    Result, ReadData, WriteData,
    Mem_to_Reg, regWrite_receive, regWrite
  );

  initial begin
    
    #1 clk = ~clk;
    #5 $display("\nWrite Data = %b, reg write= %b", WriteData, regWrite);

  end

endmodule


//tb module to check execution
module exec_tb();

  //Control Unit Signals
  reg clk = 0;
  reg ALU_Src=1'b1; //Use immediate value for addition
  reg regWrite_receive = 1;
  reg Mem_Write_receive=1'b0;
  reg [1:0] ALU_Op_receive = 2'b10;   //Add
  reg Mem_to_Reg_receive=1'b0;
  reg Mem_Read_receive=1'b1;
  reg Branch_receive=1'b0;
  
  //Passed on CU signals
  wire regWrite;
  wire Mem_Write;
  wire Mem_to_Reg;
  wire Mem_Read;
  wire Branch;
  
  //1st ALU inputs
  reg [63:0] pc_receive = 64'b0;
  reg [63:0] extended_receive = 64'd12;
  
  //alu 2 ip
  reg [63:0] read_data_1_receive = 64'd3;
  reg [63:0] read_data_2_receive = 63'd5;
  reg [3:0] Func_receive = 4'b0000;
  
  //alu 2 op
  wire [63:0] pcbranch;
  wire [63:0] Result;
  wire Zero;
  
  //Read data 2 passed on 2 Memory stage
  wire [63:0] read_data_2;
  wire [63:0] read_data_1;
  
  exec exec0(.clk (clk),  
            .regWrite_receive (regWrite_receive), .ALU_Src (ALU_Src), .Mem_Write_receive (Mem_Write_receive), .ALU_Op_receive (ALU_Op_receive),
            .regWrite (regWrite), .Mem_to_Reg_receive (Mem_to_Reg_receive), .Mem_Read_receive (Mem_Read_receive), .Branch_receive (Branch_receive),

            .Mem_to_Reg (Mem_to_Reg), .Mem_Write (Mem_Write), .Mem_Read (Mem_Read), .Branch (Branch),
            .pc_receive (pc_receive), .extended_receive (extended_receive), .pcbranch (pcbranch),
            .read_data_1_receive (read_data_1_receive), .read_data_2_receive (read_data_2_receive), .read_data_2 (read_data_2), 
            .Func_receive (Func_receive),
            .Result (Result), .Zero (Zero) );
  
  initial begin
    #1 clk = ~clk;
    #5 $display("\n(Addition Operation)\nExecution outputs :- pcbranch= %b, Result=%b,\n Zero= %b, read data 2 = %b",pcbranch, Result, Zero, read_data_2);
  end

endmodule


//Testbench for Memory module
module Memory_TB();

  reg clk = 0;

  reg Mem_Read = 1, Mem_Write = 0;
  reg [63:0] writeData = 64'bx;
  wire [63:0] ReadData;

  reg Zero_receive = 1'b1, Branch_receive = 1'b0;
  wire PC_SRC;
  reg [63:0] pcbranch_receive = 64'd12;
  wire [63:0] pcbranch;

  reg [63:0] result_receive = 64'd5;
  wire [63:0] result;

  reg regWrite_receive = 1;
  reg Mem_to_Reg_receive = 0;
  wire regWrite;
  wire Mem_to_Reg;

  Memory M0( .clk (clk), 
          .Mem_Read (Mem_Read), .Mem_Write (Mem_Write), .writeData (writeData), .ReadData (ReadData),
          .Zero_receive (Zero_receive), .Branch_receive (Branch_receive),  .PC_SRC (PC_SRC), .pcbranch_receive (pcbranch_receive), .pcbranch (pcbranch),
          .result_receive (result_receive), .result (result),
          .regWrite_receive (regWrite_receive), .Mem_to_Reg_receive (Mem_to_Reg_receive), .regWrite (regWrite), .Mem_to_Reg (Mem_to_Reg) );


  initial begin
    
    clk = ~clk;

    #5 $display("\nread data= %b, pc src = %b\npcbranch= %b, memtoreg = %b\nresult = %b", ReadData, PC_SRC, pcbranch, Mem_to_Reg, result);
    
  end

endmodule

//Testbench for instruction decode and register file
module ID_and_RF_TB();

  reg clk = 0;
  wire [63:0] pc, read_data_1, read_data_2, extended;
  wire [3:0] Func;
  wire ALU_Src, Mem_Write , Mem_to_Reg, Mem_Read, Branch;
  wire [1:0] ALU_Op;

  reg regWrite_receive = 0;
  wire regWrite_out;

  ID_and_RF IDRF(.clk (clk), 
  .reset_receive (1'b0),
  .pc_receive (64'b1), 
  .regWrite_receive (regWrite_receive), 
  .regWrite_out (regWrite_out),
  
  /*
  .instruction_receive (32'b00000000011100110000001010110011), //add
  .instruction_receive (32'b11000000001001100011001010000011), //ld
  */
  .instruction_receive (32'b00000000010100011000100011100011), //beq  
  /*
  .instruction_receive (32'b00000000011100110010001010110011), //slt
  */
  .writeData_receive (64'bx),
  .pc (pc),
  .extended (extended),
  .Func (Func), 
  .ALU_Src (ALU_Src),
  .Mem_Write (Mem_Write), 
  .ALU_Op (ALU_Op),
  .Mem_to_Reg (Mem_to_Reg), 
  .Mem_Read (Mem_Read), 
  .Branch (Branch),
  .read_data_1 (read_data_1), 
  .read_data_2 (read_data_2) );

  initial begin

    #1 clk = ~clk;
    #1 clk = ~clk;
  
    #5 $display("\nFunc = %b, Extended = %b,\nread_data_1 = %b, read_data_2 = %b, pc = %b", Func, extended, read_data_1, read_data_2, pc);
    $display("\nFunc= %b, regWrite_out= %b, ALU_Src= %b, Mem_Write= %b, ALU_Op= %b\nMem_to_Reg= %b, Mem_Read= %b, Branch= %b", Func, regWrite_out, ALU_Src, Mem_Write, ALU_Op, Mem_to_Reg, Mem_Read, Branch);
  end

endmodule


//Testbench for instruction fetch hardware
module IF_Testbench();
  
  reg clk = 1'b0;
  reg reset = 1'b0;
  wire [31:0] instruction;
  wire [63:0] pc_current;
  
  reg [64:0] branches[0:7];
  reg [63:0] branch;
  reg select;
  reg [64:0] concat;
  
  Instruction_Fetch IF(
  .clk (clk), .reset (reset), .pc_branch (branch), .select (select), .instruction (instruction), .pc_current (pc_current)
  );

  integer i;
  
  initial
  begin
  
  select <= 0;

  $readmemb("branch_select.mem", branches);
    
  for(i=0; i<8; i=i+1)
  begin

    if(i%2)
    begin

      #1 $display("\nCycle number= %d, Branch address= %b, select= %b, instruction= %b, pc_current= %b, clk= %b", i>>1, branch, select, instruction, pc_current, clk);
    end
    else
    begin
      #1 concat = branches[i>>1];
      select = concat[64];
      branch = concat[63:0];
    end

    #1 clk  = ~clk;
  end
  
  end
  
endmodule

