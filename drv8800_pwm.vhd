library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity drv8800_pwm is 
port(  clk:  in std_logic;
  mot_value:  in std_logic_vector(15 downto 0);
  mot_nfault:  in std_logic;
  mot_mode:  out std_logic;
  mot_phase:  out std_logic;
  mot_enable:  out std_logic
);
end drv8800_pwm;

architecture behav of drv8800_pwm is         
  signal pre_count: std_logic_vector(7 downto 0);
  begin
    process(clk)
    begin
      if (clk='1' and clk'event) then
          pre_count <= pre_count + "1";
      end if;
		 if(pre_count<=mot_value(7 downto 0)) then
			mot_enable<='1';
		 else
			mot_enable<='0';
		 end if;
    end process;
		mot_phase<=mot_value(8);
		mot_mode<=mot_value(9);
end behav;
