library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Error-Correction Memory Path
entity ECMP is
    Port ( clk : in  STD_LOGIC;
           wr_en1 : in  STD_LOGIC;
           re_en1 : in  STD_LOGIC;
           wr_add1 : in  STD_LOGIC_VECTOR (3 downto 0);
           re_add1 : in  STD_LOGIC_VECTOR (3 downto 0);
           reset1 : in  STD_LOGIC;
           wr_en2 : in  STD_LOGIC;
           re_en2 : in  STD_LOGIC;
           wr_add2 : in  STD_LOGIC_VECTOR (3 downto 0);
           re_add2 : in  STD_LOGIC_VECTOR (3 downto 0);
           reset2 : in  STD_LOGIC;
           reg1_out : out  STD_LOGIC_VECTOR (15 downto 0);
           reg1_load : in  STD_LOGIC;
           reg1_clear : in  STD_LOGIC;
           reg2_out : out  STD_LOGIC_VECTOR (15 downto 0);
           reg2_load : in  STD_LOGIC;
           reg2_clear : in  STD_LOGIC;
           noise_num1 : in  STD_LOGIC_VECTOR (3 downto 0);
           noise_en1 : in  STD_LOGIC;
           noise_num2 : in  STD_LOGIC_VECTOR (3 downto 0);
           noise_en2 : in  STD_LOGIC;
           buff_noise1_en : in  STD_LOGIC;
           buff_noise2_en : in  STD_LOGIC;
           buff_reg1_en : in  STD_LOGIC;
           buff_reg2_en : in  STD_LOGIC;
           buff_decoder1_en : in  STD_LOGIC;
           buff_decoder2_en : in  STD_LOGIC;
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           outter_in : in  STD_LOGIC_VECTOR (10 downto 0));
end ECMP;

architecture Behavioral of ECMP is

component Buffer16 is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           en : in  STD_LOGIC);
end component;

component DPRAM is
    Port ( clk : in  STD_LOGIC;
           wr_en : in  STD_LOGIC;
           re_en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           wr_add : in  STD_LOGIC_VECTOR (3 downto 0);
           re_add : in  STD_LOGIC_VECTOR (3 downto 0);
           wr_data : in  STD_LOGIC_VECTOR (10 downto 0);
           re_data : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

component HammingDecoder is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (10 downto 0);
           clk : in  STD_LOGIC);
end component;

component HammingEncoder is
    Port ( x : in  STD_LOGIC_VECTOR (10 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
end component;

component NoiseElement is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           num : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC);
end component;

component Register16 is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           load : in  STD_LOGIC;
           clear : in  STD_LOGIC);
end component;

signal wr_data1: std_logic_vector(10 downto 0);
signal re_data1: std_logic_vector(10 downto 0);

signal wr_data2: std_logic_vector(10 downto 0);
signal re_data2: std_logic_vector(10 downto 0);

signal enc1_out_noise1_in: std_logic_vector(15 downto 0);
signal enc2_out_noise2_in: std_logic_vector(15 downto 0);

signal noise1_out_buff_in: std_logic_vector(15 downto 0);
signal noise2_out_buff_in: std_logic_vector(15 downto 0);

signal reg1_in_buff_out: std_logic_vector(15 downto 0);
signal reg2_in_buff_out: std_logic_vector(15 downto 0);

signal dec1_in_buff_out: std_logic_vector(15 downto 0);
signal dec2_in_buff_out: std_logic_vector(15 downto 0);

begin
    Dual_Port_RAM1: DPRAM port map( clk => clk,
                                    wr_en => wr_en1,
                                    re_en => re_en1,
                                    reset => reset1,
                                    wr_add => wr_add1,
                                    re_add => re_add1,
                                    wr_data => wr_data1,
                                    re_data => re_data1);
    
    Dual_Port_RAM2: DPRAM port map( clk => clk,
                                    wr_en => wr_en2,
                                    re_en => re_en2,
                                    reset => reset2,
                                    wr_add => wr_add2,
                                    re_add => re_add2,
                                    wr_data => wr_data2,
                                    re_data => re_data2);
    
    
    Noise1: NoiseElement port map(  clk => clk,
                                    x => enc1_out_noise1_in,
                                    y => noise1_out_buff_in,
                                    num => noise_num1,
                                    en => noise_en1);
    
    Noise2: NoiseElement port map(  clk => clk,
                                    x => enc2_out_noise2_in,
                                    y => noise2_out_buff_in,
                                    num => noise_num2,
                                    en => noise_en2);
    

    reg1: Register16 port map(  clk => clk,
                                x => reg1_in_buff_out,
                                y => reg1_out,
                                load => reg1_load,
                                clear => reg1_clear);
    
    reg2: Register16 port map(  clk => clk,
                                x => reg2_in_buff_out,
                                y => reg2_out,
                                load => reg2_load,
                                clear => reg2_clear);
    
    
    buff_noise1: Buffer16 port map( x => noise1_out_buff_in,
                                    y => data_bus,
                                    en => buff_noise1_en);
    
    buff_noise2: Buffer16 port map( x => noise2_out_buff_in,
                                    y => data_bus,
                                    en => buff_noise2_en);
    
    buff_reg1: Buffer16 port map(   x => data_bus,
                                    y => reg1_in_buff_out,
                                    en => buff_reg1_en);
    
    buff_reg2: Buffer16 port map(   x => data_bus,
                                    y => reg2_in_buff_out,
                                    en => buff_reg2_en);
    
    buff_bus1: Buffer16 port map(   x => data_bus,
                                    y => dec1_in_buff_out,
                                    en => buff_decoder1_en);
    
    buff_bus2: Buffer16 port map(   x => data_bus,
                                    y => dec2_in_buff_out,
                                    en => buff_decoder2_en);
    

    encoder1: HammingEncoder port map(  clk => clk,
                                        x => re_data1,
                                        y => enc1_out_noise1_in);
    
    encoder2: HammingEncoder port map(  clk => clk,
                                        x => re_data2,
                                        y => enc2_out_noise2_in);
    
    encoder3: HammingEncoder port map(  clk => clk,
                                        x => outter_in,
                                        y => data_bus);
    
    
    decoder1: HammingDecoder port map(  clk => clk,
                                        x => dec1_in_buff_out,
                                        y => wr_data1);
    
    decoder2: HammingDecoder port map(  clk => clk,
                                        x => dec2_in_buff_out,
                                        y => wr_data2);
end Behavioral;