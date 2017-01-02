LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_MIPS IS
END tb_MIPS;
 
ARCHITECTURE behavior OF tb_MIPS IS 
 
   --Inputs
   signal tb_clk : std_logic := '0';
   signal tb_reset : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1_Test: entity work.MIPS(Behavioral) PORT MAP (
          clk => tb_clk,
          reset => tb_reset
        );
	clk_process: process 
	begin 
		tb_clk <= '0';
		wait for clk_period/2;
		tb_clk <= '1';
		wait for clk_period/2;
	end process;
		
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 400 ns;
	ASSERT false
	REPORT "END"
	SEVERITY failure;
   end process;

END;
