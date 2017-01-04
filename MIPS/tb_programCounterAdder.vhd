LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_programCounterAdder IS
END tb_programCounterAdder;
ARCHITECTURE behavior OF tb_programCounterAdder IS
	--Inputs
	SIGNAL tb_programCounterIn : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_programCounterOut : std_logic_vector(31 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	U1_test : ENTITY work.programCounterAdder(Behavioral)
		PORT MAP(
			programCounterIn  => tb_programCounterIn,
			programCounterOut => tb_programCounterOut
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	tb_programCounterIn <= x"aaaaaaaa";
	WAIT FOR 50 ns;
	tb_programCounterIn <= x"ffffffea";
	WAIT FOR 50 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;