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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instructionMemory is port (
	programCounter:	IN 	STD_LOGIC_VECTOR(31 downto 0);
	instruction:		OUT	STD_LOGIC_VECTOR(31 downto 0)
);
end instructionMemory;

architecture Behavioral of instructionMemory is
begin
	memoryProgramCounter: process(programCounter)
		subtype word is STD_LOGIC_VECTOR(31 downto 0);
		type memory is array(0 to 7) of word;
		variable myMemory: memory := (
			X"00000001", X"00000010",
			X"00000100", X"00000100",
			X"00010000", X"00100000",
			X"01000000", X"10000000"
		);
begin
	instruction <= myMemory(conv_integer(programCounter(31 downto 2)));
end process memoryProgramCounter;
end Behavioral;


