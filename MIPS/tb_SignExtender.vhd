LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_SignExtender IS
END tb_SignExtender;
ARCHITECTURE behavior OF tb_SignExtender IS
	--Inputs
	SIGNAL tb_se_in : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_se_out : std_logic_vector(31 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (U1_Test)
	U1_Test : ENTITY work.SignExtender(Behavioral)
		PORT MAP(
			se_in   => tb_se_in,
			se_out  => tb_se_out
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	tb_se_in <= x"7FFF"; -- 7 is 0100
	WAIT FOR 100ns;
	tb_se_in <= x"8000"; -- 8 is 1000
	WAIT FOR 100 ns;
	tb_se_in <= x"FFFF";
	WAIT FOR 100 ns;
	-- allow to zoom to full view
	-- always at the end otherwise program will break
	ASSERT false
	REPORT "END"
	SEVERITY failure;
END PROCESS;
END;