LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
-- library source;
-- use source.all;

ENTITY KeyExpansion_table_tb IS
END ENTITY KeyExpansion_table_tb;

ARCHITECTURE KeyExpansion_table_tb_arch OF KeyExpansion_table_tb IS
  COMPONENT KeyExpansion_table
    PORT (
      round_i : IN bit4;
      expansion_key_o : OUT type_key);
  END COMPONENT;
  SIGNAL round_s : bit4;
  SIGNAL expansion_key_s : type_key;
BEGIN
  DUT : KeyExpansion_table
  PORT MAP(
    round_i => round_s,
    expansion_key_o => expansion_key_s);

  P3 : PROCESS
  BEGIN
    round_s <= X"0";
    WAIT FOR 30 ns;
    round_s <= X"6";
    WAIT FOR 30 ns;
    round_s <= X"A";
    WAIT;
  END PROCESS P3;
END ARCHITECTURE KeyExpansion_table_tb_arch;