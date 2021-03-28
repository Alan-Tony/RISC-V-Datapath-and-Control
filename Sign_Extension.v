
module signextend(clk, extend, extended);
input[11:0]extend;
input clk;
output[63:0] extended;

reg[63:0] extended;
wire[11:0] extend;

always @(posedge clk) begin
  
  assign extended={{52{extend[11]}},extend[11:0]};
end

endmodule