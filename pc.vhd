library IEEE;
use IEEE.Std_Logic_1164.all;

entity pc is
	port (CLK, RST: in std_logic;
			inpt: in std_logic_vector(31 downto 0);
			outp: out std_logic_vector(31 downto 0)
 ); 
 end pc;
 
architecture behv of pc is
begin
	process(CLK, inpt)
	begin
		if RST = '0' then
			outp <= x"00000000";
		elsif (CLK'event and CLK = '0') then
			outp <= inpt;
		end if;
	end process;
end behv; 