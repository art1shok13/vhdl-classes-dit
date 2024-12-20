library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity police_artyshevskyi is
    port (
        clk : in std_logic;
        rst : in std_logic;
        a : in std_logic;
        b : in std_logic;
        output : out std_logic_vector(1 downto 0)
    );
end police_artyshevskyi;

architecture rtl of police_artyshevskyi is
type state is (nn, s, sl);
signal current_s, next_s : state;

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            current_s<=nn;
            output <= "00";
        
        elsif (rising_edge(clk)) then
            current_s <= next_s;
            if (b = '1') then
                if (a = not '1') then
                    current_s<=nn;
                    output <= "00";
                end if;
            end if;
        
        
            case current_s is
                when nn =>
                    if (a='1') then
                        next_s<=s;
                        output <= "10";
                    else
                        next_s<=nn;
                    end if;
                when s =>
                    if (a='1') then
                        next_s<=sl;
                        output <= "11";
                    else
                        next_s<=s;
                    end if;
                when sl =>
                    if (a='1') then
                        next_s<=s;
                        output <= "10";
                    else
                        next_s<=sl;
                    end if;
            end case;
        end if;
    end process;
end architecture;