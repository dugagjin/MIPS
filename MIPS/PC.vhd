----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:35 10/18/2016 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
	port(
		clk: in std_logic;
		reset: in std_logic;
		pc_in: in std_logic_vector(31 downto 0);
		pc_out: out std_logic_vector(31 downto 0)
	);
end PC;

architecture Behavioral of PC is
		signal pc_reset:std_logic;	
begin
	--the pc process
	setpc:process(clk)
	begin
		if (rising_edge(clk)) then
			if (pc_reset='1') then
				pc_out<=(others=>'0');
			else
				pc_out<=pc_in;
			end if;
		end if;
	end process setpc;
	
	resetpc:process(reset,clk)
	begin
		if(reset='1') then
			pc_reset<='1';
		elsif ((rising_edge(clk)) and (reset='0')) then
			pc_reset<='0';
		end if;
	end process resetpc;
end Behavioral;

