-- signextender whichs preserves the msb
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY SignExtender IS
	PORT (
		se_in   : IN STD_logic_vector(15 DOWNTO 0);
		se_out  : OUT STD_logic_vector(31 DOWNTO 0)
	);
END SignExtender;
ARCHITECTURE Behavioral OF SignExtender IS
BEGIN
	-- concat hex 0000 with se_in if msb is 0 else ...
	se_out <= x"0000" & se_in WHEN se_in(15) = '0'
	          ELSE
	          x"FFFF" & se_in;
END Behavioral;