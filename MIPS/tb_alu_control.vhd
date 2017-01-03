LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_alu_control IS
END tb_alu_control;
ARCHITECTURE behavior OF tb_alu_control IS
	--Inputs
	SIGNAL tb_funct : std_logic_vector(5 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_ALUop : std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_operation : std_logic_vector(3 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : ENTITY work.alu_control(Behavioral)
		PORT MAP(
			funct     => tb_funct,
			ALUop     => tb_ALUop,
			operation => tb_operation
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	-- R-type commands (see green sheet)
	tb_ALUop <= "10";
	tb_funct <= "100100"; -- and
	WAIT FOR 20 ns;
	tb_ALUop <= "10";
	tb_funct <= "100101"; -- or
	WAIT FOR 20 ns;
	tb_ALUop <= "10";
	tb_funct <= "100000"; -- add
	WAIT FOR 20 ns;
	tb_ALUop <= "10";
	tb_funct <= "100010"; -- sub
	WAIT FOR 20 ns;
	tb_ALUop <= "10";
	tb_funct <= "101010"; -- slt
	WAIT FOR 20 ns;
	-- I type commands
	-- load word command
	tb_ALUop <= "00";
	tb_funct <= "XXXXXX"; -- and
	WAIT FOR 20 ns;
	-- store word command
	tb_ALUop <= "00";
	tb_funct <= "XXXXXX"; -- and
	WAIT FOR 20 ns;
	-- branch equal command
	tb_ALUop <= "00";
	tb_funct <= "XXXXXX"; -- and
	WAIT FOR 20 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;