LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_ALU IS
END tb_ALU;
ARCHITECTURE behavior OF tb_ALU IS

	--Inputs
	SIGNAL tb_a1          : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_a2          : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tb_alu_control : std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_alu_result : std_logic_vector(31 DOWNTO 0);
	SIGNAL tb_zero       : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : ENTITY work.ALU(Behavioral)
		PORT MAP(
			a1          => tb_a1,
			a2          => tb_a2,
			alu_control => tb_alu_control,
			alu_result  => tb_alu_result,
			zero        => tb_zero
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	tb_a1          <= x"00000003";
	tb_a2          <= x"FFFFFFFF";
	tb_alu_control <= "0000"; --bitwise and
	WAIT FOR 50 ns;
	tb_alu_control <= "0001"; --bitwise or
	WAIT FOR 50 ns;
	tb_alu_control <= "0010"; --bitwise addition
	WAIT FOR 50 ns;
	tb_alu_control <= "0110"; --bitwise substraction
	WAIT FOR 50 ns;
	tb_alu_control <= "0111"; --set les than
	WAIT FOR 50 ns;
	tb_alu_control <= "1100"; --bitwise nor
	WAIT FOR 50 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;