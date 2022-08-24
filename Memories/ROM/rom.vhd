--///////////////////////////////////////////////////////////////////////
-- Company: MELPRO
-- Author: Nixon Ortiz
-- Module:  ROM
-- Description: Implements a read only memory (ROM_WIDTH X DATA_WIDTH)
--
--      ______________________________________
--      |       0    |....    | DATA_WIDTH-1  |
--      | DATA_WIDTH |....    | 2*DATA_WIDTH-1|
--          .
--          .
--          .
--          .
--      |ROM_WIDTH*DATA_WIDTH | ...|  |  |  |
--///////////////////////////////////////////////////////////////////////


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
    generic(
        ROM_WIDTH,DATA_WIDTH: natural;
        stored_data: std_logic_vector
    );
    port(
        address: in std_logic_vector(ROM_WIDTH-1 downto 0);
        word: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end rom;

architecture rtl of rom is 

begin
    process(address)
        variable index: natural;
    begin
        index :=  to_integer(unsigned(address))*DATA_WIDTH;
        word <= stored_data(index to index + DATA_WIDTH -1);
    end process;
end architecture;