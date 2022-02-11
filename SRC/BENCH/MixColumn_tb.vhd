LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY MixColumn_tb IS
END ENTITY MixColumn_tb;
ARCHITECTURE MixColumn_tb_arch OF MixColumn_tb IS
  COMPONENT MixColumn
    PORT (
      data_i : IN type_state;
      data_o : OUT type_state;
      enablemc_i : IN STD_LOGIC);
  END COMPONENT;

  SIGNAL enablemc_i_s : STD_LOGIC;
  SIGNAL data_i_s, data_o_s : type_state;

BEGIN
  DUT : MixColumn
  PORT MAP
  (
    data_i => data_i_s,
    data_o => data_o_s,
    enablemc_i => enablemc_i_s
  );

  enablemc_i_s <= '1';
  data_i_s <= (
    -- Test pour la round 1
    (X"12", X"FD", X"89", X"2C"),
    (X"90", X"BB", X"E2", X"FD"),
    (X"56", X"A1", X"BF", X"8A"),
    (X"F9", X"01", X"93", X"1C"));
END ARCHITECTURE MixColumn_tb_arch;

CONFIGURATION MixColumn_tb_conf OF MixColumn_tb IS
  FOR MixColumn_tb_arch
    FOR DUT : MixColumn
      USE ENTITY LIB_RTL.MixColumn(MixColumn_arch);
    END FOR;
  END FOR;
END MixColumn_tb_conf;