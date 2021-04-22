`include "Data_Memory.v"

module Memory ( clk, 
                Mem_Read, Mem_Write, writeData, ReadData,
                Zero_receive, Branch_receive,  PC_SRC, pcbranch_receive, pcbranch,
                result_receive, result,
                regWrite_receive, Mem_to_Reg_receive, regWrite, Mem_to_Reg );


    input clk;


    //For Data Memory module
    //1. CU instructions
    input Mem_Read, Mem_Write;
    //2. Data
    output [63:0] ReadData;
    input [63:0] writeData;


    //Signals for selecting between pc+4 and pc branch
    input Branch_receive, Zero_receive;
    reg Branch = 0, Zero = 0;
    //Result of AND
    output PC_SRC;

    //Select signal for Instruction Fetch
    and G0(PC_SRC, Branch, Zero);



    //Pass on pc branch
    input [63:0] pcbranch_receive;
    output reg [63:0] pcbranch = 64'bx;


    
    //Pass result to write back
    input [63:0] result_receive;    
    output reg [63:0] result = 64'bx;

    //Pass on Control Unit signals
    input Mem_to_Reg_receive;
    output reg Mem_to_Reg = 0;
    input wire regWrite_receive;
    output reg regWrite;


    //Instantiating the data memory module
    Data_Memory DM(.clk (clk), .MemRead (Mem_Read), .MemWrite (Mem_Write), .Address (result_receive), .WriteData (writeData), .ReadData (ReadData));



    always @(posedge clk)
    begin

        //To decide branch
        Branch = Branch_receive;
        Zero = Zero_receive;

        //Pass on pc branch
        regWrite =  regWrite_receive;
        pcbranch = pcbranch_receive;

        //For write back
        result = result_receive;

        //CU signal for Write Back
        Mem_to_Reg = Mem_to_Reg_receive;

    end

endmodule
              