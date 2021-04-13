`include "ALU_64bit.v"
`include "ALU_CU.v"

module exec(clk,  
            ALU_Src, Mem_Write_recieve, ALU_Op_recieve, Mem_to_Reg_recieve, Mem_Read_recieve, Branch_recieve,
              Mem_to_Reg, Mem_Write, Mem_Read, Branch,
              pc_recieve, extended_recieve, pcbranch,
              read_data_1_recieve, read_data_2_recieve, read_data_2, 
              Func_recieve,
              Result, Zero );
                 

    input wire clk;
    
    //Control Unit signals
    input wire ALU_Src;
    input wire Mem_Write_recieve;
    input wire [1:0] ALU_Op_recieve;
    input wire Mem_to_Reg_recieve;
    input wire Mem_Read_recieve;
    input wire Branch_recieve;

    
    //Updated Control Unit signals
    reg [1:0] ALU_Op = 2'b0;
    output reg Mem_Write = 0;
    output reg Mem_to_Reg = 0;
    output reg Mem_Read = 0;
    output reg Branch = 0;

    //ALU 1 inputs
    input [63:0] pc_recieve;    
    input [63:0] extended_recieve;
    //Updated ALU 1 inputs
    reg [63:0] pc;
    reg[63:0] extended;
    //Output of ALU 1
    output [63:0] pcbranch;


    //ALU 2 inputs
    input [63:0] read_data_1_recieve, read_data_2_recieve;
    input [3:0] Func_recieve;

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
            1'b0: read_data_2_in_ALU2 = read_data_2_recieve;
            1'b1: read_data_2_in_ALU2 = extended_recieve;
        endcase
      
        Mem_Write = Mem_Write_recieve;
        ALU_Op = ALU_Op_recieve;
        Mem_to_Reg = Mem_to_Reg_recieve;
        Mem_Read = Mem_Read_recieve;
        Branch = Branch_recieve;

        pc = pc_recieve;
        extended = extended_recieve;

        read_data_1 = read_data_1_recieve;
        read_data_2 = read_data_2_recieve;
        $display("\nread data 1 received= %b, read data 2 received= %b", read_data_1_recieve, read_data_2_recieve);
        Func = Func_recieve;
        
    end 


endmodule
