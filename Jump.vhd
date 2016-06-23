library ieee;
use ieee.std_logic_1164.all;

entity Jump is
   port(
		instrucao: std_logic_vector(25 downto 0);
		Pc: in std_logic_vector(3 downto 0);
		Resultado: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of Jump is
begin
	Resultado <= Pc & (instrucao & "00");
end architecture;