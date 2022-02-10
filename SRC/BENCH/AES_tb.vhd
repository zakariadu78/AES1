LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY AES_tb IS
END ENTITY AES_tb;

ARCHITECTURE AES_tb_arch OF AES_tb IS
  COMPONENT AES IS
    PORT (
      start_i : IN STD_LOGIC;
      clock_i : IN STD_LOGIC;
      reset_i : IN STD_LOGIC;
      data_i : IN type_state;
      aes_on_o : OUT STD_LOGIC;
      data_o : OUT bit128
      );
  END COMPONENT AES;

  SIGNAL start_s, reset_s, aes_on_s : STD_LOGIC;

  SIGNAL clock_s : STD_LOGIC := '0';
  SIGNAL data_i_s : type_state;
  SIGNAL data_o_s : bit128;

BEGIN
  DUT : AES
  PORT MAP
  (
    start_i => start_s,
    clock_i => clock_s,
    reset_i => reset_s,
    data_i => data_i_s,
    aes_on_o => aes_on_s,
    data_o => data_o_s
  );

  start_s <= '0', '1' AFTER 30 ns;
  clock_s <= NOT clock_s AFTER 10 ns;
  reset_s <= '0';
  data_i_s <= (
    (x"8c", x"06", x"de", x"aa"),
    (x"11", x"ad", x"ca", x"03"),
    (x"35", x"44", x"ec", x"43"),
    (x"44", x"88", x"83", x"06"));

END ARCHITECTURE AES_tb_arch;