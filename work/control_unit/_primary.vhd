library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        opcode          : in     vl_logic_vector(6 downto 0);
        ALUSrc          : out    vl_logic;
        MemtoReg        : out    vl_logic;
        Reg_write       : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        branch          : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0)
    );
end control_unit;
