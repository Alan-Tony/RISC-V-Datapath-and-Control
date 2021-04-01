`include "Sign_Extension.v"
`include "Register_File.v"

module ID_and_RF(clk, pc_recieve, instruction_recieve, writeData_recieve, pc_next, extended, read_data_1, read_data_2)

    input clk;
    input [63:0] pc_recieve;
    input [31:0] instruction_recieve;
    input [63:0] writeData_recieve;
    reg [63:0] writeData;
    output reg [63:0] pc;
    output wire [63:0] extended;


    output wire [3:0] Func;
    assign Func={instruction[30], instruction[14:12]};

    
    reg [31:0] instruction;
    wire [2:0] sel;     //Tells the type of instruction
    wire [11:0] imm;    
    //Control Unit signals
    wire regWrite = 0;
    output wire ALU_Src = 0;
    output wire Mem_Write = 0;
    output wire [1:0] ALU_Op = 2'b0;
    output wire Mem_to_Reg = 0;
    output wire Mem_Read = 0;
    output wire Branch = 0;

    //Data read from register file
    output wire [63:0] read_data_1;
    output wire [63:0] read_data_2;

    //Instantiate modules
    regfile RF(.clk (clk), .regWrite (regWrite), .readReg1 (instruction[19:15]) , .readReg2 (instruction[24:20]), .writeReg (instruction[11:7]), .writeData (writeData), .readData1 (read_data_1), .readData2(read_data_2));
    signextend SE(.imm (imm), .extended (extended));

    case (sel)

        case 3'b000: assign imm = instruction[11:0];          
        
        case 3'b010:assign imm = {instruction[11:5], instruction[4:0]};

        case 3'b110: assign imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};

        case 3'b011: assign imm = 12'bx;
            
    endcase


    always @(posedge clk)
    begin
        pc = pc_next_recieve;
        instruction = instruction_recieve;
        writeData = writeData_recieve;
    end

endmodule