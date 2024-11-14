library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
    entity gray2bcd_artyshevskyi is 
        Port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            bcd : out std_logic_vector (2 downto 0)
        );
    end gray2bcd_artyshevskyi;
    
    architecture Behavioral of gray2bcd_artyshevskyi is

        begin
            belt : process (a, b, c)
                variable gray : std_logic_vector (2 downto 0);
            begin
                gray := a&b&c;
                if gray="000" then
                    bcd<="000";
                elsif gray="001" then
                    bcd<="001";
                elsif gray="011" then
                    bcd<="010";   
                elsif gray="010" then
                    bcd<="011";
                elsif gray="110" then
                    bcd<="100";
                elsif gray="111" then
                    bcd<="101";
                elsif gray="101" then
                    bcd<="110";
                elsif gray="100" then
                    bcd<="111";                                                                     
                end if;
            end process belt;
end Behavioral;