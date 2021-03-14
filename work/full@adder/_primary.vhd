library verilog;
use verilog.vl_types.all;
entity fullAdder is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        Cin             : in     vl_logic;
        sum             : out    vl_logic;
        Cout            : out    vl_logic
    );
end fullAdder;
