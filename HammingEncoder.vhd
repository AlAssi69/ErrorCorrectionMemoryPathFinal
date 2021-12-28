library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HammingEncoder is
    Port ( x : in  STD_LOGIC_VECTOR (0 to 10);
           y : out  STD_LOGIC_VECTOR (0 to 15);
           clk : in  STD_LOGIC);
end HammingEncoder;

architecture Behavioral of HammingEncoder is
begin
   encoding: process(clk)
   begin
      if rising_edge(clk) then
         --mapping the input to the output
         y(3) <= x(0);

         y(5) <= x(1);
         y(6) <= x(2);
         y(7) <= x(3);
         
         y(9) <= x(4);
         y(10) <= x(5);
         y(11) <= x(6);
         y(12) <= x(7);
         y(13) <= x(8);
         y(14) <= x(9);
         y(15) <= x(10);
         
         --parity bit for the whole block
         y(0) <= ((x(0) xor x(1) xor x(3) xor x(4) xor x(6) xor x(8) xor x(10)) xor
                 (x(0) xor x(2) xor x(3) xor x(5) xor x(6) xor x(9) xor x(10)) xor
                 (x(1) xor x(2) xor x(3) xor x(7) xor x(8) xor x(9) xor x(10)) xor
                 (x(4) xor x(5) xor x(6) xor x(7) xor x(8) xor x(9) xor x(10))) xor
                 x(0) xor x(1) xor x(2) xor x(3) xor x(4) xor x(5) xor x(6) xor x(7) xor
                 x(8) xor x(9) xor x(10);

         --parity bits
         y(1) <= x(0) xor x(1) xor x(3) xor x(4) xor x(6) xor x(8) xor x(10);
         y(2) <= x(0) xor x(2) xor x(3) xor x(5) xor x(6) xor x(9) xor x(10);

         y(4) <= x(1) xor x(2) xor x(3) xor x(7) xor x(8) xor x(9) xor x(10);
         y(8) <= x(4) xor x(5) xor x(6) xor x(7) xor x(8) xor x(9) xor x(10);
      end if;
   end process encoding;
end Behavioral;