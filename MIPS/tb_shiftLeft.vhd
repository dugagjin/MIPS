LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_shiftLeft IS
END tb_shiftLeft;
ARCHITECTURE behavior OF tb_shiftLeft IS
	--Inputs
	SIGNAL tb_input : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_output : std_logic_vector(31 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	U1_Test : ENTITY work.shiftLeft(Behavioral)
	PORT MAP(
		input  => tb_input,
		output => tb_output
	);
	-- Stimulus process
stim_proc : PROCESS
BEGIN
	tb_input <= x"00000001";
	WAIT FOR 100ns;
	tb_input <= x"8000FFFF";
	WAIT FOR 100 ns;
	tb_input <= x"FFFF8000";
	WAIT FOR 100 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;