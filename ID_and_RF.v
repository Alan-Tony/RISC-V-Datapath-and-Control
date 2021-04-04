`include "Sign_Extension.v"
`include "Register_File.v"

module ID_and_RF(clk, pc_recieve, instruction_recieve, writeData_recieve, pc,extended,Func, ALU_Src,Mem_Write, ALU_Op,Mem_to_Reg, Mem_Read, Branch,read_data_1, read_data_2);

    input clk;
    input [63:0] pc_recieve;
    input [31:0] instruction_recieve;
    input [63:0] writeData_recieve;
    
    reg [63:0] writeData;
    output reg [63:0] pc;
    output wire [63:0] extended;
    reg [31:0] instruction;


    output wire [3:0] Func;
    assign Func={instruction[30], instruction[14:12]};

    
    wire [2:0] sel;     //Tells the type of instruction
    reg [11:0] imm;    
    //Control Unit signals
    reg regWrite = 0;
    output reg ALU_Src = 0;
    output reg Mem_Write = 0;
    output reg [1:0] ALU_Op = 2'b0;
    output reg Mem_to_Reg = 0;
    output reg Mem_Read = 0;
    output reg Branch = 0;

    //Data read from register file
    output wire [63:0] read_data_1;
    output wire [63:0] read_data_2;


    //Instantiate modules
    regfile RF(.clk (clk), .regWrite (regWrite), .readReg1 (instruction[19:15]) , .readReg2 (instruction[24:20]), .writeReg (instruction[11:7]), .writeData (writeData), .readData1 (read_data_1), .readData2(read_data_2));
    signextend SE(.imm (imm), .extended (extended));


    always @(posedge clk)
    
    begin
        pc = pc_recieve;
        instruction = instruction_recieve;
        writeData = writeData_recieve;
        
        case (sel) 

            3'b000:  imm = instruction[11:0];          
            
            3'b010:  imm = {instruction[11:5], instruction[4:0]};

            3'b110:  imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};

            3'b011:  imm = 12'bx;
          
        endcase
    end

endmodule