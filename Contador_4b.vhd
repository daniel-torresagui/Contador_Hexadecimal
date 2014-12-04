----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:25 12/02/2014 
-- Design Name: 
-- Module Name:    Contador_4b - Behavioral 
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

entity Contador_4b is
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
			  Q_N: out STD_LOGIC);
end Contador_4b;

architecture structural of Contador_4b is
	
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
	
	component AND2
		port(
			I0 : in  STD_LOGIC;
         I1 : in  STD_LOGIC;
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
	
	signal UP_N,UND,T0,T1,T2,T3,QN0,Q0,QN1,Q1,QN2,Q2,QN3,Q3,S1,S2,S3,L1,L2,L3,C1,C2,C3,CN1,CN2,CN3: STD_LOGIC;
	
begin
	D1: INV  port map(UP,UP_N);
	D2: AND2 port map(UP_N,DOWN,UND);
	D3: OR2  port map(UP,UND,T0);
	D4: AND2 port map(UND,QN0,S1);
	D5: AND2 port map(UP,Q0,L1);
	D6: OR2  port map(S1,L1,T1);
	D7: AND2 port map(S1,QN1,S2);
	D8: AND2 port map(L1,Q1,L2);
	D9: OR2  port map(L2,S2,T2);
	D10: AND2 port map(S2,QN2,S3);
	D11:AND2 port map(L2,Q2,L3);
	D12:OR2  port map(L3,S3,T3);
	FF1: FFJK port map(T0,T0,CLK,LOAD,RESET,A0,Q0,QN0);
	FF2: FFJK port map(T1,T1,CLK,LOAD,RESET,A1,Q1,QN1);
	FF3: FFJK port map(T2,T2,CLK,LOAD,RESET,A2,Q2,QN2);
	FF4: FFJK port map(T3,T3,CLK,LOAD,RESET,A3,Q3,QN3);
	D13:AND2 port map(Q0,Q1,C1);
	D14:AND2 port map(Q2,Q3,C2);
	D15:AND2 port map(C1,C2,C3);
	D16:AND2 port map(QN0,QN1,CN1);
	D17:AND2 port map(QN2,QN3,CN2);
	D18:AND2 port map(CN1,CN2,CN3);
	
	B0 <= Q0;
	B1 <= Q1;
	B2 <= Q2;
	B3 <= Q3;
	Q  <= C3;
	Q_N<= CN3;
end structural;