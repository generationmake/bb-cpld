library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity status is 
port(  di:  in std_logic_vector(7 downto 0);
  mot_nsleep:  in std_logic;
  do:  out std_logic_vector(7 downto 0);
  enable:  out std_logic;
  mot_nsleep_s:  out std_logic;
  en_vio:  out std_logic;
  light0:  out std_logic
);
end status;

architecture behav of status is 
begin        
	do(0)<=mot_nsleep;
	enable <= di(0);
	mot_nsleep_s <= di(1);
	en_vio <= di(2);
	light0 <= di(3);
end behav;
