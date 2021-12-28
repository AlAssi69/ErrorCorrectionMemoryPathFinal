library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Dual Port Random Access Memory
entity DPRAM is
    Port ( clk : in  STD_LOGIC;
           wr_en : in  STD_LOGIC;
           re_en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           wr_add : in  STD_LOGIC_VECTOR (3 downto 0);
           re_add : in  STD_LOGIC_VECTOR (3 downto 0);
           wr_data : in  STD_LOGIC_VECTOR (10 downto 0);
           re_data : out  STD_LOGIC_VECTOR (10 downto 0));
end DPRAM;

architecture Behavioral of DPRAM is

type arr_vec is array (0 to 15) of std_logic_vector(10 downto 0);
--the actual memory as an array of vectors
signal dpram : arr_vec := (0 => "00000000011", others => "00000000000");
signal dummy : STD_LOGIC := '0';

begin
    dpr: process(clk, reset)
    begin
        --async reset active high
        if reset = '1' then
            dpram <= (0 => "00000000000", others => "00000000000");
        elsif rising_edge(clk) then
            if wr_en = '1' and re_en = '1' then
                dummy <= not dummy;
            end if;
            if wr_en = '1' then
                dpram(conv_integer(wr_add)) <= wr_data;
            end if;
            if re_en = '1' then
                --idk why this is here but it seems a good practice for some reason
                --re_data <= "ZZZZZZZZZZZ";
                re_data <= dpram(conv_integer(re_add));
            end if;
        end if;
    end process dpr;
end Behavioral;