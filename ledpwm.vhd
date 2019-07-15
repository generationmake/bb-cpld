library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ledpwm is 
port(  clk:  in std_logic;
  pwm_value:  in std_logic_vector(3 downto 0);
  pwm_out:  out std_logic
);
end ledpwm;

architecture behav of ledpwm is         
  signal pre_count: std_logic_vector(3 downto 0);
  begin
    process(clk)
    begin
      if (clk='1' and clk'event) then
          pre_count <= pre_count + "1";
      end if;
		 if(pre_count<pwm_value(3 downto 0)) then
			pwm_out<='1';
		 else
			pwm_out<='0';
		 end if;
    end process;
end behav;
