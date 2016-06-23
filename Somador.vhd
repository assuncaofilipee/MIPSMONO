library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Somador is 
 	port( 
		A, B: in std_logic_vector(31 downto 0); 
 		Resultado: out std_logic_vector(31 downto 0) 
 	); 
end entity; 

architecture behavior of Somador is 
begin 
   Resultado <= std_logic_vector(unsigned(A) + unsigned(B)); 
end architecture; 
