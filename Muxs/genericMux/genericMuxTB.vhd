library ieee;
use ieee.std_logic_1164.all;
use work.muxPackage.all;

entity genericMuxTB is
end genericMuxTB;

architecture sim of genericMuxTB is

    signal sdataI: mux_array(0 to 4-1)(8-1 downto 0):=("00000000","00001111","11110000","11111111");
    signal ssel: integer:=0;
    signal sdataO: std_logic_vector(8-1 downto 0);

begin

    --===== MUX 4 TO 1 | 8 bits DATA
    DUT: entity work.genericMux(rtl)
    generic map(
        DATAWITH =>8,
        MUXWIDTH =>4
    )
    port map(
        dataI => sdataI,
        sel   => ssel,
        dataO => sdataO
    );


    --testbench process
    process is
    begin
        report "================initializing the loop of test================";
        wait for 10 ns;
        ssel <= 0;
        wait for 10 ns;
        ssel <= 1;
        wait for 10 ns;
        ssel <= 2;
        wait for 10 ns;
        ssel <= 3;
        wait for 10 ns;
        ssel <= 0;
        wait for 10 ns;
        sdataI(0)<="10101010";
        ssel <= 0;
        wait for 10 ns;
        ssel <= 1;
        wait for 10 ns;
        ssel <= 2;
        wait for 10 ns;
        ssel <= 3;
        report "end of the loop";
    end process;
end architecture;