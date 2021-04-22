library verilog;
use verilog.vl_types.all;
entity exec is
    port(
        clk             : in     vl_logic;
        regWrite_receive: in     vl_logic;
        ALU_Src         : in     vl_logic;
        Mem_Write_receive: in     vl_logic;
        ALU_Op_receive  : in     vl_logic_vector(1 downto 0);
        Mem_to_Reg_receive: in     vl_logic;
        Mem_Read_receive: in     vl_logic;
        Branch_receive  : in     vl_logic;
        regWrite        : out    vl_logic;
        Mem_to_Reg      : out    vl_logic;
        Mem_Write       : out    vl_logic;
        Mem_Read        : out    vl_logic;
        Branch          : out    vl_logic;
        pc_receive      : in     vl_logic_vector(63 downto 0);
        extended_receive: in     vl_logic_vector(63 downto 0);
        pcbranch        : out    vl_logic_vector(63 downto 0);
        read_data_1_receive: in     vl_logic_vector(63 downto 0);
        read_data_2_receive: in     vl_logic_vector(63 downto 0);
        read_data_2     : out    vl_logic_vector(63 downto 0);
        Func_receive    : in     vl_logic_vector(3 downto 0);
        Result          : out    vl_logic_vector(63 downto 0);
        Zero            : out    vl_logic
    );
end exec;
