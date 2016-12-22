----------------------------------------------------------------------------------
-- Company: NaN
-- Engineer: Dugagjin Lashi
-- 
-- Create Date: 11:48:38 12/20/2016 
-- Design Name: Core
-- Module Name: Core - Behavioral 
-- Project Name: MIPS
-- Target Devices: Spartan-6
-- Description: Core
--
-- Dependencies: intrusction Memory, program Counter Adder & Porgram counter
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity core is port (
	clock:							IN STD_LOGIC;
	reset:							IN STD_LOGIC;
	instruction: 					OUT STD_LOGIC_VECTOR(31 downto 0);
	programCounterStatus: 			OUT STD_LOGIC_VECTOR(31 downto 0)
);
end core;

architecture Behavioral of core is
	component programCounter port (
		clock:						IN STD_LOGIC;
		reset: 						IN STD_LOGIC;
		programCounterIn: 			IN STD_LOGIC_VECTOR(31 downto 0);
		programCounterOut: 			OUT STD_LOGIC_VECTOR(31 downto 0)
	);
	end component;
	component instructionMemory port (
		clock:						IN STD_LOGIC;
		address:			IN 	STD_LOGIC_VECTOR(31 downto 0);
		instruction:		OUT	STD_LOGIC_VECTOR(31 downto 0)
	);
	end component;
	component programCounterAdder port (
		clock:						IN STD_LOGIC;
		programCounterIn:			IN STD_LOGIC_VECTOR(31 downto 0);
		programCounterOut:			OUT STD_LOGIC_VECTOR(31 downto 0)
	);
	end component;
	signal programCounterMap:		STD_LOGIC_VECTOR(31 downto 0);
	signal programCounterAdd4:		STD_LOGIC_VECTOR(31 downto 0);
begin
	PC: programCounter port map(
		Clock => clock,
		Reset => reset,
		ProgramCounterOut => programCounterMap,
		ProgramCounterIn => programCounterAdd4
	);
	IM: instructionMemory port map(
		Clock => clock,
		Address => programCounterMap,
		Instruction => instruction
	); 
	PCA: programCounterAdder port map(
		Clock => clock,
		ProgramCounterIn => programCounterMap,
		ProgramCounterOut => programCounterAdd4
	);
	programCounterStatus <= programCounterAdd4;

end Behavioral;
