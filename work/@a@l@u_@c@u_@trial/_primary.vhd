library verilog;
use verilog.vl_types.all;
entity ALU_CU_Trial is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        Func            : in     vl_logic_vector(3 downto 0);
        Operation       : out    vl_logic_vector(3 downto 0)
    );
end ALU_CU_Trial;
