`timescale 1ns/1ps

//2:1 mux
module mux2to1(op, ip, select);
  
  input wire [1:0] ip;
  input wire select;
  output wire op;
  
  wire [1:0] res; //Intermediate results
  
  wire inv; //Inverted select pins
  not G1(inv, select);
  
  //Computing intermediate results
  and G2(res[0], ip[0], inv);
  and G3(res[1], ip[1], select);
  
  //Final result
  or G4(op, res[0], res[1]);
  
endmodule


//4:1 mux using 2:1 mux
module mux4to1(op, ip, select);
  
  input wire [3:0] ip;
  input wire [1:0] select;
  output wire op;
  
  wire [1:0] res; //Intermediate result
  
  //Calculates intermediate results from 2 muxes
  mux2to1 M1(res[0], ip[1:0], select[0]);
  mux2to1 M2(res[1], ip[3:2], select[0]);
  
  //Calculates final results
  mux2to1 M3(op, res[1:0], select[1]);
  
endmodule


//Full adder module
module fullAdder(a, b, Cin, sum, Cout); 
  
    input wire a, b, Cin;
    output wire sum, Cout;
    
    xor G1(axorb, a, b);
    
    //Calculating sum
    xor G2(sum, Cin, axorb);
    
    //Calculating Cout
    wire w1, w2;
    and G3(w1, Cin, axorb);
    and G4(w2, a, b);
    or G5(Cout, w1, w2);    
  
endmodule
