
module signextend(imm, extended);

input[11:0] imm;
output[63:0] extended;
  
assign extended={{52{imm[11]}},imm[11:0]};

endmodule