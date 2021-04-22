library verilog;
use verilog.vl_types.all;
entity Data_Memory is
    port(
        clk             : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        Address         : in     vl_logic_vector(63 downto 0);
        WriteData       : in     vl_logic_vector(63 downto 0);
        ReadData        : out    vl_logic_vector(63 downto 0)
    );
end Data_Memory;
