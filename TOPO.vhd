library ieee; 
use ieee.std_logic_1164.all;  
 
entity TOPO is 
   port( 
      KEY(0); in std_LOGIC; -- reset
		KEY(1); is std_LOGIC  --clock
   ); 
end entity; 
 architecture arch of TOPO is	 
signal saidapc : std_logic_vector(31 downto 0);
signal saidasomardor: std_logic_vector(31 downto 0);
signal saidadeslocador : std_logic_vector(31 downto 0);

 component Memoria 
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
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
		instrucao: std_logic_vector(25 downto 0);
		Pc: in std_logic_vector(3 downto 0);
		Resultado: out std_logic_vector(31 downto 0)
	);
end component;
begin
L0: pc port map (KEY(1), KEY(0), ENTRADA PC !!!NAO SEI!!!, saidapc);
L1: memoria port map(NAI SEI);
L2: somador port map(saidapc, saidasomador); --entra 32 bits soma com 4 e sai 32
L3: deslocador port map(entrada nao sei, saidadeslocador);
L4: 
L5:
L6:
L7:
L8:
L9:
end architecture;