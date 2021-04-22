
module Write_Back (
    clk,
    Result, ReadData, WriteData,
    Mem_to_Reg, regWrite_receive, regWrite
);

input clk;

input [63:0] Result, ReadData;
output reg [63:0] WriteData;

input Mem_to_Reg, regWrite_receive;
output reg regWrite = 0;


always @(posedge clk)
begin

    if(Mem_to_Reg)
        WriteData = ReadData;   //Data written to register will be from memory
    else
        WriteData = Result; 

    regWrite = regWrite_receive;

end
    
endmodule