library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is 
port (
	Data_in : in std_logic;
	CLK     : in std_logic;
	Reset   : in std_logic;
	Q       : out std_logic
);
end DFlipFlop;

architecture behavioral of DFlipFlop is 
begin
	process(Reset, CLK)
	begin
		if Reset = '1' then
			Q <= '0';
		elsif rising_edge(CLK) then
			Q <= Data_in;
		end if;
	end process;
end behavioral;

------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity ClockDivider is 
generic (
	-- Number of division can be adjusted
	num			: integer := 9
);
port (
	CLK			: in std_logic;
	Clock_sel	: in integer;
	Reset			: in std_logic;
	CLK_OUT		: out std_logic
);
end ClockDivider;

architecture behavioral of ClockDivider is 

component DFlipFlop is 
port (
	Data_in : in std_logic;
	CLK     : in std_logic;
	Reset   : in std_logic;
	Q       : out std_logic
);
end component;

signal output        : std_logic_vector(num downto 1);
signal invoutput     : std_logic_vector(num downto 1);

begin

	invoutput 	<= not(output);

	dff: DFlipFlop port map (
		Data_in => invoutput(1),
		CLK     => CLK,
		Reset   => Reset,
		Q       => output(1)
	);

	-- Generate equivalent clock division
	gen_ff: 
	for i in 2 to num generate
		dff: DFlipFlop port map (
			Data_in => invoutput(i),
			CLK     => output(i-1),
			Reset   => Reset,
			Q       => output(i)
		);
	end generate gen_ff;

	-- If Clock_sel = 0, then no division otherwise number of division based on input number
	process(Clock_sel, CLK)
	begin
		if Clock_sel = 0 then
			CLK_OUT <= CLK;
		elsif Clock_sel >= 1 and Clock_sel <= num then
			if rising_edge(CLK) then
				CLK_OUT <= output(Clock_sel);
			end if;
		else
			CLK_OUT <= '0'; 
		end if;
	end process;
    
end behavioral;
