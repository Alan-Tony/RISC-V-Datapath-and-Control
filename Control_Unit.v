
module control_unit(opcode, ALUSrc, MemtoReg, Reg_write, mem_read, mem_write, branch, ALUOp);

  input [6:0] opcode;
  output reg ALUSrc;
  output reg MemtoReg;
  output reg Reg_write;
  output reg mem_read;
  output reg mem_write;
  output reg branch;
  output reg[1:0] ALUOp;
  //reg f0;reg f1;reg f2;
  
  always @(opcode)
  begin

      casex(opcode)
        //R-type instruction
        7'b0110011: begin
        ALUSrc=1'b0;
        MemtoReg=1'b0;
        Reg_write=1'b1;
        mem_read=1'b0;
        mem_write=1'b0;
        branch=1'b0;
        ALUOp=2'b10;
        end

        //load instruction
        7'b0000011: begin
        ALUSrc=1'b1;
        MemtoReg=1'b1;
        Reg_write=1'b1;
        mem_read=1'b1;
        mem_write=1'b0;
        branch=1'b0;
        ALUOp=2'b00;
        end
        
        //store double
        7'b0100011: begin
        ALUSrc=1'b1;
        MemtoReg=1'b0;
        Reg_write=1'b0;
        mem_read=1'b0;
        mem_write=1'b1;
        branch=1'b0;
        ALUOp=2'b00;
        end
        
        //beq instr
        7'b1100011: begin
        ALUSrc=1'b0;
        MemtoReg=1'b0;
        Reg_write=1'b0;
        mem_read=1'b0;
        mem_write=1'b0;
        branch=1'b1;
        ALUOp=2'b01;
        end

        default:begin
        $display("\nWrong input hence values will be dont cares");
        end
    endcase

  end

endmodule