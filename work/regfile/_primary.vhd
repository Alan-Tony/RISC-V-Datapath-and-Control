library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        regWrite        : in     vl_logic;
        readReg1        : in     vl_logic_vector(4 downto 0);
        readReg2        : in     vl_logic_vector(4 downto 0);
        writeReg        : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(63 downto 0);
        readData1       : out    vl_logic_vector(63 downto 0);
        readData2       : out    vl_logic_vector(63 downto 0)
    );
end regfile;
