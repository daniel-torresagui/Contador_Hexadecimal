----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:13 12/02/2014 
-- Design Name: 
-- Module Name:    FFSR - Behavioral 
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

entity FFSR is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
			  CLK:in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Q_N : out  STD_LOGIC);
end FFSR;

architecture Behavioral of FFSR is
	signal Y : STD_LOGIC;
begin
	process(CLK)
		begin
		if clk'event and clk = '1' THEN 
			if S = '1' then Y <= '1';
			elsif R = '1' then Y <= '0';
			else Y <= Y;
			end if;
		end if;
	end process;
	
	Q <= Y;
	Q_N <= NOT Y;
end Behavioral;

