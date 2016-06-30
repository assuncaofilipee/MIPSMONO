library ieee; 
use ieee.std_logic_1164.all;  
 
entity MipsMonociclo is 
   port( 
     entradaMips: in std_LOGIC_VECTOR(31 downto 0);
	  enable: in std_LOGIC;
	  saidaMips: out std_LOGIC_VECTOR(31 downto 0)
   ); 
end entity; 
 architecture arch of MipsMonociclo is	 
signal : dvi,dvc,lerMem,memParaReg,escMem,ulaFonte,escReg,zeroUla std_LOGIC;
signal : regDst,ulaOp std_LOGIC_VECTOR(1 downto 0);
signal : saidamux4,saidamux3,saidamux5,saidasomador1,saidasomador2
,resultadoUla,saidaExtSinal,saidajump,saidadeslocador,saidapc,barramentoMI,saidaLido1,saidalido2F std_LOGIC_VECTOR(31 downto 0);
signal : saidaControleUla std_LOGIC_VECTOR(2 downto 0);

 component Memoria 
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;

component pc 
	port (CLK, RST: in std_logic;
			inpt: in std_logic_vector(31 downto 0);
			outp: out std_logic_vector(31 downto 0)
 ); 
 end component;
 
 component Extensao16Para32Bits 
		port( 
         Es_in: in std_logic_vector(15 downto 0); 
         Es_out: out std_logic_vector(31 downto 0) 
		); 
end component;

component deslocador 
	port(
		inpt: in std_logic_vector(31 downto 0);
		outp: out std_logic_vector(31 downto 0)
	);
end component;

component ControleULA 
   port( 
      ALUOp: in std_logic_vector(1 downto 0); 
      Funct: in std_logic_vector(5 downto 0); 
      c: out std_logic_vector(2 downto 0) 
   ); 
end component;

component Controle 
 	port( 
 		Opcode: in std_logic_vector(5 downto 0); 
 		DvI, DvC, LerMem, MemParaReg, EscMem, ULAFonte, RegWrite: out std_logic; 
 		RegDst, ALUOp: out std_logic_vector(1 downto 0) 
 	); 
end component;

component Banco_Registradores 

 Port ( clk : in  STD_LOGIC;
           EscReg : in  STD_LOGIC;--rf_wr
           Reg_a_ser_lido1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reg_a_ser_lido2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reg_a_ser_escrito : in  STD_LOGIC_VECTOR (4 downto 0);
           Dado_de_escrita : in  STD_LOGIC_VECTOR (31 downto 0);
           Dado_lido1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dado_lido2 : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end component; 

component ULA 
	port( 
		c: in std_logic_vector(2 downto 0); 
      A, B: in std_logic_vector(31 downto 0); 
		Zero: out std_logic; 
		Resultado: out std_logic_vector(31 downto 0) 
	); 
end component;   

component Somador 
 	port( 
		A, B: in std_logic_vector(31 downto 0); 
 		Resultado: out std_logic_vector(31 downto 0) 
 	); 
end component; 
 
 component mux 
  generic(WIDTH: natural:=8);
  port(
		a:  in std_logic_vector(WIDTH-1 downto 0);
		b:in std_logic_vector(WIDTH-1 downto 0);
		sel: in std_logic;
		outp: out std_logic_vector(WIDTH-1 downto 0)
  );
  end component;
  
	  component Jump 
   port(
		instrucao: in std_logic_vector(25 downto 0);
		Pc: in std_logic_vector(3 downto 0);
		Resultado: out std_logic_vector(31 downto 0)
	);
end component;
begin
L0: pc port map (enable, reset, saidamux4, saidapc);
L1: somador port map(saidapc, x"00000004", saidasomador1);
L2  somador port map(saidasomador1, saidadeslocador, saidasomador2);
L3: mux port map (saidasomador1, saidasomador2, zeroula and dvc, saidamux3);
L4: mux port map (saidajump, saidamux3, Dvi, saidamux4);
L5: jump port map (barramentoMI(25 downto 0), saidasomador1(31 downto 28), saidajump);
L6: mux port map (barramentoMI(20 downto 16), barramentoMI(15 downto 11), saidamux1);
L7: Banco_Registradores port map (enable, escReg, barramentoMI(25 downto 21), barramentoMI(20 downto 16), saidamux1, saidamux5, saidaLido1, saidaLido2);
L8: mux port map (saidaLido2, saidaExtSinal, ulaFonte, saidamux2);
L9: ula port map (saidaControleUla,  saidaLido1, saidamux2, zeroUla, resultadoUla)
L10: deslocador port map(saidaExtSinal, saidadeslocador);
L11: Extensao16Para32Bits port map (BarramentoMI(15 downto 0),saidaExtSinal);
L12: mux port map(saidaMemDados,resultadoUla,MemParaReg);
L13: memoria port map(resultadoUla,enable,saidaLido2,SaidaMemDados);
L14: controle port map(barramentoMI(31 downto 25),dvi,dvc,lerMem,memParaReg,escMem,ulaFonte,escReg,regDst,ulaOp);
L15: controleula port map(ulaop,barramentoMI(5 downto 0),saidaControleUla);
end architecture;
