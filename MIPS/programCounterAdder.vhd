----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:16 12/20/2016 
-- Design Name: 
-- Module Name:    programCounterAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
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
