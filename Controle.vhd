library ieee; 
use ieee.std_logic_1164.all; 

entity Controle is 
 	port( 
 		Opcode: in std_logic_vector(5 downto 0); 
 		DvI, DvC, LerMem, MemParaReg, EscMem, ULAFonte, RegWrite: out std_logic; 
 		RegDst, ALUOp: out std_logic_vector(1 downto 0) 
 	); 
end entity; 

architecture behavior of Controle is 
begin 
	process(Opcode) 
   begin 
      case Opcode is 
			-- tipo R 
			when "000000" => 
				RegDst   <= "01"; 
				DvI     <= '0'; 
				DvC      <= '0'; 
				LerMem  <= '0';    
				MemParaReg <= '0'; 
				EscMem <= '0'; 
				ULAFonte   <= '0'; 
				RegWrite <= '1'; 
				ALUOp    <= "10"; 
              
			-- LW 
			when "100011" => 
				RegDst   <= "00"; 
				DvI     <= '0'; 
				DvC      <= '0'; 
				LerMem  <= '1';    
				MemParaReg <= '1'; 
				EscMem <= '0'; 
				ULAFonte   <= '1'; 
				RegWrite <= '1'; 
				ALUOp    <= "00"; 
              
			-- SW 
			when "101011" => 
				RegDst   <= "00"; 
				DvI     <= '0'; 
				DvC      <= '0'; 
				LerMem  <= '0';    
				MemParaReg <= '0'; 
				EscMem <= '1'; 
				ULAFonte   <= '1'; 
				RegWrite <= '0'; 
				ALUOp    <= "00"; 
               
			-- BEQ 
			when "000100" => 
				RegDst   <= "00"; 
            DvI     <= '0'; 
            DvC      <= '1'; 
            LerMem  <= '0';    
            MemParaReg <= '0'; 
            EscMem <= '0'; 
            ULAFonte   <= '0'; 
            RegWrite <= '0'; 
            ALUOp    <= "01"; 
             
         -- J 
         when "000010" => 
            RegDst   <= "00"; 
            DvI     <= '1'; 
            DvC      <= '0'; 
            LerMem  <= '0';    
            MemParaReg <= '0'; 
            EscMem <= '0'; 
            ULAFonte   <= '0'; 
            RegWrite <= '0'; 
            ALUOp    <= "00"; 
				 
      end case; 
   end process; 
end architecture; 