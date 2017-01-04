LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY programCounter IS
	PORT (
		clock              : IN STD_LOGIC;
		programCounterIn   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		programCounterOut  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END programCounter;
ARCHITECTURE Behavioral OF programCounter IS
	SIGNAL address : std_logic_vector(31 DOWNTO 0) := x"00000000";
BEGIN
	PROCESS (clock)
	BEGIN
		programCounterOut <= address;
		IF (rising_edge(clock)) THEN
			programCounterOut <= programCounterIn;
			-- programCounterOut <= x"00400000" OR std_logic_vector(to_unsigned(progamCounterIn * 4, 32));
		END IF;
	END PROCESS;
END Behavioral;