LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY tb_registerFile IS
END tb_registerFile;
ARCHITECTURE behavior OF tb_registerFile IS
	--Inputs
	SIGNAL tb_readRegister1 : std_logic_vector(4 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_readRegister2 : std_logic_vector(4 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_writeRegister : std_logic_vector(4 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_writeData     : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_registerWrite : std_logic := '0';
	--Outputs
	SIGNAL tb_readData1 : std_logic_vector(31 DOWNTO 0);
	SIGNAL tb_readData2 : std_logic_vector(31 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	U1_Reg : ENTITY work.registerFile(Behavioral)
		PORT MAP(
			readRegister1 => tb_readRegister1,
			readRegister2 => tb_readRegister2,
			writeRegister => tb_writeRegister,
			writeData     => tb_writeData,
			registerWrite => tb_registerWrite,
			readData1     => tb_readData1,
			readData2     => tb_readData2
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	-- read all 32 registers
	-- FOR I IN 0 TO 30 LOOP
	-- tb_readRegister1 <= std_logic_vector(to_unsigned(I, 5));
	-- tb_readRegister2 <= std_logic_vector(to_unsigned(I + 1, 5));
	-- WAIT FOR 25 ns;
	-- END LOOP;
	-- Overwriting a register
	tb_writeRegister <= "01000"; -- $t0 register
	tb_writeData     <= x"a5a5a5a5";
	WAIT FOR 50 ns;
	tb_registerWrite <= '1';
	WAIT FOR 5 ns;
	tb_registerWrite <= '0';
	WAIT FOR 5ns;
	-- register $t0 should now be written
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;