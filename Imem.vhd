----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:09:02 10/18/2016 
-- Design Name: 
-- Module Name:    Imem - Behavioral 
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


entity Imem is
	port(
		clk:		in		std_logic;
		addr:		in		std_logic_vector(31 downto 0);
		instruction:	out	std_logic_vector(31 downto 0)	
	);
end Imem;

architecture Behavioral of Imem is
		subtype quadbyte_t is std_logic_vector(31 downto 0);
		type imemory_t is array(0 to 31) of quadbyte_t;
begin
	memproc:process(clk)
		variable memory:imemory_t:=(others=>(others=>'0'));--nullen in steken 
	begin
		if (rising_edge(clk)) then
			memory(0):=X"00000100"; --variabel := waarde direct toegeschreven
			memory(1):=X"00000111";
			memory(2):=X"00000101";
			memory(3):=X"00000100";
			memory(4):=X"11000100";
			memory(5):=X"11100101";
			memory(6):=X"10000100";
			memory(7):=X"00001100";
			instruction<=memory(to_integer(unsigned(addr(31 downto 2))));--signaal<= enkel laatse waarde komt erdoor
		end if;
		
	end process memproc;

end Behavioral;

