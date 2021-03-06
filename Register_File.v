
module regfile(clk, reset, regWrite, readReg1, readReg2, writeReg, writeData, readData1, readData2);
   input clk, regWrite, reset;
   input [4:0] readReg1, readReg2, writeReg;
   input [63:0] writeData;
   output reg [63:0] readData1, readData2;
   reg [63:0] regFile[0:31];
   
   //Initializing the registers
   integer i;
   initial
   begin     
     for(i=0; i<32; i= i+1)
     begin
        regFile[i] = i;     
     end     
   end

   always @(posedge clk)
   begin
        if(regWrite == 1) 
        begin
          regFile[writeReg] = writeData;
        end
   end
        
   //Read data
   always @(negedge clk) 
   begin
        if(reset == 0) 
        begin
           $display("\nEntered at neg edge");
           readData1 = regFile[readReg1];
           readData2 = regFile[readReg2];
        end
   end
   
   
   /*
   always @(readReg1) readData1 <= (readReg1 != 0) ? regFile[readReg1] : 0;
   always @(readReg2) readData2 <= (readReg2 != 0) ? regFile[readReg2] : 0;
   */
   
endmodule