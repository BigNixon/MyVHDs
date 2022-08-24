--///////////////////////////////////////////////////////////////////////
-- Company: MELPRO
-- Author: Nixon Ortiz
-- Module:  Truth table
-- Description: Implements a 4 bit truth table with generic map for output vector
--///////////////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity truth_table is
    generic(
        truth_vector:   std_logic_vector(15 downto 0)
    );
    port (
        table_in:        in std_logic_vector(3 downto 0);
        table_out:      out std_logic
    );
end truth_table;

architecture beh of truth_table is

begin

    process(table_in)
        --varriable declarations
        variable aux_int:   natural;
    begin
        aux_int     :=  to_integer(unsigned(table_in)); -- "0011" -> 3
        table_out   <=  truth_vector(aux_int);
    end process;

end architecture;