LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
ENTITY tb_dataMemory IS
END tb_dataMemory;
ARCHITECTURE behavior OF tb_dataMemory IS
	--Inputs
	SIGNAL tb_address   : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_writeData : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_memRead   : std_logic := '0';
	SIGNAL tb_memWrite  : std_logic := '0';
	--Outputs
	SIGNAL tb_readData : std_logic_vector(31 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : ENTITY work.dataMemory(Behavioral)
		PORT MAP(
			address   => tb_address,
			writeData => tb_writeData,
			memRead   => tb_memRead,
			memWrite  => tb_memWrite,
			readData  => tb_readData
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	-- write two memory locations
	tb_address   <= x"10010000";
	tb_writeData <= x"11112222";
	tb_memWrite  <= '0';
	WAIT FOR 10 ns;
	tb_memWrite <= '1';
	WAIT FOR 10 ns;
	tb_memWrite <= '0';
	WAIT FOR 10 ns;
	tb_address   <= x"10010004";
	tb_writeData <= x"33334444";
	tb_memWrite  <= '0';
	WAIT FOR 10 ns;
	tb_memWrite <= '1';
	WAIT FOR 10 ns;
	tb_memWrite <= '0';
	WAIT FOR 10 ns;
	-- read two memory locations
	tb_address <= x"10010000";
	tb_memRead <= '0';
	WAIT FOR 10 ns;
	tb_memRead <= '1';
	WAIT FOR 10 ns;
	tb_memRead <= '0';
	WAIT FOR 10 ns;
	tb_address <= x"10010004";
	tb_memRead <= '0';
	WAIT FOR 10 ns;
	tb_memRead <= '1';
	WAIT FOR 10 ns;
	tb_memRead <= '0';
	WAIT FOR 10 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;