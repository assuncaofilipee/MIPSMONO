library ieee; 
use ieee.std_logic_1164.all;  
 
entity ControleULA is 
   port( 
      ALUOp: in std_logic_vector(1 downto 0); 
      Funct: in std_logic_vector(5 downto 0); 
      c: out std_logic_vector(2 downto 0) 
   ); 
end entity; 
 
architecture behavior of ControleULA is	 
begin 
   process(ALUOp, Funct) 
		begin 
  
         case ALUOp is 
            -- LW, SW 
            when "00"   => c <= "010"; 
            -- BEQ 
            when "01"   => c <= "110"; 
            -- tipo R 
            when "10" => 
               case Funct(3 downto 0) is 
						-- ADD 
						when "0000" => c <= "010"; 
						-- SUB 
						when "0010" => c <= "110"; 
						-- AND 
						when "0100" => c <= "000"; 
						-- OR 
						when "0101" => c <= "001"; 
						-- Slt 
						when "1010" => c <= "111"; 
					end case; 
      end case; 
	end process; 
 end behavior; 
