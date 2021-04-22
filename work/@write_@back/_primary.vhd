library verilog;
use verilog.vl_types.all;
entity Write_Back is
    port(
        clk             : in     vl_logic;
        Result          : in     vl_logic_vector(63 downto 0);
        ReadData        : in     vl_logic_vector(63 downto 0);
        WriteData       : out    vl_logic_vector(63 downto 0);
        Mem_to_Reg      : in     vl_logic;
        regWrite_receive: in     vl_logic;
        regWrite        : out    vl_logic
    );
end Write_Back;
