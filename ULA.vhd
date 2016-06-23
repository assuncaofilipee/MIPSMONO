library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is 
	port( 
		c: in std_logic_vector(2 downto 0); 
      A, B: in std_logic_vector(31 downto 0); 
		Zero: out std_logic; 
		Resultado: out std_logic_vector(31 downto 0) 
	); 
end entity;   

architecture behavior of ULA is 
begin
	process(A, B, c) 
		variable ResultadoTemporario: unsigned(31 downto 0);    
   begin 
		case c is 
			when "000" => ResultadoTemporario := unsigned(A) and unsigned(B); 	
			when "001" => ResultadoTemporario := unsigned(A) or unsigned(B); 
			when "010" => ResultadoTemporario := unsigned(A) + unsigned(B); 
			when "110" => ResultadoTemporario := unsigned(A) - unsigned(B); 
			when "111" => 
				if (unsigned(A) < unsigned(B)) then 
					ResultadoTemporario := x"00000001"; 
            else 
					ResultadoTemporario := x"00000000"; 
            end if; 
         when others => ResultadoTemporario := x"00000000"; 
      end case; 
		
      if(ResultadoTemporario = x"00000000") then 
         Zero <= '1'; 
      else 
         Zero <= '0'; 
      end if;     
		Resultado <= std_logic_vector(ResultadoTemporario); 
	end process; 
end architecture; 
