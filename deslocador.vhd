library ieee;
use ieee.std_logic_1164.all;
     
entity deslocador is
	port(
		inpt: in std_logic_vector(31 downto 0);
		outp: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of deslocador is
begin
	outp <= inpt(29 downto 0) & "00";
end architecture;