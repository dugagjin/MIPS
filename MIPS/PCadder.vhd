----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:53 10/18/2016 
-- Design Name: 
-- Module Name:    PCadder - Behavioral 
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

entity PCadder is
	port(
		clk:		in		std_logic;
		PCin:    in		std_logic_vector(31 downto 0);
		PCout: 	out 	std_logic_vector(31 downto 0)
	);
end PCadder;

architecture Behavioral of PCadder is

begin
	add4:process(clk)
		
	begin
		if (rising_edge(clk)) then
		 
		PCout<=std_logic_vector(to_unsigned(to_integer(unsigned( pcin)) + 4, 32));
		
		end if;
	end process add4;

end Behavioral;

