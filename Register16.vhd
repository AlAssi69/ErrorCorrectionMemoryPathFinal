library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--normal 16-bit register
entity Register16 is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           clear : in  STD_LOGIC);
end Register16;

architecture Behavioral of Register16 is
begin
    process(clk, clear)
    begin
        --async clear
        if clear = '1' then
            y <= x"0000";
        elsif rising_edge(clk) then
            if load = '1' then
                y <= x;
            end if;
        end if;
    end process;
end Behavioral;