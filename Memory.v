`include "Data_Memory.v"

module Memory (clk, Mem_to_Reg_recieve, Mem_Read_recieve, Mem_Write_recieve, Branch_recieve, Zero_recieve, result_recieve, writeData_recieve)

    input clk, Mem_to_Reg_recieve, Mem_Read_recieve, Mem_Write_recieve, Branch_recieve, Zero_recieve;
    input [63:0] result_recieve, writeData_recieve;


    //output reg []

       

    Data_Memory DM(.clk (clk), MemRead, MemWrite, address, WriteData, ReadData);


    always @(posedge clk)
    begin

        

    end

endmodule
              