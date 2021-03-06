`include "Sign_Extension.v"
`include "Register_File.v"
`include "Control_Unit.v"

module ID_and_RF(clk, regWrite_receive, regWrite_out, reset_receive, pc_receive, instruction_receive, writeData_receive, pc,extended,Func, ALU_Src,Mem_Write, ALU_Op,Mem_to_Reg, Mem_Read, Branch,read_data_1, read_data_2);

    input clk;
    input reset_receive;
    input [63:0] pc_receive;
    input [31:0] instruction_receive;
    input [63:0] writeData_receive;
    
    reg [63:0] writeData;
    output reg [63:0] pc;
    output wire [63:0] extended;
    reg [31:0] instruction;

    output reg [3:0] Func;
    
    wire [2:0] sel = instruction_receive[6:4];     //Tells the type of instruction
    reg [11:0] imm;    
    //Control Unit signals
    input regWrite_receive;
    reg regWrite = 0;
    output regWrite_out;
    output wire ALU_Src;
    output wire Mem_Write;
    output wire [1:0] ALU_Op;
    output wire Mem_to_Reg;
    output wire Mem_Read;
    output wire Branch;
    //Control Unit
    control_unit CU(.opcode (instruction[6:0]), .ALUSrc (ALU_Src), .MemtoReg (Mem_to_Reg), .Reg_write (regWrite_out), .mem_read (Mem_Read), .mem_write (Mem_Write),
    .branch (Branch), .ALUOp (ALU_Op));

    //Data read from register file
    output wire [63:0] read_data_1;
    output wire [63:0] read_data_2;


    //Instantiate modules
    reg reset = 1;
    regfile RF(.clk (clk), .reset (reset), .regWrite (regWrite), .readReg1 (instruction_receive[19:15]) , .readReg2 (instruction_receive[24:20]), .writeReg (instruction_receive[11:7]), .writeData (writeData), .readData1 (read_data_1), .readData2(read_data_2));
    signextend SE(.imm (imm), .extended (extended));


    always @(posedge clk)
    
    begin
        reset = reset_receive;
        pc = pc_receive;
        instruction = instruction_receive;
        writeData = writeData_receive;

        regWrite = regWrite_receive;

        Func={instruction_receive[30], instruction_receive[14:12]};
        
        case (sel) 

            3'b000: imm = instruction_receive[31:20];
            
            3'b010: imm = {instruction_receive[31:25], instruction_receive[11:7]};

            3'b110: imm = {instruction_receive[31], instruction_receive[7], instruction_receive[30:25], instruction_receive[11:8]};

            3'b011: imm = 12'bx;
          
        endcase
    end

endmodule