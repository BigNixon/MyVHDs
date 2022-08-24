library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity square_root is
    port (
        clk :   in  std_logic;
        rst :   in  std_logic;
        start:  in  std_logic;
        num :   in  std_logic_vector(7 downto 0);

        root:   out std_logic_vector(7 downto 0);
        greater:out std_logic
    );
end square_root;

architecture rtl of square_root is
    signal r,r_next :   std_logic_vector(7 downto 0);
    signal s,s_next :   std_logic_vector(7 downto 0);

    type STATE_TYPE is (IDDLE1,IDDLE2,WHILE_LOOP);
    signal state,state_next : STATE_TYPE;
    signal greater_buff: std_logic;
begin

    greater<= greater_buff;

    registerR: process(clk,rst)
    begin
        if(rst='1')then
            r <= (others=>'0');
        elsif(rising_edge(clk))then
            r <= r_next;
        end if;
    end process;

    registerS: process(clk,rst)
    begin
        if(rst='1')then
            s <= "00000001";
        elsif(rising_edge(clk))then
            s <= s_next;
        end if;
    end process;

--   FSM SYNC PART================================
    update_process:process(clk,rst)
    begin
        if(rst='1')then
            state <= IDDLE1;
        elsif(rising_edge(clk))then
            state <= state_next;
        end if;
    end process;

--  NEXT STATE LOGIC ============================
    
    process(clk,rst)
    begin
        case(state)is
            when IDDLE1 =>
                if(start='1')then
                    state_next <= IDDLE2;
                end if;
            when IDDLE2 =>
                if(start='0')then
                    state_next <= WHILE_LOOP;
                end if;
            when WHILE_LOOP =>
                if(greater_buff='1')then
                    state_next <= IDDLE1;
                end if;
            when others =>
                state_next <= IDDLE1;
        end case;
    end process;

    r_next <= std_logic_vector(unsigned(r) + 1) when state=WHILE_LOOP else r;
    s_next <= std_logic_vector(to_unsigned(  to_integer(unsigned(s)) + 2*(to_integer(unsigned(r))+1) + 1  ,8)) when state=WHILE_LOOP else s;

    greater_buff <= '1' when s>num else '0';
    root    <= r;

end architecture;