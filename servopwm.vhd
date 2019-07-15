library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity servopwm is 
port(  clk:  in std_logic;
  servovalue:  in std_logic_vector(7 downto 0);
  servo:  out std_logic
);
end servopwm;

architecture behav of servopwm is         
  signal pre_count: std_logic_vector(11 downto 0);
  signal servovalueint: std_logic_vector(11 downto 0);
  begin
    process(clk)
    begin
      if (clk='1' and clk'event) then
          pre_count <= pre_count + "1";
      end if;
		 if(pre_count<=servovalueint) then
--		 if(pre_count<="01000000") then
			servo<='1';
		 else
			servo<='0';
		 end if;
    end process;  
	 servovalueint(7 downto 0)<=servovalue(7 downto 0);
	 servovalueint(11 downto 8)<="0001";
end behav;
