library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        clk             : in     vl_logic;
        Mem_Read        : in     vl_logic;
        Mem_Write       : in     vl_logic;
        writeData       : in     vl_logic_vector(63 downto 0);
        ReadData        : out    vl_logic_vector(63 downto 0);
        Zero_recieve    : in     vl_logic;
        Branch_recieve  : in     vl_logic;
        PC_SRC          : out    vl_logic;
        pcbranch_receive: in     vl_logic_vector(63 downto 0);
        pcbranch        : out    vl_logic_vector(63 downto 0);
        result_recieve  : in     vl_logic_vector(63 downto 0);
        result          : out    vl_logic_vector(63 downto 0);
        Mem_to_Reg_recieve: in     vl_logic;
        Mem_to_Reg      : out    vl_logic
    );
end Memory;
