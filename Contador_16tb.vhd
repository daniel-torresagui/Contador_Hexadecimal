--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:12:11 12/02/2014
-- Design Name:   
-- Module Name:   C:/Users/daniel/Dropbox/Universidad/Semestre 7/Sis. digitales/laboratorio/Contador_Hexadecimal/Contador_16tb.vhd
-- Project Name:  Contador_Hexadecimal
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Contador_8b
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Contador_16tb IS
END Contador_16tb;
 
ARCHITECTURE behavior OF Contador_16tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Contador_8b
    PORT(
         CLK : IN  std_logic;
         ENABLE : IN  std_logic;
         UP : IN  std_logic;
         DOWN : IN  std_logic;
         LOAD : IN  std_logic;
         RESET : IN  std_logic;
         OVF : OUT  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal UP : std_logic := '0';
   signal DOWN : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal RESET : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal OVF : std_logic;
   signal B : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Contador_8b PORT MAP (
          CLK => CLK,
          ENABLE => ENABLE,
          UP => UP,
          DOWN => DOWN,
          LOAD => LOAD,
          RESET => RESET,
          OVF => OVF,
          A => A,
          B => B
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		UP <= '1';
		wait for 20 ns;
		UP <= '0';
		ENABLE <='1';
		wait for 150 ns;
		RESET <='1';
		wait for 2 ns;
		RESET <='0';
		wait for 20 ns;
		A <= "11001010";
		wait for 10 ns;
		LOAD <= '1';
		wait for 10 ns;
		LOAD <= '0';
		DOWN <= '1';
		wait for 10 ns;
		DOWN <= '0';
		wait for 30 ns;
		RESET <= '1';
		wait for 2 ns;
		RESET <= '0';
		wait for 40 ns;
		RESET <= '1';
		UP <= '1';
		wait for 2 ns;
		RESET <= '0';
		A <= "11111111";
		wait for 30 ns;
		LOAD <= '1';
		wait for 2 ns;
		LOAD <= '0';
		wait for 30 ns;
		
		
      wait;
   end process;

END;
