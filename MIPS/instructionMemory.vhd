-- Company: NaN
-- Engineer: Dugagjin Lashi
-- 
-- Create Date: 10:01:50 12/20/2016  
-- Design Name: instruction memory
-- Module Name: instructionMemory - Behavioral 
-- Project Name: MIPS
-- Target Devices: Spartan-6
-- Description: instruction memory
--
-- Dependencies: No
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instructionMemory is port (
	clock:				IN 	STD_LOGIC;
	address:			IN 	STD_LOGIC_VECTOR(31 downto 0);
	instruction:		OUT	STD_LOGIC_VECTOR(31 downto 0)
);
end instructionMemory;

architecture Behavioral of instructionMemory is
	subtype word is STD_LOGIC_VECTOR(31 downto 0);
	type memory is array(0 to 7) of word;
begin
	memoryProcess: process(clock)
		variable myMemory:memory:=(others=>(others=>'0'));
		begin
			if (rising_edge(clock)) then
				myMemory(0):= X"00000001"; 
				myMemory(1):= X"00000001";
				myMemory(2):= X"00000001";
				myMemory(3):= X"00000001";
				myMemory(4):= X"00000001";
				myMemory(5):= X"00000001";
				myMemory(6):= X"00000001";
				myMemory(7):= X"00000001";
				instruction <= myMemory(to_integer(unsigned(address(31 downto 2))));
			end if;
		end process memoryProcess;
end Behavioral;


