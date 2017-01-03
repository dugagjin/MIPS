library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity programCounterAdder is port(
		programCounterIn:    		IN	STD_LOGIC_VECTOR(31 downto 0);
		programCounterOut: 			OUT STD_LOGIC_VECTOR(31 downto 0)
		);
end programCounterAdder;

architecture Behavioral of programCounterAdder is 
begin
	add4:process(programCounterIn)
	begin
		programCounterOut <= programCounterIn + 4;
	end process add4;

end Behavioral;

