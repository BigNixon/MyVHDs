library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity truth_table_tb is
end truth_table_tb;

architecture sim of truth_table_tb is
    signal in_dut: std_logic_vector(3 downto 0);
    signal out_dut:std_logic;
begin

        DUT : entity work.truth_table(beh)
    generic map(
        truth_vector=>"1010101010101010"
    )
    port map (
        in_dut,
        out_dut
    );

    SEQUENCER_PROC : process
    begin
       
        
        in_dut <= "0000";
        wait for 10 ns;


        in_dut <= "0001";
        wait for 10 ns;


        in_dut <= "0010";
        wait for 10 ns;


        in_dut <= "0011";
        wait for 10 ns;


        in_dut <= "1111";
        wait for 10 ns;

    end process;

end architecture;