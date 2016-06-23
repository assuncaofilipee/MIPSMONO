
library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Banco_Registradores is

 Port ( clk : in  STD_LOGIC;
           EscReg : in  STD_LOGIC;--rf_wr
           Reg_a_ser_lido1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reg_a_ser_lido2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reg_a_ser_escrito : in  STD_LOGIC_VECTOR (4 downto 0);
           Dado_de_escrita : in  STD_LOGIC_VECTOR (31 downto 0);
           Dado_lido1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dado_lido2 : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end Banco_Registradores;

architecture arch of Banco_Registradores is

type rom is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);

signal memoria: rom := (
			x"00000000",
			x"00000001",
			x"00000002",
			x"00000003",
			x"00000004",
			x"00000005",
			x"00000006",
			x"00000007",
			x"00000008",
			x"00000009",
			x"0000000A",
			x"0000000B",
			x"0000000C",
			x"0000000D",
			x"0000000E",
			x"0000000F",
			x"0000000F",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			x"00000001",
			others=>X"00000000"
			);
begin
	Dado_lido1 <= memoria(conv_integer(Reg_a_ser_lido1)) ;
	Dado_lido2 <= memoria(conv_integer (Reg_a_ser_lido2)) ;

	process (clk)
	begin
		if (rising_edge (clk)) then 
			if EscReg = '1' and Reg_a_ser_escrito /= "00000" then  
				memoria(conv_integer (Reg_a_ser_escrito)) <= Dado_de_escrita ;
			end if;
		end if;
	end process;
end arch;