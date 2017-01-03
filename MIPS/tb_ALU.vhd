LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
  

   --Inputs
   signal tb_a1 : std_logic_vector(31 downto 0) := (others => '0');
   signal tb_a2 : std_logic_vector(31 downto 0) := (others => '0');
   signal tb_alu_control : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal tb_alu_result : std_logic_vector(31 downto 0);
   signal tb_zero : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.ALU(Behavioral) PORT MAP (
          a1 => tb_a1,
          a2 => tb_a2,
          alu_control => tb_alu_control,
          alu_result => tb_alu_result,
          zero => tb_zero
        );

   -- Stimulus process
   stim_proc: process
   begin		
   tb_a1 <= x"00000003"; 
   tb_a2 <= x"FFFFFFFF";
   tb_alu_control <= "0000"; --bitwise and
   wait for 50 ns;
   tb_alu_control <= "0001"; --bitwise or
   wait for 50 ns;
   tb_alu_control <= "0010"; --bitwise addition
   wait for 50 ns;
   tb_alu_control <= "0110"; --bitwise substraction
   wait for 50 ns;
   tb_alu_control <= "0111"; --set les than
   wait for 50 ns;
   tb_alu_control <= "1100"; --bitwise nor
   wait for 50 ns;
   
	ASSERT false
	REPORT "END"
	SEVERITY failure;
   end process;

END;
