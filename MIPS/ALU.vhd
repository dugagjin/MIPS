LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
	PORT (
		a1           : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		a2           : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		alu_control  : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		alu_result   : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		zero         : OUT STD_LOGIC
	);
END ALU;
ARCHITECTURE Behavioral OF ALU IS
	SIGNAL resultX : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN
	PROCESS (a1, a2, alu_control)
	BEGIN
		CASE alu_control IS
				-- Bitwise and
			WHEN "0000" =>
				resultX <= a1 AND a2;
				-- Bitwise or
			WHEN "0001" =>
				resultX <= a1 OR a2;
				-- addition
			WHEN "0010" =>
				resultX <= std_logic_vector(unsigned(a1) + unsigned(a2));
				-- subtract
			WHEN "0110" =>
				resultX <= std_logic_vector(unsigned(a1) - unsigned(a2));
				-- set les than
			WHEN "0111" =>
				IF (signed(a1) < signed(a2)) THEN
					resultX <= x"00000001";
				ELSE
					resultX <= x"00000000";
				END IF;
				-- Bitwise nor
			WHEN "1100" =>
				resultX <= a1 NOR a2;
				-- Nop
			WHEN others => NULL;
			resultX <= x"00000000";
		END CASE;
	END PROCESS;
	-- concurent code
	alu_result <= resultX;
	zero <= '1' WHEN resultX = x"00000000" ELSE
	        '0';
END Behavioral;