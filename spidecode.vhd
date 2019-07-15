library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity spidecode is
port (
sck: in std_logic;
di: in std_logic;
cs: in std_logic;
sin0 : in std_logic_vector( 7 downto 0);
din0 : in std_logic_vector( 7 downto 0);
din1 : in std_logic_vector( 7 downto 0);
din2 : in std_logic_vector( 7 downto 0);
din3 : in std_logic_vector( 7 downto 0);
sout0 : out std_logic_vector( 7 downto 0);
dout0 : out std_logic_vector( 7 downto 0);
dout1 : out std_logic_vector( 7 downto 0);
dout2 : out std_logic_vector( 7 downto 0);
dout3 : out std_logic_vector( 7 downto 0);
dout4 : out std_logic_vector( 7 downto 0);
dout5 : out std_logic_vector( 7 downto 0);
dout6 : out std_logic_vector( 7 downto 0);
dout7 : out std_logic_vector( 7 downto 0);
dout8 : out std_logic_vector( 7 downto 0);
dout9 : out std_logic_vector( 7 downto 0);
dout10 : out std_logic_vector( 7 downto 0);
dout11 : out std_logic_vector( 7 downto 0);
mout0 : out std_logic_vector( 15 downto 0);
mout1 : out std_logic_vector( 15 downto 0);
mout2 : out std_logic_vector( 15 downto 0);
mout3 : out std_logic_vector( 15 downto 0);
led0 : out std_logic_vector( 3 downto 0);
led1 : out std_logic_vector( 3 downto 0);
led2 : out std_logic_vector( 3 downto 0);
led3 : out std_logic_vector( 3 downto 0);
do: out std_logic
);
end spidecode;

architecture behavorial of spidecode is
signal reg: std_logic_vector(183 downto 0);
signal regin: std_logic_vector(183 downto 0);
signal regcount: std_logic_vector(7 downto 0);
begin
process(sck)
begin
	if(cs='0') then
		if(sck'event and sck = '1') then
         regcount <= regcount + "1";
		end if;
	else
		regcount<="00000000";
	end if;
		
	if(sck'event and sck = '1') then
		if(cs='0') then
			reg<=reg(182 downto 0) & di;
--		else
--			regcount<="00000000";
		end if;
	end if;
	if(sck'event and sck = '0') then
		if(cs='0') then
			do<=regin(to_integer(unsigned(183-regcount)));
		end if;
	end if;
end process;

process(cs,sck)
begin
	if(cs'event and cs='0') then
		regin(183 downto 176)<=sin0;
		regin(175 downto 168)<=din0;
		regin(167 downto 160)<=din1;
		regin(159 downto 152)<=din2;
		regin(151 downto 144)<=din3;
		regin(47 downto 40)<=din3;
		regin(39 downto 32)<=din2;
		regin(31 downto 24)<=din1;
		regin(23 downto 16)<=din0;
	end if;
	if(cs'event and cs='1') then
--		regcount<="00000000";
		sout0<=reg(183 downto 176);
		dout0<=reg(175 downto 168);
		dout1<=reg(167 downto 160);
		dout2<=reg(159 downto 152);
		dout3<=reg(151 downto 144);
		dout4<=reg(143 downto 136);
		dout5<=reg(135 downto 128);
		dout6<=reg(127 downto 120);
		dout7<=reg(119 downto 112);
		dout8<=reg(111 downto 104);
		dout9<=reg(103 downto 96);
		dout10<=reg(95 downto 88);
		dout11<=reg(87 downto 80);
		mout0<=reg(79 downto 64);
		mout1<=reg(63 downto 48);
		mout2<=reg(47 downto 32);
		mout3<=reg(31 downto 16);
		led0<=reg(15 downto 12);
		led1<=reg(11 downto 8);
		led2<=reg(7 downto 4);
		led3<=reg(3 downto 0);
	end if;
end process;

end behavorial;