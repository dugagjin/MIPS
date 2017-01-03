LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Controller IS
	PORT (
		opcode        : IN std_logic_vector(5 DOWNTO 0); -- instruction 31-26
		regDst        : OUT std_logic;
		jump          : OUT std_logic;
		branch        : OUT std_logic;
		memRead       : OUT std_logic;
		memToRegister : OUT std_logic;
		ALUop         : OUT std_logic_vector(1 DOWNTO 0);
		memWrite      : OUT std_logic;
		ALUsrc        : OUT std_logic;
		regWrite      : OUT std_logic
	);
END Controller;
ARCHITECTURE Behavioral OF Controller IS
BEGIN
	PROCESS (opcode)
	BEGIN
		regWrite <= '0'; --Deassert for next command
		CASE opcode IS
			WHEN "000000" => -- and, or, add, sub, slt: 0x00
				regDst        <= '1';
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "10";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '1' AFTER 10 ns;
			WHEN "100011" => -- load word(lw): 0x23
				regDst        <= '0';
				jump          <= '0';
				branch        <= '0';
				memRead       <= '1';
				memToRegister <= '1';
				ALUop         <= "00";
				memWrite      <= '0';
				ALUsrc        <= '1';
				regWrite      <= '1' AFTER 10 ns;
			WHEN "101011" => -- store word(beq): 0x2B
				regDst        <= 'X'; -- don't care
				jump          <= '0';
				branch        <= '0' AFTER 2 ns;
				memRead       <= '0';
				memToRegister <= 'X'; -- don't care
				ALUop         <= "00";
				memWrite      <= '1';
				ALUsrc        <= '1';
				regWrite      <= '0';
			WHEN "000100" => -- branch equal(beq): 0x04
				regDst        <= 'X'; -- don't care
				jump          <= '0';
				branch        <= '1' AFTER 2 ns;
				memRead       <= '0';
				memToRegister <= 'X'; -- don't care
				ALUop         <= "01";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '0';
			WHEN "000010" => -- jump(j): 0x02
				regDst        <= 'X';
				jump          <= '1';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= 'X';
				ALUop         <= "00";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '0';
			WHEN OTHERS => NULL; --implement other commands down here
				regDst        <= '0';
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "00";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '0';
		END CASE;
	END PROCESS;
END Behavioral;