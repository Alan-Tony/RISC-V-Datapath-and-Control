library verilog;
use verilog.vl_types.all;
entity exec is
    port(
        clk             : in     vl_logic;
        ALU_Src_recieve : in     vl_logic;
        Mem_Write_recieve: in     vl_logic;
        ALU_Op_recieve  : in     vl_logic_vector(1 downto 0);
        Mem_to_Reg_recieve: in     vl_logic;
        Mem_Read_recieve: in     vl_logic;
        Branch_recieve  : in     vl_logic;
        Mem_to_Reg      : out    vl_logic;
        Mem_Write       : out    vl_logic;
        Mem_Read        : out    vl_logic;
        Branch          : out    vl_logic;
        pc_recieve      : in     vl_logic;
        extended_recieve: in     vl_logic;
        read_data_1_recieve: in     vl_logic;
        read_data_2_recieve: in     vl_logic;
        read_data_2     : out    vl_logic_vector(63 downto 0);
        Func_recieve    : in     vl_logic_vector(3 downto 0);
        pcbranch        : out    vl_logic;
        Result          : out    vl_logic_vector(63 downto 0);
        Zero            : out    vl_logic
    );
end exec;
