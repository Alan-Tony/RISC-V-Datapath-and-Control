library verilog;
use verilog.vl_types.all;
entity mux4to1 is
    port(
        op              : out    vl_logic;
        ip              : in     vl_logic_vector(3 downto 0);
        \select\        : in     vl_logic_vector(1 downto 0)
    );
end mux4to1;
