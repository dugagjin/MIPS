LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
ENTITY tb_controller IS
END tb_controller;
ARCHITECTURE behavior OF tb_controller IS
	--Inputs
	SIGNAL tb_opcode : std_logic_vector(5 DOWNTO 0) := (OTHERS => '0');
	--Outputs
	SIGNAL tb_regDst        : std_logic;
	SIGNAL tb_jump          : std_logic;
	SIGNAL tb_branch        : std_logic;
	SIGNAL tb_memRead       : std_logic;
	SIGNAL tb_memToRegister : std_logic;
	SIGNAL tb_ALUop         : std_logic_vector(1 DOWNTO 0);
	SIGNAL tb_memWrite      : std_logic;
	SIGNAL tb_ALUsrc        : std_logic;
	SIGNAL tb_regWrite      : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	U1_Test : ENTITY work.Controller(Behavioral)
		PORT MAP(
			opcode        => tb_opcode,
			regDst        => tb_regDst,
			jump          => tb_jump,
			branch        => tb_branch,
			memRead       => tb_memRead,
			memToRegister => tb_memToRegister,
			ALUop         => tb_ALUop,
			memWrite      => tb_memWrite,
			ALUsrc        => tb_ALUsrc,
			regWrite      => tb_regWrite
		);
		-- Stimulus process
stim_proc : PROCESS
BEGIN
	tb_opcode <= "000000"; --R-type
	WAIT FOR 50 ns;
	tb_opcode <= "100011"; --load word
	WAIT FOR 50 ns;
	tb_opcode <= "101011"; --store word
	WAIT FOR 50 ns;
	tb_opcode <= "000100"; --breanh equal
	WAIT FOR 50 ns;
	tb_opcode <= "000010"; --jump
	WAIT FOR 50 ns;
	tb_opcode <= "111111"; --unknown
	WAIT FOR 50 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;
END PROCESS;
END;