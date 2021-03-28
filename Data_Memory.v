//`timescale 1ns/1ps

module Data_Memory(clk, MemRead, MemWrite, address, WriteData, ReadData);

    input [63:0] address;
    input [63:0] WriteData;
    input MemRead, MemWrite, clk;
    
    output reg [63:0] ReadData;
    reg [63:0] dataMemory[32:0];  //Reg used to simulate memory

    initial
    begin
        ReadData = 64'bz;
        $readmemb("data.mem", dataMemory);    //Loading instructions from text file
    end

    always @(posedge clk)
    begin
        
        if(MemWrite ^ MemRead)  //Both read an write cannot happen at the same time
        begin
          if(MemWrite) dataMemory[address] = WriteData;
        
          if(MemRead) ReadData = dataMemory[address];
        end
    end

endmodule