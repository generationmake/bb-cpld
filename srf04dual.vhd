library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity srf04dual is 
port(  clk:  in std_logic;
  echo0:  in std_logic;
  echo1:  in std_logic;
  echo2:  in std_logic;
  echo3:  in std_logic;
  trig0:  out std_logic;
  trig1:  out std_logic;
  trig2:  out std_logic;
  trig3:  out std_logic;
  usvalue0:  out std_logic_vector(7 downto 0);
  usvalue1:  out std_logic_vector(7 downto 0);
  usvalue2:  out std_logic_vector(7 downto 0);
  usvalue3:  out std_logic_vector(7 downto 0)
);
end srf04dual;

architecture behav of srf04dual is         
  signal pre_count: std_logic_vector(8 downto 0);
  signal usvalue0int: std_logic_vector(7 downto 0);
  signal usvalue1int: std_logic_vector(7 downto 0);
  signal usvalue2int: std_logic_vector(7 downto 0);
  signal usvalue3int: std_logic_vector(7 downto 0);
  begin
    process(clk)
    begin
      if (clk='1' and clk'event) then
          pre_count <= pre_count + "1";
			 if( echo0='1') then
				usvalue0int <= usvalue0int + "1";
			 end if;
			 if( echo1='1') then
				usvalue1int <= usvalue1int + "1";
			 end if;
			 if( echo2='1') then
				usvalue2int <= usvalue2int + "1";
			 end if;
			 if( echo3='1') then
				usvalue3int <= usvalue3int + "1";
			 end if;
      end if;
		 if(pre_count="000000001") then
			usvalue1<=usvalue1int;
			usvalue3<=usvalue3int;
			trig0<='1';
			trig2<='1';
			usvalue0int<="00000000";
			usvalue2int<="00000000";
		 else
			trig0<='0';
			trig2<='0';
		 end if;
		 if(pre_count="100000001") then
			usvalue0<=usvalue0int;
			usvalue2<=usvalue2int;
			trig1<='1';
			trig3<='1';
			usvalue1int<="00000000";
			usvalue3int<="00000000";
		 else
			trig1<='0';
			trig3<='0';
		 end if;
    end process;  
end behav;
