LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY ShiftRows_tb IS
END ENTITY ShiftRows_tb;
ARCHITECTURE ShiftRows_tb_arch OF ShiftRows_tb IS
  COMPONENT ShiftRows
    PORT (
      Data_i : IN type_state;
      Data_o : OUT type_state
    );
  END COMPONENT;

  SIGNAL data_i_s : type_state;
  SIGNAL data_o_s : type_state;
BEGIN
  DUT : ShiftRows
  PORT MAP
  (
    Data_i => data_i_s,
    Data_o => data_o_s
  );

  data_i_s <= ((X"00", X"01", X"02", X"03"),
    (X"10", X"11", X"12", X"13"),
    (X"20", X"21", X"22", X"23"),
    (X"30", X"31", X"32", X"33"));
END ARCHITECTURE ShiftRows_tb_arch;