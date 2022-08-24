library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_tb is
end ram_tb;

architecture sim of ram_tb is

    constant clk_hz : integer := 100e6;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal we : std_logic := '1';
    signal data_in : std_logic_vector(7 downto 0) := X"AA";
    signal data_out : std_logic_vector(7 downto 0);
    signal address : std_logic_vector(3 downto 0) := "0000";


begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.ram(rtl)
    generic map(
        DATA_WIDTH=>8,
        RAM_WIDTH=>4  --then address has 2 bits
    )
    port map (
        clk => clk,
        we => we,
        data_in =>data_in,
        address =>address,
        data_out=>data_out
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;
        --here must be a reset

        wait for clk_period * 10;
        report "INICIO DE LA SIMULACION";
        address <= "0000";
        data_in <= x"00";
        we      <= '1';

        wait for clk_period * 10;
        address <= "0001";
        data_in <= x"FF";
        we      <= '1';

        wait for clk_period * 10;
        address <= "0011";
        data_in <= x"FF";
        we      <= '0';

        wait for clk_period * 10;
        address <= "0010";
        data_in <= x"1A";
        we      <= '1';

    end process;

end architecture;