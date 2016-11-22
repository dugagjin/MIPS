--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:53:29 10/18/2016
-- Design Name:   
-- Module Name:   /home/zwakrim/Documents/computerarch/mips/pc4.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PCadder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pc4 IS
END pc4;
 
ARCHITECTURE behavior OF pc4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCadder
    PORT(
         clk : IN  std_logic;
         PCin : IN  std_logic_vector(31 downto 0);
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal PCin : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PCout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PCadder PORT MAP (
          clk => clk,
          PCin => PCin,
          PCout => PCout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		PCin<=X"00000000";
      wait for clk_period*10;
		PCin<=X"00000004";
      wait for clk_period*10;
		PCin<=X"00000008";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
