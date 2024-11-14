library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
    entity belt_artyshevskyi is 
        Port (
            s1 : in std_logic;--\
            s2 : in std_logic;-- \
            s3 : in std_logic;-- / sensors
            s4 : in std_logic;--/
            sw : in std_logic;-- stop/start switch
            r : out std_logic;-- rotate anti clock wise
            t: out std_logic -- turn over
        );
    end belt_artyshevskyi;
    
    architecture Behavioral of belt_artyshevskyi is

        begin
            belt : process (sw, s1, s2, s3, s4)
                variable sensors : std_logic_vector (4 downto 0);
            begin
                sensors := sw&s1&s2&s3&s4;
                if (sensors="01000") then
                    r<='1';
                    t<='1';
                elsif (sensors="00100") then
                    r<='1';
                    t<='0';
                elsif (sensors="00010") then
                    r<='0';
                    t<='0';  
                elsif (sensors="00001") then
                    r<='0';
                    t<='1';
                else
                    r<='Z';
                    t<='Z';
                end if;
            end process belt;
end Behavioral;