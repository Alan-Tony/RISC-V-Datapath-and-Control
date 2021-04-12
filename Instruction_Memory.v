
module Instruction_Memory(instruction, address);

    input [63:0] address; //Passed by IF hardware module
    output reg [31:0] instruction;  //Fetched instruction
    
    reg [31:0] instructionMemory[31:0];  //Reg used to simulate memory

    initial
    begin
        $readmemb("instructions.mem", instructionMemory);    //Loading instructions from text file
    end

    always @(address)
    begin
        //$display("Address= %b", address);
        instruction = instructionMemory[address];
    end

endmodule