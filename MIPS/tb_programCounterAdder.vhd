LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_programCounterAdder IS
END tb_programCounterAdder;
 
ARCHITECTURE behavior OF tb_programCounterAdder IS 
   --Inputs
   signal tb_programCounterIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal tb_programCounterOut : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   U1_test: entity work.programCounterAdder(Behavioral) PORT MAP (
          programCounterIn => tb_programCounterIn,
          programCounterOut => tb_programCounterOut
	); 

   -- Stimulus process
   stim_proc: process
   begin	
   tb_programCounterIn <= x"aaaaaaaa";
   wait for 50 ns;
   tb_programCounterIn <= x"ffffffea";
   wait for 50 ns;
	ASSERT false
	REPORT "END"
		SEVERITY failure;   
   end process;

END;
