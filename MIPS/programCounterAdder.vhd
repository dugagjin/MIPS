----------------------------------------------------------------------------------
-- Company: NaN
-- Engineer: Dugagjin Lashi
-- 
-- Create Date: 09:43:19 12/20/2016 
-- Design Name: program counter adder
-- Module Name: programCounterAdder - Behavioral 
-- Project Name: MIPS
-- Target Devices: Spartan-6
-- Description: program counter adder
--
-- Dependencies: No
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity programCounterAdder is port(
		clock:					IN		STD_LOGIC;
		programCounterIn:    IN		STD_LOGIC_VECTOR(31 downto 0);
		programCounterOut: 	OUT 	STD_LOGIC_VECTOR(31 downto 0)
	);
end programCounterAdder;

architecture Behavioral of programCounterAdder is
begin

	add4:process(clock)
	begin
		if (rising_edge(clock)) then
		programCounterOut <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(programCounterIn)) + 4, 32));
		end if;
	end process add4;

end Behavioral;
