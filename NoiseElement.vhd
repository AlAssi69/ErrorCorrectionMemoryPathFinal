library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NoiseElement is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           num : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC);
end NoiseElement;

architecture Behavioral of NoiseElement is
begin
    process(clk, en)
    begin
        --without any noise
        if en = '0' then
            y <= x;
        elsif en = '1' then
            if rising_edge(clk) then
                --just flip the bit corresponding to 'num' position
                y(conv_integer(num)) <= not x(conv_integer(num));
            end if;
        end if;
    end process;
end Behavioral;