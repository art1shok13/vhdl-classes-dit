library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_artyshevskyi is
    port (
        clk : in std_logic;
        rst : in std_logic;
        output : out std_logic_vector(2 downto 0)
    );
end counter_artyshevskyi;

architecture Behavioral of counter_artyshevskyi is

signal y : std_logic_vector (2 downto 0);

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            y <= "000";
        elsif (rising_edge(clk)) then
            y <= std_logic_vector(to_unsigned(to_integer(unsigned( y )) + 1, 3));
            if (y = "110") then 
                y<="000";
            end if;
        end if;
    end process;

    output <= y;

        
end architecture;