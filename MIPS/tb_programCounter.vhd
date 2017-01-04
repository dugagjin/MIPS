LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_programCounter IS
END tb_programCounter;
ARCHITECTURE behavior OF tb_programCounter IS
	--Inputs
	SIGNAL tb_clock : std_logic := '0';
	SIGNAL tb_programCounterIn : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_programCounterOut : std_logic_vector(31 DOWNTO 0);
	-- Clock period definitions
	CONSTANT clock_period : TIME := 20 ns;
BEGIN
	-- Instantiate the Unit Under Test (U1_Test)
	U1_Test : ENTITY work.programCounter(Behavioral)
		PORT MAP(
			clock              => tb_clock,
			programCounterIn   => tb_programCounterIn,
			programCounterOut  => tb_programCounterOut
		);
		-- Clock process definitions
clock_process : PROCESS
BEGIN
	tb_clock <= '0';
	WAIT FOR clock_period/2;
	tb_clock <= '1';
	WAIT FOR clock_period/2;
END PROCESS;
-- Stimulus process
stim_proc : PROCESS
BEGIN
	tb_programCounterIn <= x"00000000";
	WAIT FOR 50 ns;
	tb_programCounterIn <= x"00000004";
	WAIT FOR 50 ns;
	tb_programCounterIn <= x"00000008";
	WAIT FOR 50 ns;
	tb_programCounterIn <= x"0000000c";
	WAIT FOR 50 ns;
	tb_programCounterIn <= x"FFFFFFF0";
	WAIT FOR 50 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;