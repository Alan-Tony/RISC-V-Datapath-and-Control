library verilog;
use verilog.vl_types.all;
entity ALU_1b_Ordinary is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        Less            : in     vl_logic;
        Ainvert         : in     vl_logic;
        Binvert         : in     vl_logic;
        CarryIn         : in     vl_logic;
        Operation       : in     vl_logic_vector(1 downto 0);
        Result          : out    vl_logic;
        CarryOut        : out    vl_logic
    );
end ALU_1b_Ordinary;
