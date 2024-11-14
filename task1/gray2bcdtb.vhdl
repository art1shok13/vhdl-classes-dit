library ieee;
use ieee.std_logic_1164.ALL;

entity gray2bcdtb is
end gray2bcdtb;

architecture behavior of gray2bcdtb is
    component gray2bcd_artyshevskyi
        Port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            bcd : out std_logic_vector (2 downto 0)
        );
    end component;

    signal a : std_logic :='0';
    signal b : std_logic :='0';
    signal c : std_logic :='0';

    signal bcd : std_logic_vector (2 downto 0);

    begin
        uut: gray2bcd_artyshevskyi PORT MAP (
            a=>a,
            b=>b,
            c=>c,
            bcd => bcd
        );

        stim_process: process
        begin
            -- wait for 100 ns;
            
            a<='0';
            b<='0';
            c<='0';
            wait for 10 ns;

            a<='0';
            b<='0';
            c<='1';
            wait for 10 ns;

            a<='0';
            b<='1';
            c<='1';
            wait for 10 ns;

            a<='0';
            b<='1';
            c<='0';
            wait for 10 ns;

            a<='1';
            b<='1';
            c<='0';
            wait for 10 ns;

            a<='1';
            b<='1';
            c<='1';
            wait for 10 ns;

            a<='1';
            b<='0';
            c<='1';
            wait for 10 ns;

            a<='1';
            b<='0';
            c<='0';
            wait for 10 ns;
            wait;
        end process;
    end;