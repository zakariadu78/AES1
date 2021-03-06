LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY inv_ShiftRows_tb IS
END ENTITY inv_ShiftRows_tb;
ARCHITECTURE inv_ShiftRows_tb_arch OF inv_ShiftRows_tb IS
  COMPONENT inv_ShiftRows
    PORT (
      Data_i : IN type_state;
      Data_o : OUT type_state
    );
  END COMPONENT;

  SIGNAL data_i_s : type_state;
  SIGNAL data_o_s : type_state;
BEGIN
  DUT : inv_ShiftRows
  PORT MAP
  (
    Data_i => data_i_s,
    Data_o => data_o_s
  );
  -- Test pour une matrice simple
  data_i_s <= ((X"00", X"01", X"02", X"03"),
    (X"10", X"11", X"12", X"13"),
    (X"20", X"21", X"22", X"23"),
    (X"30", X"31", X"32", X"33"));
END ARCHITECTURE inv_ShiftRows_tb_arch;