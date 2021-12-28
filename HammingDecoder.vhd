library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HammingDecoder is
    Port ( x : in  STD_LOGIC_VECTOR (0 to 15);
           y : out  STD_LOGIC_VECTOR (0 to 10);
           clk : in  STD_LOGIC);
end HammingDecoder;

architecture Behavioral of HammingDecoder is

signal check_bits : std_logic_vector(0 to 3);
signal temp : std_logic_vector(0 to 15) := (0 => '0', others => '0');

begin
    decoding: process(clk)
    begin
        if rising_edge(clk) then
            --calculate the check bits
            check_bits(0) <= x(1) xor x(3) xor x(5) xor x(7) xor x(9) xor x(11) xor x(13) xor x(15);
            check_bits(1) <= x(2) xor x(3) xor x(6) xor x(7) xor x(10) xor x(11) xor x(14) xor x(15);
            check_bits(2) <= x(4) xor x(5) xor x(6) xor x(7) xor x(12) xor x(13) xor x(14) xor x(15);
            check_bits(3) <= x(8) xor x(9) xor x(10) xor x(11) xor x(12) xor x(13) xor x(14) xor x(15);
            
            --assigning the input to temp arr
            temp(0) <= x(0);
            temp(1) <= x(1);
            temp(2) <= x(2);
            temp(3) <= x(3);
            temp(4) <= x(4);
            temp(5) <= x(5);
            temp(6) <= x(6);
            temp(7) <= x(7);
            temp(8) <= x(8);
            temp(9) <= x(9);
            temp(10) <= x(10);
            temp(11) <= x(11);
            temp(12) <= x(12);
            temp(13) <= x(13);
            temp(14) <= x(14);
            temp(15) <= x(15);

            --flipping the bit in the corresponding postion using check_bits
            if check_bits /= "0000" then
                temp(conv_integer(check_bits)) <= not x(conv_integer(check_bits));
            end if;

            --mapping the temp (input) to output with out the parity bits, after correctiong the seq.
            y(0) <= temp(3);
            y(1) <= temp(5);
            y(2) <= temp(6);
            y(3) <= temp(7);

            y(4) <= x(9);
            y(5) <= x(10);
            y(6) <= x(11);
            y(7) <= x(12);
            y(8) <= x(13);
            y(9) <= x(14);
            y(10) <= x(15);
        end if;
    end process decoding;
end Behavioral;