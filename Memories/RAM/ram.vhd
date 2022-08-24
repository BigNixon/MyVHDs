library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ram_pkg.all;

entity ram is
    generic(
        DATA_WIDTH: natural;
        RAM_WIDTH: natural
    );
    port (
        clk     :       in std_logic;
        we      :       in std_logic;         
        data_in :       in std_logic_vector(DATA_WIDTH-1 downto 0);
        address :       in std_logic_vector(RAM_WIDTH-1 downto 0);

        data_out:       out std_logic_vector(DATA_WIDTH-1 downto 0)

    );
end ram;

architecture rtl of ram is

    signal stored_data: memory(0 to RAM_WIDTH-1)(DATA_WIDTH-1 downto 0);

begin

    process(clk)
    begin
        if(rising_edge(clk))then
            if(we='1')then
                stored_data(to_integer(unsigned(address))) <= data_in;
            end if;
        end if;
    end process;
    
    data_out <= stored_data(to_integer(unsigned(address)));

end architecture;