LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_MUX IS
END tb_MUX;
 
ARCHITECTURE behavior OF tb_MUX IS 
 
	constant N : integer := 32;
   --Inputs
   signal tb_mux_in0 : std_logic_vector(N-1 downto 0) := (others => '0');
   signal tb_mux_in1 : std_logic_vector(N-1 downto 0) := (others => '0');
   signal tb_mux_ctl : std_logic := '0';

 	--Outputs
   signal tb_mux_out : std_logic_vector(N-1 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U1_Test: entity work.MUX(Behavioral) 
	Generic Map (N => 32)
	PORT MAP (
          mux_in0 => tb_mux_in0,
          mux_in1 => tb_mux_in1,
          mux_ctl => tb_mux_ctl,
          mux_out => tb_mux_out
        ); 

   -- Stimulus process
   stim_proc: process
   begin
		-- 32 bit 2 to 1 mux
		tb_mux_in0 <= x"AAAA5555";
		tb_mux_in1 <= x"5555AAAA";

		tb_mux_ctl <= '0';
		wait for 100 ns;

		tb_mux_ctl <= '1';
		wait for 100 ns;

		tb_mux_ctl <= '0';
		wait for 100 ns; 

		-- 5 bit 2 to 1 mux
--		tb_mux_in0 <= "10101";
--		tb_mux_in1 <= "01010";
--
--		tb_mux_ctl <= '0';
--		wait for 100 ns;
--
--		tb_mux_ctl <= '1';
--		wait for 100 ns;
--
--		tb_mux_ctl <= '0';
--		wait for 100 ns; 
		
		-- allow to zoom to full view
		-- always at the end otherwise program will break
		assert false 
		report "End" 
		severity failure;
   end process;

END;
