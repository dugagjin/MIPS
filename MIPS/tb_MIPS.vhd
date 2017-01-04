LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_MIPS IS
END tb_MIPS;
ARCHITECTURE behavior OF tb_MIPS IS
	--Inputs
	SIGNAL tb_clk : std_logic := '0';
	SIGNAL tb_reset : std_logic := '0';
	-- Clock period definitions
	CONSTANT clk_period : TIME := 20 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	U1_Test : ENTITY work.MIPS(Behavioral)
		PORT MAP(
			clk    => tb_clk,
			reset  => tb_reset
		);
clk_process : PROCESS
BEGIN
	tb_clk <= '0';
	WAIT FOR clk_period/2;
	tb_clk <= '1';
	WAIT FOR clk_period/2;
END PROCESS;
-- Stimulus process
stim_proc : PROCESS
BEGIN
	WAIT FOR 400 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;