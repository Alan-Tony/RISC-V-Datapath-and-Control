`include "ALU_64bit.v"
`include "ALU_CU.v"

module exec(clk,  
            regWrite_receive, ALU_Src, Mem_Write_receive, ALU_Op_receive, Mem_to_Reg_receive, Mem_Read_receive, Branch_receive,
            regWrite, Mem_to_Reg, Mem_Write, Mem_Read, Branch,
            pc_receive, extended_receive, pcbranch,
            read_data_1_receive, read_data_2_receive, read_data_2, 
            Func_receive,
            Result, Zero );
                 

    input wire clk;
    
    //Control Unit signals
    input wire regWrite_receive;
    input wire ALU_Src;
    input wire Mem_Write_receive;
    input wire [1:0] ALU_Op_receive;
    input wire Mem_to_Reg_receive;
    input wire Mem_Read_receive;
    input wire Branch_receive;

    
    //Updated Control Unit signals
    output reg regWrite;
    reg [1:0] ALU_Op = 2'b0;
    output reg Mem_Write = 0;
    output reg Mem_to_Reg = 0;
    output reg Mem_Read = 0;
    output reg Branch = 0;


    //ALU 1 inputs
    input [63:0] pc_receive;    
    input [63:0] extended_receive;
    //Updated ALU 1 inputs
    reg [63:0] pc;
    reg[63:0] extended;
    //Output of ALU 1
    output [63:0] pcbranch;


    //ALU 2 inputs
    input [63:0] read_data_1_receive, read_data_2_receive;
    input [3:0] Func_receive;

    // Updated ALU 2 inputs
    reg [63:0] read_data_1;
    output reg[63:0] read_data_2;
    reg [63:0] read_data_2_in_ALU2;
    reg [3:0] Func;
    wire [3:0] Operation;

    //ALU2 outputs
    output [63:0] Result;
    output Zero;

    ALU_64bit ALU1(.A (pc), .B (extended << 2), .Operation (4'b0010), .Result(pcbranch), .Overflow(), .Zero() );

    ALU_64bit ALU2(.A (read_data_1), .B (read_data_2_in_ALU2), .Operation (Operation), .Result(Result), .Overflow(), .Zero (Zero) );


    ALU_CU control(.ALUOp(ALU_Op), .Func(Func), .Operation(Operation));

    always @(posedge clk) 
    begin
      
        case(ALU_Src)
            1'b0: read_data_2_in_ALU2 = read_data_2_receive;
            1'b1: read_data_2_in_ALU2 = extended_receive;
        endcase
      
        regWrite =  regWrite_receive;
        Mem_Write = Mem_Write_receive;
        ALU_Op = ALU_Op_receive;
        Mem_to_Reg = Mem_to_Reg_receive;
        Mem_Read = Mem_Read_receive;
        Branch = Branch_receive;

        pc = pc_receive;
        extended = extended_receive;

        read_data_1 = read_data_1_receive;
        read_data_2 = read_data_2_receive;
        //$display("\nread data 1 received= %b, read data 2 received= %b", read_data_1_receive, read_data_2_receive);
        Func = Func_receive;
        
    end 


endmodule
