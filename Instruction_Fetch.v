//`timescale 1ns/1ps
`include "ALU_64bit.v"

module Instruction_Fetch(clk, reset, pc_branch, select, instruction);

    input clk;                //Clock for all stages in the pipeline
    input reset;               //To reset the program counter to first instruction
    input [63:0] pc_branch;   //Address for branching
    input select;             //Decides whether pc should be updated for branch or not                              
    
    output [31:0] instruction;  //Instruction fetched from memory

    reg [63:0] pc_current = 64'b0, pc_next = 64'b0;
    wire [63:0] pc_4;

    always @(posedge clk or posedge reset)
    begin
        if(reset)
            pc_current <= 64'b0;
        else
            pc_current <= pc_next;
            
        case(select)
          1'b0  : pc_next <= pc_4;
          1'b1  : pc_next <= pc_branch;
          default : pc_next <= pc_4;
        endcase
    end

    ALU_64bit A0(.A (pc_current), .B (64'd4), .Operation (4'b0010), .Result (pc_4), .Overflow (), .Zero ());
   
    //Selecting
    /*
    always @(pc_4 or pc_branch) 
    begin
        
    end
    */

    Instruction_Memory IM(instruction, pc_current>>2);
    
endmodule
