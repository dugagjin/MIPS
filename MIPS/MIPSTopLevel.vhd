----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:14:55 10/25/2016 
-- Design Name: 
-- Module Name:    MIPSTopLevel - Behavioral 
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

entity MIPSTopLevel is
	port(
		clk: 				in		std_logic;
		reset: 			in		std_logic;
		instruction: 	out	std_logic_vector(31 downto 0)
	);
end MIPSTopLevel;
----------------------------------------------------------------------------------
architecture Behavioral of MIPSTopLevel is
	component Imem is
		port(
			clk:		in		std_logic;
			addr:		in		std_logic_vector(31 downto 0);
			instruction:	out	std_logic_vector(31 downto 0)	
		);
	end component;
----------------------------------------------------------------------------------
	component PCadder is
		port(
			clk:		in		std_logic;
			PCin:    in		std_logic_vector(31 downto 0);
			PCout: 	out 	std_logic_vector(31 downto 0)
		);
	end component ;
----------------------------------------------------------------------------------
	component PC is
		port(
			clk: in std_logic;
			reset: in std_logic;
			pc_in: in std_logic_vector(31 downto 0);
			pc_out: out std_logic_vector(31 downto 0)
		);
	end component;
----------------------------------------------------------------------------------
	signal pcin,pcout:std_logic_vector(31 downto 0);
	--signal instruction:std_logic_vector(31 downto 0);
----------------------------------------------------------------------------------	
begin
	 pc4:pcadder
		port map(
			clk=> clk,
			PCin=>pcin,
			PCout=>pcout
		);
----------------------------------------------------------------------------------	
	 instructions:Imem
		port map(
			clk=> clk,
			addr=>pcin,
			instruction=>instruction
		);
----------------------------------------------------------------------------------
	programcounter: PC
		port map(
			clk=>clk,
			reset=>reset,
			pc_in=>pcout,
			pc_out=>pcin
			);
----------------------------------------------------------------------------------

end Behavioral;

