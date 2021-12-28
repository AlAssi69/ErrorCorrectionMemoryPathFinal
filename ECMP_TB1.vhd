library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ECMP_TB1 IS
END ECMP_TB1;
 
ARCHITECTURE behavior OF ECMP_TB1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ECMP
    PORT(
         clk : IN  std_logic;
         wr_en1 : IN  std_logic;
         re_en1 : IN  std_logic;
         wr_add1 : IN  std_logic_vector(3 downto 0);
         re_add1 : IN  std_logic_vector(3 downto 0);
         reset1 : IN  std_logic;
         wr_en2 : IN  std_logic;
         re_en2 : IN  std_logic;
         wr_add2 : IN  std_logic_vector(3 downto 0);
         re_add2 : IN  std_logic_vector(3 downto 0);
         reset2 : IN  std_logic;
         reg1_out : OUT  std_logic_vector(15 downto 0);
         reg1_load : IN  std_logic;
         reg1_clear : IN  std_logic;
         reg2_out : OUT  std_logic_vector(15 downto 0);
         reg2_load : IN  std_logic;
         reg2_clear : IN  std_logic;
         noise_num1 : IN  std_logic_vector(3 downto 0);
         noise_en1 : IN  std_logic;
         noise_num2 : IN  std_logic_vector(3 downto 0);
         noise_en2 : IN  std_logic;
         buff_noise1_en : IN  std_logic;
         buff_noise2_en : IN  std_logic;
         buff_reg1_en : IN  std_logic;
         buff_reg2_en : IN  std_logic;
         buff_decoder1_en : IN  std_logic;
         buff_decoder2_en : IN  std_logic;
         data_bus : INOUT  std_logic_vector(15 downto 0);
         outter_in : IN  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal wr_en1 : std_logic := '0';
   signal re_en1 : std_logic := '0';
   signal wr_add1 : std_logic_vector(3 downto 0) := (others => '0');
   signal re_add1 : std_logic_vector(3 downto 0) := (others => '0');
   signal reset1 : std_logic := '0';
   signal wr_en2 : std_logic := '0';
   signal re_en2 : std_logic := '0';
   signal wr_add2 : std_logic_vector(3 downto 0) := (others => '0');
   signal re_add2 : std_logic_vector(3 downto 0) := (others => '0');
   signal reset2 : std_logic := '0';
   signal reg1_load : std_logic := '0';
   signal reg1_clear : std_logic := '0';
   signal reg2_load : std_logic := '0';
   signal reg2_clear : std_logic := '0';
   signal noise_num1 : std_logic_vector(3 downto 0) := (others => '0');
   signal noise_en1 : std_logic := '0';
   signal noise_num2 : std_logic_vector(3 downto 0) := (others => '0');
   signal noise_en2 : std_logic := '0';
   signal buff_noise1_en : std_logic := '0';
   signal buff_noise2_en : std_logic := '0';
   signal buff_reg1_en : std_logic := '0';
   signal buff_reg2_en : std_logic := '0';
   signal buff_decoder1_en : std_logic := '0';
   signal buff_decoder2_en : std_logic := '0';
   signal outter_in : std_logic_vector(10 downto 0) := (others => '0');

	--BiDirs
   signal data_bus : std_logic_vector(15 downto 0);

 	--Outputs
   signal reg1_out : std_logic_vector(15 downto 0);
   signal reg2_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ECMP PORT MAP (
          clk => clk,
          wr_en1 => wr_en1,
          re_en1 => re_en1,
          wr_add1 => wr_add1,
          re_add1 => re_add1,
          reset1 => reset1,
          wr_en2 => wr_en2,
          re_en2 => re_en2,
          wr_add2 => wr_add2,
          re_add2 => re_add2,
          reset2 => reset2,
          reg1_out => reg1_out,
          reg1_load => reg1_load,
          reg1_clear => reg1_clear,
          reg2_out => reg2_out,
          reg2_load => reg2_load,
          reg2_clear => reg2_clear,
          noise_num1 => noise_num1,
          noise_en1 => noise_en1,
          noise_num2 => noise_num2,
          noise_en2 => noise_en2,
          buff_noise1_en => buff_noise1_en,
          buff_noise2_en => buff_noise2_en,
          buff_reg1_en => buff_reg1_en,
          buff_reg2_en => buff_reg2_en,
          buff_decoder1_en => buff_decoder1_en,
          buff_decoder2_en => buff_decoder2_en,
          data_bus => data_bus,
          outter_in => outter_in
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      --sim
		--100 - 300
      outter_in <= "00110001110"; --0010101110001110
      reg1_load <= '1';
      buff_reg1_en <= '1';
      wait for clk_period * 2;
		
		--300 - 500
      reg1_load <= '0';
      buff_reg1_en <= '0';
      wait for clk_period * 2;
      
		--500 - 700
      wr_en1 <= '1';
      wr_add1 <= "0001";
      buff_decoder1_en <= '1';
      wait for clk_period * 2;
		
		--700 - 900
      outter_in <= "ZZZZZZZZZZZ";
		--data_bus <= "ZZZZZZZZZZZZZZZZ";
		wait for clk_period * 2;
		
		--900 - 1000
      wr_en1 <= '0';
      re_en1 <= '1';
      re_add1 <= "0001";
      buff_decoder1_en <= '0';
      buff_noise1_en <= '1';
      reg2_load <= '1';
      buff_reg2_en <= '1'; 
      wait;
   end process;
END;