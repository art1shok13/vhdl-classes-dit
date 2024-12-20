library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity police_artyshevskyi_tb is
end police_artyshevskyi_tb;

architecture sim of police_artyshevskyi_tb is
    component police_artyshevskyi
        port (
            clk : in std_logic;
            rst : in std_logic;
            a : in std_logic;
            b : in std_logic;
            output : out std_logic_vector(1 downto 0)
        );
    end component;

    constant clk_period : time := 50 ns;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal output : std_logic_vector(1 downto 0) := "00";
begin
    clk <= not clk after clk_period / 2;

    uut : police_artyshevskyi
    port map (
        clk => clk,
        rst => rst,
        a => a,
        b => b,
        output => output        
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10;
        wait for 40 ns;

        a<='1';
        wait for 40 ns;
        a<='0';
        wait for 10 ns;

        a<='1';
        wait for 40 ns;
        a<='0';
        wait for 10 ns;

        a<='1';
        b<='1';
        wait for 40 ns;
        a<='0';
        b<='0';
        wait for 10 ns;

        a<='1';
        wait for 40 ns;
        a<='0';
        wait for 10 ns;

        wait for 20 ns;
        b<='1';

        wait;
    end process;

end architecture;