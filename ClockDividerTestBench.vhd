library ieee;
use ieee.std_logic_1164.all;

entity ClockDividerTestBench is 
end ClockDividerTestBench;

architecture behavioral of ClockDividerTestBench is 

component ClockDivider is 
port (
	CLK			: in std_logic;
	Clock_sel	: in integer;
	Reset			: in std_logic;
	CLK_OUT		: out std_logic
);
end component;

-- Select clock division (0 for no division, 1 for divide once and so on)
signal Clock_sel					: integer	:= 4; 
signal CLK_in, Reset, CLK_out	: std_logic;

begin
	
	-- Clock divider setup
	uut: ClockDivider port map (
		CLK			=> CLK_in,
		Clock_sel	=> Clock_sel,
		Reset			=> Reset,
		CLK_OUT		=> CLK_out
	);
	
	-- Clock is 100MHz
	sim: process
	begin
		CLK_in <= '0';
		wait for 5ns;
		CLK_in <= '1';
		wait for 5ns;
	end process;
	
	-- Reset all flip-flop before operation to ensure synchronicity
	res: process
	begin
		Reset <= '1';
		wait for 10ns;
		Reset <= '0';
		wait;
	end process;	
	
end behavioral;
