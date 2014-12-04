----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:17 12/02/2014 
-- Design Name: 
-- Module Name:    Contador_8b - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador_8b is
    Port ( CLK :	  in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           UP : 	  in  STD_LOGIC;
           DOWN :   in  STD_LOGIC;
           LOAD :   in  STD_LOGIC;
           RESET :  in  STD_LOGIC;
           OVF :    out  STD_LOGIC;
			  A   :    in  STD_LOGIC_VECTOR(7 downto 0);
			  B   :    out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end Contador_8b;

architecture STRUCTURAL of Contador_8b is

	component Contador_4b
		Port ( UP : in  STD_LOGIC;
           DOWN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           B0 : out  STD_LOGIC;
           B1 : out  STD_LOGIC;
           B2 : out  STD_LOGIC;
           B3 : out  STD_LOGIC;
           Q : out  STD_LOGIC;
			  Q_N: out STD_LOGIC
		);
	end component;
	
	component FFJK
		port(
			J : in  STD_LOGIC;
         K : in  STD_LOGIC;
         CLK : in  STD_LOGIC;
         LOAD : in  STD_LOGIC;
         RESET : in  STD_LOGIC;
         PRE_CARGA : in  STD_LOGIC;
         Q : out  STD_LOGIC;
         Q_N : out  STD_LOGIC
		);
	end component;
	
	component FFSR
		port(
			S : in  STD_LOGIC;
         R : in  STD_LOGIC;
         CLK : in  STD_LOGIC;
         Q : out  STD_LOGIC;
         Q_N : out  STD_LOGIC
		);
	end component;
	
	component AND2
		port(
			I0 : in  STD_LOGIC;
         I1 : in  STD_LOGIC;
         O : out  STD_LOGIC
		);
	end component;
	
	component AND3
		Port ( 
			I0 : in  STD_LOGIC;
         I1 : in  STD_LOGIC;
         I2 : in  STD_LOGIC;
          O : out  STD_LOGIC
		);
	end component;
	
	component OR2
		Port ( 
			I0 : in  STD_LOGIC;
         I1 : in  STD_LOGIC;
         O : out  STD_LOGIC
		);
	end component;
	
	component INV
		Port ( 
			I : in  STD_LOGIC;
         O : out  STD_LOGIC
		);
	end component;
	
	signal COUNT,COUNT2,R1,S2,Q1,QN1,Q2,QN2,CS0,CSN0,CS1,CSN1,OVF1,OVF2,RN,OVF3,UP_N: STD_LOGIC;
	signal HIGH : STD_LOGIC:='1';
begin
	L1: AND2 port map(CLK,ENABLE,COUNT);
	L2: INV port map(UP,UP_N);
	L3: AND2 port map(UP_N,DOWN,R1);
	L4: FFSR port map(UP,R1,HIGH,Q1,QN1);
	L5: Contador_4b port map(Q1,QN1,COUNT,LOAD,A(0),A(1),A(2),A(3),RESET,B(0),B(1),B(2),B(3),CS0,CSN0);
	L6: AND2 port map(COUNT,CS0,COUNT2);
	L7: Contador_4b port map(Q1,QN1,COUNT2,LOAD,A(4),A(5),A(6),A(7),RESET,B(4),B(5),B(6),B(7),CS1,CSN1);
	L8: AND3 port map(Q1,Q2,UP,OVF1);
	L9: AND3 port map(QN1,QN2,DOWN,OVF2);
	L10:OR2  port map(OVF1,OVF2,OVF3);
	L11:INV  port map(RESET,RN);
	L12:AND2 port map(OVF3,RN,S2);
	L13:FFSR port map(S2,RESET,HIGH,Q2,QN2);
	
	OVF <= Q2;
	

end STRUCTURAL;