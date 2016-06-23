library ieee; 
use ieee.std_logic_1164.all; 

entity Extensao16Para32Bits is 
		port( 
         Es_in: in std_logic_vector(15 downto 0); 
         Es_out: out std_logic_vector(31 downto 0) 
		); 
end entity; 

architecture behavior of Extensao16Para32Bits is 
begin 
	process (Es_in) is 
	begin 
		if Es_in(15) = '0' then 
			Es_out <= x"0000" & Es_in; 
		else 
			Es_out <= x"FFFF" & Es_in; 
		end if; 
	end process; 
end architecture; 
