LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY SubBytes_tb IS
END ENTITY SubBytes_tb;
ARCHITECTURE SubBytes_tb_arch OF SubBytes_tb IS
  COMPONENT SubBytes
    PORT (
      data_i : IN type_state;
      data_o : OUT type_state
    );
  END COMPONENT;

  SIGNAL data_i_s : type_state;
  SIGNAL data_o_s : type_state;
BEGIN
  DUT : SubBytes
  PORT MAP
  (
    data_i => data_i_s,
    data_o => data_o_s
  );

  data_i_s <= ((X"00", X"01", X"02", X"03"),
    (X"10", X"11", X"12", X"13"),
    (X"20", X"21", X"22", X"23"),
    (X"30", X"31", X"32", X"33"));

END ARCHITECTURE SubBytes_tb_arch;

CONFIGURATION SubBytes_tb_conf OF SubBytes_tb IS
  FOR SubBytes_tb_arch
    FOR DUT : SubBytes
      USE ENTITY LIB_RTL.SubBytes(SubBytes_arch);
    END FOR;
  END FOR;
END SubBytes_tb_conf;