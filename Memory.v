`include "Data_Memory.v"

module Memory ( clk, 
                Mem_Read, Mem_Write, writeData, ReadData,
                Zero_recieve, Branch_recieve,  PC_SRC, pcbranch_receive, pcbranch,
                result_recieve, result,
                Mem_to_Reg_recieve, Mem_to_Reg );


    input clk;


    //For Data Memory module
    //1. CU instructions
    input Mem_Read, Mem_Write;
    //2. Data
    output [63:0] ReadData;
    input [63:0] writeData;


    //Signals for selecting between pc+4 and pc branch
    input Branch_recieve, Zero_recieve;
    reg Branch = 0, Zero = 0;
    //Result of AND
    output PC_SRC;

    //Select signal for Instruction Fetch
    and G0(PC_SRC, Branch, Zero);



    //Pass on pc branch
    input [63:0] pcbranch_receive;
    output reg [63:0] pcbranch = 64'bx;


    
    //Pass result to write back
    input [63:0] result_recieve;    
    output reg [63:0] result = 64'bx;

    //Pass on Control Unit to Write Back Signals
    input Mem_to_Reg_recieve;
    output reg Mem_to_Reg = 0;


    //Instantiating the data memory module
    Data_Memory DM(.clk (clk), .MemRead (Mem_Read), .MemWrite (Mem_Write), .Address (result_recieve), .WriteData (writeData), .ReadData (ReadData));



    always @(posedge clk)
    begin

        //To decide branch
        Branch = Branch_recieve;
        Zero = Zero_recieve;

        //Pass on pc branch
        pcbranch = pcbranch_receive;

        //For write back
        result = result_recieve;

        //CU signal for Write Back
        Mem_to_Reg = Mem_to_Reg_recieve;

    end

endmodule
              