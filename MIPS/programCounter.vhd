LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY programCounter IS
	PORT (
		programCounterIn   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		programCounterOut  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END programCounter;
ARCHITECTURE Behavioral OF programCounter IS
BEGIN
	programCounterOut <= programCounterIn;
	-- programCounterOut <= x"00400000" OR std_logic_vector(to_unsigned(progamCounterIn * 4, 32));
END Behavioral;