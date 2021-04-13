
module Data_Memory(clk, MemRead, MemWrite, Address, WriteData, ReadData);

    input [63:0] Address;
    input [63:0] WriteData;
    input MemRead, MemWrite, clk;
    
    output reg [63:0] ReadData;
    reg [63:0] dataMemory[32:0];  //Reg used to simulate memory

    initial
    begin
        ReadData = 64'b0;
        $readmemb("data.mem", dataMemory);    //Loading instructions from text file
    end

    always @(posedge clk)
    begin
        
        if(MemWrite ^ MemRead)  //Both read and write cannot happen at the same time
        begin
          if(MemWrite) dataMemory[Address] = WriteData;
        
          if(MemRead) ReadData = dataMemory[Address];
        end
    end

endmodule