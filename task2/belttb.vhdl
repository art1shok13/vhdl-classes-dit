library ieee;
use ieee.std_logic_1164.ALL;

entity belttb is
end belttb;

architecture behavior of belttb is
    component belt_artyshevskyi
        Port (
            s1 : in std_logic;--\
            s2 : in std_logic;-- \
            s3 : in std_logic;-- / sensors
            s4 : in std_logic;--/
            sw : in std_logic;-- stop/start switch
            r : out std_logic;-- rotate anti clock wise
            t: out std_logic -- turn over
        );
    end component;

    signal s1 : std_logic := '0';
    signal s2 : std_logic := '0';
    signal s3 : std_logic := '0';
    signal s4 : std_logic := '0';
    signal sw : std_logic := '0';

    signal r : std_logic;
    signal t : std_logic;

    begin
        uut: belt_artyshevskyi PORT MAP (
            sw=>sw,
            s1=>s1,
            s2=>s2,
            s3=>s3,
            s4=>s4,
            r=>r,
            t=>t
        );

        stim_process: process
        begin
            wait for 100 ns;

            sw<='0';

                s1<='1';
            wait for 10 ns;
                s1<='0';
                s2<='1';
            wait for 10 ns;
                s2<='0';
                s3<='1';
            wait for 10 ns;
                s3<='0';
                s4<='1';
            wait for 10 ns;
                s4<='0';

            sw<='1';
                s1<='1';
            wait for 10 ns;
                s1<='0';
                s2<='1';
            wait for 10 ns;
                s2<='0';
                s3<='1';
            wait for 10 ns;
                s3<='0';
                s4<='1';
            wait for 10 ns;
                sw<='0';
                s4<='0';

            wait for 40 ns;
                s1<='0';
                s2<='1';
                s3<='1';
                s4<='1';
            wait for 10 ns;
                s1<='0';
                s2<='0';
                s3<='0';
                s4<='0';
            wait;

        end process;
    end;