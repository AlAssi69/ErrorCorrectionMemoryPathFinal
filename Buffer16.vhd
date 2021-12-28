library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--normal 16-bit tri-state buffer
entity Buffer16 is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           en : in  STD_LOGIC);
end Buffer16;

architecture Behavioral of Buffer16 is
begin
    y <= x when (en = '1') else "ZZZZZZZZZZZZZZZZ";
end Behavioral;