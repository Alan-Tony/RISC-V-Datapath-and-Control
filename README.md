# RISC-V_64-bit_ALU
A basic ALU and ALU Control Unit Implementation using Verilog

## Members:
- Alan Tony (191CS207)
- Saurabh Mokashi ()

## File Description
1. `testbenches.v` :- This file contains testbench modules of all the core modules

2. `Utility_Modules.v` :- This file contains basic modules used in other modules:
    1. `mux2to1` :- A 2:1 mux
    2. `mux4to1` :- A 4:1 mux which uses mux2to1
    3. `fullAdder` :- A standard full adder

3. `ALU_1bit.v` :- This file contains the ordinary and MSB versions of the 1-bit ALUs. It contains the following modules:
    1. `ALU_1bit_Ordinary` :- It is the orinary version of the 1-bit ALU
    2. `ALU_1bit_MSB` :- It is the MSB version of the 1-bit ALU. It is used at the end of the ALU cascading.