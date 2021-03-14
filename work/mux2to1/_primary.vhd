library verilog;
use verilog.vl_types.all;
entity mux2to1 is
    port(
        op              : out    vl_logic;
        ip              : in     vl_logic_vector(1 downto 0);
        \select\        : in     vl_logic
    );
end mux2to1;
