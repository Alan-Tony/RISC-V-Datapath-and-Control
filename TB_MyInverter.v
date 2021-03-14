`include "MyInverter.v"

module TB_MyInverter();
  reg inp;
  reg clk;
  reg op;
  
  //MyInverter inv(inp, op);
  
  initial clk = 0;
  always #10 clk = ~clk;
  
  
endmodule
    
  