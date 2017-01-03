LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY alu_control IS
	PORT (
		funct     : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		ALUop     : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		operation : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END alu_control;
ARCHITECTURE Behavioral OF alu_control IS
BEGIN
-- notes from class
operation(3) <= '0'; 
operation(2) <= ALUop(0) or (ALUop(1) and funct(1)); 
operation(1) <= not ALUop(1) or not funct(2); 
operation(0) <= (funct(3) or funct(0)) and ALUop(1);
END Behavioral;