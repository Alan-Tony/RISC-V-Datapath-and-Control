`include "Instruction_Fetch.v"
//`timescale 1ns/1ps

module IF_Testbench();
  
  reg clk = 1'b0;
  reg reset = 1'b0;
  wire [31:0] instruction;
  
  reg [64:0] branches[0:7];
  reg [63:0] branch;
  reg select;
  reg [64:0] concat;
  
  Instruction_Fetch IF(
  .clk (clk), .reset (reset), .pc_branch (branch), .select (select), .instruction (instruction)
  );

  integer i;
  
  initial
  begin
  
  select <= 0;

  $readmemb("branch_select.mem", branches);
    
  for(i=0; i<8; i=i+1)
  begin

    if(i%2)
    begin

      #1 $display("\ni= %b, Concat= %b, select= %b, instruction= %b, clk= %b", i, concat, select, instruction, clk);
    end
    else
    begin
      #1 concat = branches[i>>1];
      select = concat[64];
      branch = concat[63:0];
    end

    #1 clk  = ~clk;
  end
  
  end
  
endmodule

