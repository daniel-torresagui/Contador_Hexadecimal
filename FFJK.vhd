----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:09 12/02/2014 
-- Design Name: 
-- Module Name:    FFJK - Behavioral 
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

entity FFJK is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           PRE_CARGA : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Q_N : out  STD_LOGIC);
end FFJK;

architecture Behavioral of FFJK is
	signal Y: std_Logic;
begin	
	contar: process(CLK,LOAD,RESET)
		begin
		if RESET='1' then Y <= '0';
		elsif LOAD = '1' then Y <= PRE_CARGA;
		elsif CLK = '1' and CLK'event then
			if J='0' and K='0' then Y <= Y;
			elsif J='1' and K='0' then Y <= '1';
			elsif J='0' and K='1' then Y <= '0';
			elsif J='1' and K='1' then Y <= not Y;
			end if;
		end if;
	end process;
	
	Q <= Y;
	Q_N <= not Y;

end Behavioral;

