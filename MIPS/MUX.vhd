-- This component is valid for all multiplexers present in the MIPS
-- Default multiplexing is 32 bit though
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MUX IS
	GENERIC (
		N : INTEGER := 32
	);
	PORT (
		mux_in0  : IN std_logic_vector(N - 1 DOWNTO 0);
		mux_in1  : IN std_logic_vector(N - 1 DOWNTO 0);
		mux_ctl  : IN STD_logic;
		mux_out  : OUT STD_logic_vector(N - 1 DOWNTO 0)
	);
END MUX;
ARCHITECTURE Behavioral OF MUX IS
BEGIN
	mux_out <= mux_in0 WHEN mux_ctl = '0' ELSE
	           mux_in1;
END Behavioral;