LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY shiftLeft IS
	GENERIC (
		N : INTEGER := 2;
		W : INTEGER := 32
	);
	PORT (
		input  : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
	);
END shiftLeft;
ARCHITECTURE Behavioral OF shiftLeft IS
BEGIN
	output(W - 1)          <= input(W - 1);
	output(W - 2 DOWNTO N) <= input(W - 2 - N DOWNTO 0);
	output(N - 1 DOWNTO 0) <= (OTHERS => '0');
END Behavioral;