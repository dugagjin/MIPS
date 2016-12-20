----------------------------------------------------------------------------------
-- Company: NaN
-- Engineer: Dugagjin Lashi
-- 
-- Create Date: 09:43:19 12/20/2016 
-- Design Name: program counter
-- Module Name: programCounter - Behavioral 
-- Project Name: MIPS
-- Target Devices: Spartan-6
-- Description: Program counter
--
-- Dependencies: No
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity programCounter is
port (
	clock:					IN STD_LOGIC;
	reset:					IN STD_LOGIC;
	programCounterIn:		IN STD_LOGIC_VECTOR(31 downto 0);
	programCounterOut: 	OUT STD_LOGIC_VECTOR(31 downto 0)
);
end programCounter;

architecture Behavioral of programCounter is
	signal programCounterReset: STD_LOGIC;
begin
	programCounterSet: process(clock)
	begin
		if (rising_edge(clock)) then
			if (programCounterReset = '1') then
				programCounterOut <= (others => '0');
			else
				programCounterOut <= programCounterInt;
			end if;
		end if;
	end process programCounterSet;
	programCounterReset: process(reset, clock)
	begin
		if (reset = '1') then
			programCounterReset <= '1';
		elsif ((rising_edge(clock)) and (reset = '0')) then
			programCounterReset <= '0';
		end if;
	end process resetPC;
end Behavioral;

