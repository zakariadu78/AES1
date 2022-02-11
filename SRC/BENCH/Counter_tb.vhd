LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
-- library source;
-- use source.all;

ENTITY Counter_tb IS
END ENTITY Counter_tb;

ARCHITECTURE Counter_tb_arch OF Counter_tb IS
  COMPONENT Counter
    PORT (
      reset_i : IN STD_LOGIC;
      enable_i : IN STD_LOGIC;
      clock_i : IN STD_LOGIC;
      count_o : OUT bit4);
  END COMPONENT;
  SIGNAL reset_s : STD_LOGIC;
  SIGNAL enable_s : STD_LOGIC := '1';
  SIGNAL clock_s : STD_LOGIC := '0';
  SIGNAL count_s : bit4;
BEGIN
  DUT : Counter
  PORT MAP(
    reset_i => reset_s,
    enable_i => enable_s,
    clock_i => clock_s,
    count_o => count_s);
   -- On active plusieurs fois le signal enable pour décrémenter  
  enable_s <= NOT enable_s AFTER 20 ns;
  clock_s <= NOT clock_s AFTER 10 ns;
  -- Process différent pour tester le reset
  P0 : PROCESS
  BEGIN
    reset_s <= '1';
    WAIT FOR 10 ns;
    reset_s <= '0';
    WAIT;
  END PROCESS P0;

END ARCHITECTURE Counter_tb_arch;