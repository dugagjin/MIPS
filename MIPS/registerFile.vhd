LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY registerFile IS
	GENERIC (
		B : INTEGER := 32; --number of bits
		W : INTEGER := 5 --number of address bits
	);
	PORT (
		readRegister1 : IN std_logic_vector (W - 1 DOWNTO 0);
		readRegister2 : IN std_logic_vector (W - 1 DOWNTO 0);
		writeRegister : IN std_logic_vector (W - 1 DOWNTO 0);
		writeData     : IN std_logic_vector (B - 1 DOWNTO 0);
		registerWrite : IN std_logic;
		readData1     : OUT std_logic_vector (B - 1 DOWNTO 0);
		readData2     : OUT std_logic_vector (B - 1 DOWNTO 0)
	);
END registerFile;
ARCHITECTURE Behavioral OF registerFile IS
	-- create type 2d array
	TYPE reg_file_type IS ARRAY (0 TO 2 ** W - 1) OF std_logic_vector(B - 1 DOWNTO 0);
	-- create 32 registers of 32 bits
	SIGNAL array_reg : reg_file_type := (
		x"00000000", --$zero
		x"11111111", --$at
		x"22222222", --$v0
		x"33333333", --$v1
		x"44444444", --$a0
		x"55555555", --$a1
		x"66666666", --$a2
		x"77777777", --$a3
		x"88888888", --$t0
		x"99999999", --$t1
		x"aaaaaaaa", --$t2
		x"bbbbbbbb", --$t3
		x"cccccccc", --$t4
		x"dddddddd", --$t5
		x"eeeeeeee", --$t6
		x"ffffffff", --$t7
		x"00000000", --$s0
		x"11111111", --$s1
		x"22222222", --$s2
		x"33333333", --$s3
		x"44444444", --$s4
		x"55555555", --$s5
		x"66666666", --$s6
		x"77777777", --$s7
		x"88888888", --$t8
		x"99999999", --$t9
		x"aaaaaaaa", --$k0
		x"bbbbbbbb", --$k1
		x"10008000", --$global pointer
		x"7FFFF1EC", --$stack pointer
		x"eeeeeeee", --$frame pointer
		x"ffffffff" --$return address
	);
BEGIN
	PROCESS (registerWrite) -- pulse on write
	BEGIN
		-- writeRegister is the register which we want to write to
		-- writeData is the data which we dant to save
		IF (registerWrite = '1') THEN
			array_reg(to_integer(unsigned(writeRegister))) <= writeData;
		END IF;
	END PROCESS;
	-- read port
	readData1 <= array_reg(to_integer(unsigned(readRegister1)));
	readData2 <= array_reg(to_integer(unsigned(readRegister2)));
END Behavioral;