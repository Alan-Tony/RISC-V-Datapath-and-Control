library verilog;
use verilog.vl_types.all;
entity ALU_64bit is
    port(
        A               : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        Operation       : in     vl_logic_vector(3 downto 0);
        Result          : out    vl_logic_vector(63 downto 0);
        Overflow        : out    vl_logic;
        Zero            : out    vl_logic
    );
end ALU_64bit;
