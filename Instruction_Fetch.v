`include "ALU_64bit.v"
`include "Instruction_Memory.v"

module Instruction_Fetch(clk, reset, pc_branch, select, instruction);

    input clk;                //Clock for all stages in the pipeline
    input reset;               //To reset the program counter to first instruction
    input [63:0] pc_branch;   //Address for branching
    input select;             //Decides whether pc should be updated for branch or not                              
    
    output [31:0] instruction;  //Instruction fetched from memory

    reg [63:0] pc_current = 64'b0, pc_next = 64'b0;
    wire [63:0] pc_4;

    ALU_64bit A0(.A (pc_next), .B (64'd4), .Operation (4'b0010), .Result (pc_4), .Overflow (), .Zero ());

    always @(posedge clk)
    begin
        if(reset)
        begin
            pc_current = 64'b0;
            pc_next = 64'b0;
        end
        else
        begin
            pc_current = pc_next;
            
            case(select)
            1'b0  : pc_next = pc_4;
            1'b1  : pc_next = pc_branch;
            default : pc_next = pc_4;
            endcase
        end
    end

    Instruction_Memory IM(instruction, pc_current>>2);
    
endmodule
