library verilog;
use verilog.vl_types.all;
entity Instruction_Fetch is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc_branch       : in     vl_logic_vector(63 downto 0);
        \select\        : in     vl_logic;
        instruction     : out    vl_logic_vector(31 downto 0);
        pc_current      : out    vl_logic_vector(63 downto 0)
    );
end Instruction_Fetch;
