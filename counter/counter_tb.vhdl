library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_artyshevskyi_tb is
end counter_artyshevskyi_tb;

architecture Behavior of counter_artyshevskyi_tb is
    component counter_artyshevskyi
    port (
        clk : in std_logic;
        rst : in std_logic;
        output : out std_logic_vector(2 downto 0)
    );
    end component;

    constant clk_period : time := 50 ns;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';

    signal output : std_logic_vector(2 downto 0) := "000";
begin

    clk <= not clk after clk_period / 2;

    uut : counter_artyshevskyi
    port map (
        clk => clk,
        rst => rst,
        output => output
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 20;
        
        wait;
    end process;

end architecture;