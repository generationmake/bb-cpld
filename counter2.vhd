library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter2 is 
port(  clk:  in std_logic;
  count:  out std_logic_vector(7 downto 0)
);
end counter2;

architecture behav of counter2 is         
  signal pre_count: std_logic_vector(7 downto 0);
  begin
    process(clk)
    begin
      if (clk='1' and clk'event) then
          pre_count <= pre_count + "1";
      end if;
    end process;  
    count <= pre_count;
end behav;
