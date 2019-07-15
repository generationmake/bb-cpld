library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity counter is 
port(  clk:  in std_logic;
  enable: in std_logic;
  clk8m: out std_logic;
  clk256k:  out std_logic;
  clk4k:  out std_logic;
  clk1k:  out std_logic;
  count:  out std_logic_vector(24 downto 0)
);
end counter;

architecture behav of counter is         
  signal pre_count: std_logic_vector(24 downto 0);
  signal pre_count3: std_logic_vector(12 downto 0);
  signal pre_count2: unsigned(2 downto 0);
  signal clk8mi: std_logic;
  begin
    process(enable,clk)
    begin
      if (enable='1') then
			if (clk='1' and clk'event) then
				 pre_count <= pre_count + "1";
				 pre_count2 <= pre_count2 + 1;
			end if;
			if(pre_count2=3) then
				pre_count2<="000";
			end if;
			 if(pre_count2=0) then
				clk8mi<='1';
			 else
				clk8mi<='0';
			 end if;
      end if;
    end process;  
    process(enable,clk8mi)
    begin
      if (enable='1') then
			if (clk8mi='1' and clk8mi'event) then
				 pre_count3 <= pre_count3 + "1";
			end if;
      end if;
    end process;  
    count <= pre_count;
	 clk1k <= pre_count3(11) and enable;
	 clk256k<=pre_count3(4) and enable;
	 clk4k <= pre_count3(10) and enable;
	 clk8m<=clk8mi and enable;
end behav;
