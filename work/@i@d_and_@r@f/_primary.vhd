library verilog;
use verilog.vl_types.all;
entity ID_and_RF is
    port(
        clk             : in     vl_logic;
        reset_receive   : in     vl_logic;
        pc_recieve      : in     vl_logic_vector(63 downto 0);
        instruction_recieve: in     vl_logic_vector(31 downto 0);
        writeData_recieve: in     vl_logic_vector(63 downto 0);
        pc              : out    vl_logic_vector(63 downto 0);
        extended        : out    vl_logic_vector(63 downto 0);
        Func            : out    vl_logic_vector(3 downto 0);
        ALU_Src         : out    vl_logic;
        Mem_Write       : out    vl_logic;
        ALU_Op          : out    vl_logic_vector(1 downto 0);
        Mem_to_Reg      : out    vl_logic;
        Mem_Read        : out    vl_logic;
        Branch          : out    vl_logic;
        read_data_1     : out    vl_logic_vector(63 downto 0);
        read_data_2     : out    vl_logic_vector(63 downto 0)
    );
end ID_and_RF;
