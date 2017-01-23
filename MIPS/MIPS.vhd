LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY MIPS IS
	PORT (
		clk   : IN STD_LOGIC;
		reset : IN STD_LOGIC
	);
END MIPS;
ARCHITECTURE Behavioral OF MIPS IS
	SIGNAL se_in   : std_logic_vector(15 DOWNTO 0) := x"7FFF";
	SIGNAL se_out  : std_logic_vector(31 DOWNTO 0) := x"00000000";
	SIGNAL reg2    : std_logic_vector(31 DOWNTO 0) := x"12345678";
	SIGNAL mux_ctl : std_logic := '1';
	SIGNAL mux_out : std_logic_vector(31 DOWNTO 0) := x"00000000";
	SIGNAL readAdress : std_logic_vector(31 DOWNTO 0) := x"00000000";
	SIGNAL instruction : std_logic_vector(31 DOWNTO 0) := x"00000000";
	SIGNAL programCounterIn : std_logic_vector(31 DOWNTO 0) := x"00400000";
	SIGNAL programCounterOut : std_logic_vector(31 DOWNTO 0) := x"00000000";
BEGIN
	--instantiate the ALU source mux
	U1 : ENTITY work.Mux(Behavioral)
		PORT MAP(
			mux_in0 => reg2,
			mux_in1 => se_out,
			mux_ctl => mux_ctl,
			mux_out => mux_out
		);
	-- instantiate a sign extender
	U2 : ENTITY work.SignExtender(Behavioral)
		PORT MAP(
			se_in  => instruction (15 downto 0),
			se_out => se_out
		);
	U3 : ENTITY work.instructionMemory(Behavioral)
		PORT MAP(
			readAddress => readAdress,
			instruction => programCounterOut
		);
	U4 : ENTITY work.programCounter(Behavioral)
		PORT MAP(
			programCounterIn => programCounterIn,
			programCounterOut => programCounterOut
		);
END Behavioral;