
`include "Instruction_Fetch.v"
`include "ID_and_RF.v"
`include "Execution.v"
`include "Memory.v"

module Pipeline ();

  reg clk = 0;

  //IF Ports

  //Output
  wire [31:0] instruction_IF;
  wire [63:0] pc_current_IF;


  //ID and RF Ports

  //Pipeline input
  reg reset_to_IDRF = 0;

  //Output
  wire regWrite_out_IDRF, ALU_Src_IDRF, Mem_Write_IDRF, Mem_to_Reg_IDRF, Mem_Read_IDRF, Branch_IDRF;
  wire [1:0] ALU_Op_IDRF;
  wire [3:0] Func_IDRF;
  wire [63:0] pc_IDRF, extended_IDRF, read_data_1_IDRF, read_data_2_IDRF;


  //Execution Ports

  //Output
  wire regWrite_EX, Mem_Write_EX, Mem_to_Reg_EX, Mem_Read_EX, Branch_EX, Zero_EX;
  wire [63:0] pcbranch_EX, read_data_2_EX, Result_EX;

  //Memory Ports

  //Output
  wire PC_SRC_M, Mem_to_Reg_M, regWrite_M;
  wire [63:0] ReadData_M, pcbranch_M, result_M;

  //Write Back Ports

  //Output
  wire regWrite_WB;
  wire [63:0] WriteData_WB;
  
  Instruction_Fetch IF0
  (
    .clk                            (clk),
    .reset                          (1'b0),
    .pc_branch                      (pcbranch_M),
    .select                         (PC_SRC_M),
    .instruction                    (instruction_IF),
    .pc_current                     (pc_current_IF)
  );

  ID_and_RF IDRF0(
    .clk                            (clk), 
    .regWrite_receive               (regWrite_WB),      //From WB
    .regWrite_out                   (regWrite_out_IDRF),
    .reset_receive                  (reset_to_IDRF),
    .pc_receive                     (pc_current_IF),
    .instruction_receive            (instruction_IF),
    .writeData_receive              (WriteData_WB),     //From WB
    .pc                             (pc_IDRF),
    .extended                       (extended_IDRF),
    .Func                           (Func_IDRF),
    .ALU_Src                        (ALU_Src_IDRF),
    .Mem_Write                      (Mem_Write_IDRF),
    .ALU_Op                         (ALU_Op_IDRF),
    .Mem_to_Reg                     (Mem_to_Reg_IDRF),
    .Mem_Read                       (Mem_Read_IDRF),
    .Branch                         (Branch_IDRF),
    .read_data_1                    (read_data_1_IDRF),
    .read_data_2                    (read_data_2_IDRF)
  );


  exec ex0
  ( 
    .clk                            (clk), 
    .regWrite_receive               (regWrite_out_IDRF),
    .ALU_Src                        (ALU_Src_IDRF),
    .Mem_Write_receive              (Mem_Write_IDRF),
    .ALU_Op_receive                 (ALU_Op_IDRF),
    .Mem_to_Reg_receive             (Mem_to_Reg_IDRF),
    .Mem_Read_receive               (Mem_Read_IDRF),
    .Branch_receive                 (Branch_IDRF),
    .regWrite                       (regWrite_EX),
    .Mem_to_Reg                     (Mem_to_Reg_EX),
    .Mem_Write                      (Mem_Write_EX),
    .Mem_Read                       (Mem_Read_EX),
    .Branch                         (Branch_EX),
    .pc_receive                     (pc_IDRF),
    .extended_receive               (extended_IDRF),
    .pcbranch                       (pcbranch_EX),
    .read_data_1_receive            (read_data_1_IDRF),
    .read_data_2_receive            (read_data_2_IDRF),
    .read_data_2                    (read_data_2_EX), 
    .Func_receive                   (Func_IDRF),
    .Result                         (Result_EX),
    .Zero                           (Zero_EX)
  );

  Memory M0(
    .clk                            (clk), 
    .Mem_Read                       (Mem_Read_EX),
    .Mem_Write                      (Mem_Write_EX),
    .writeData                      (read_data_2_EX),
    .ReadData                       (ReadData_M),
    .Zero_receive                   (Zero_EX),
    .Branch_receive                 (Branch_EX),
    .PC_SRC                         (PC_SRC_M),
    .pcbranch_receive               (pcbranch_EX),
    .pcbranch                       (pcbranch_M),
    .result_receive                 (Result_EX),
    .result                         (result_M),
    .regWrite_receive               (regWrite_EX),
    .Mem_to_Reg_receive             (Mem_to_Reg_EX),
    .regWrite                       (regWrite_M),
    .Mem_to_Reg                     (Mem_to_Reg_M)
  );

  Write_Back WB0(
    .clk                            (clk),
    .Result                         (result_M),
    .ReadData                       (ReadData_M),
    .WriteData                      (WriteData_WB),
    .Mem_to_Reg                     (Mem_to_Reg_M),
    .regWrite_receive               (regWrite_M),
    .regWrite                       (regWrite_WB)
  );

  integer i;


  initial begin

    for(i=0; i<2; i= i+1)
    begin
      
      clk = ~clk;

      if(i%2 == 1)
      begin

        //IF Stage
        #5 $display("\nIF ----- (Instr. No.: %d) -- instruction_IF= %b, pc_current_IF= %b", (i-1)/2, instruction_IF, pc_current_IF);

        //Instruction Decode and Register File Stage
        $display("\nIDRF --- (Instr. No.: %d) -- regWrite_WB= %b, read_data_1_IDRF= %d, read_data_2_IDRF= %d", (i-3)/2, regWrite_WB, read_data_1_IDRF, read_data_2_IDRF);
        $display("\n\t\t Control Signals: ALU_Op_IDRF= %b", ALU_Op_IDRF);

        //Exec Stage
        $display("\nEX ----- (Instr. No.: %d) -- Result_EX= %d, Zero_EX= %b, = %b", (i-5)/2, Result_EX, Zero_EX, pcbranch_EX);

        //Memory Stage
        $display("\nM -----  (Instr. No.: %d) -- ReadData_M= %b, ", (i-7)/2, ReadData_M, PC_SRC_M);

        //Write Back Stage
        $display("\nWB ----- (Instr. No.: %d) -- regWrite_WB= %b, WriteData_WB- %b", (i-9)/2, regWrite_WB, WriteData_WB);

      end

    end

    //Display

  end


endmodule