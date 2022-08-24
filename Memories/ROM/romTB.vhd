library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity romTB is
end romTB;

architecture sim of romTB is
    signal saddress: std_logic_vector(3 downto 0):="0000";
    signal sword: std_logic_vector(3 downto 0);
begin

    DUT:entity work.rom(rtl)
    generic map(
        ROM_WIDTH=>4,
        DATA_WIDTH=>4,
        stored_data=>"0000111101011100"
    )
    port map(
        address=>saddress,
        word=>sword
    );


    SIM_PROCESS: process
    begin
        wait for 10 ns;
        saddress <= "0000";

        wait for 10 ns;
        saddress <= "0001";

        wait for 10 ns;
        saddress <= "0010";

        wait for 10 ns;
        saddress <= "0011";



    end process;

end architecture;