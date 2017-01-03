LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY dataMemory IS
	PORT (
		address   : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		writeData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		memRead   : IN STD_LOGIC;
		memWrite  : IN STD_LOGIC;
		readData  : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END dataMemory;
ARCHITECTURE Behavioral OF dataMemory IS
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
	SIGNAL DM : RAM_16_x_32 := (
		x"00000000", -- assume starts at 0x1000100000
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
BEGIN
	PROCESS (memWrite, memRead) -- pulse on write
	-- Note: 268500992 = 0x10010000
	BEGIN
		IF (memWrite = '1') THEN
			DM((to_integer(unsigned(address)) - 268500992) / 4) <= writeData;
		END IF;
		IF (memRead = '1') THEN
			readData <= DM((to_integer(unsigned(address)) - 268500992)/4);
		END IF;
		-- it gives, 0, 1, 2, 3, 4, ...
	END PROCESS;
END Behavioral;