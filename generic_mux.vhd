library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux is
  generic(WIDTH: natural:=8);
  port(
  a:  in std_logic_vector(WIDTH-1 downto 0);
  b:in std_logic_vector(WIDTH-1 downto 0);
  sel: in std_logic;
  outp: out std_logic_vector(WIDTH-1 downto 0)
  );
  end mux;
  
  architecture arch of mux is
  Begin 
  
  outp <= a when sel = '0'
  else
  b;
  end architecture;
  
  
 