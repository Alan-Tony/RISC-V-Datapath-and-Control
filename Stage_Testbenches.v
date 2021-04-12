`include "Instruction_Fetch.v"
`include "ID_and_RF.v"

//Testbench for instruction decode and register file
module ID_and_RF_TB();

  reg clk = 0;
  wire [63:0] pc, read_data_1, read_data_2, extended;
  wire [3:0] Func;
  wire ALU_Src, Mem_Write , Mem_to_Reg, Mem_Read, Branch;
  wire [1:0] ALU_Op;

  ID_and_RF IDRF(.clk (clk), 
  .reset_receive (0),
  .pc_recieve (64'b1), 
  /*
  .instruction_recieve (32'b00000000011100110000001010110011), //add
  .instruction_recieve (32'b11000000001001100011001010000011), //ld
  */
  .instruction_recieve (32'b00000000101010011000100011100011), //beq
  .writeData_recieve (64'bx),
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
  .read_data_2 (read_data_2));

  initial begin

    #1 clk = ~clk;
    #5 $display("\nFunc = %b, Extended = %b,\nread_data_1 = %b, read_data_2 = %b, pc = %b", Func, extended, read_data_1, read_data_2, pc);
    #1 clk = ~clk;
  
    #5 $display("\nFunc = %b, Extended = %b,\nread_data_1 = %b, read_data_2 = %b, pc = %b", Func, extended, read_data_1, read_data_2, pc);
  end

endmodule


//Testbench for instruction fetch hardware
module IF_Testbench();
  
  reg clk = 1'b0;
  reg reset = 1'b0;
  wire [31:0] instruction;
  
  reg [64:0] branches[0:7];
  reg [63:0] branch;
  reg select;
  reg [64:0] concat;
  
  Instruction_Fetch IF(
  .clk (clk), .reset (reset), .pc_branch (branch), .select (select), .instruction (instruction)
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

      #1 $display("\nCycle number= %d, Branch address= %b, select= %b, instruction= %b, clk= %b", i>>1, branch, select, instruction, clk);
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

