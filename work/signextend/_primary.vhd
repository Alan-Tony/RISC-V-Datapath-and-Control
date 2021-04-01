library verilog;
use verilog.vl_types.all;
entity signextend is
    port(
        extend          : in     vl_logic_vector(11 downto 0);
        extended        : out    vl_logic_vector(63 downto 0)
    );
end signextend;
