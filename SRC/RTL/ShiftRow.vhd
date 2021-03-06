LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY inv_Shiftrows IS
  PORT (
    Data_i : IN type_state;
    Data_o : OUT type_state
  );
END ENTITY;
ARCHITECTURE inv_Shiftrows_arch OF inv_Shiftrows IS

BEGIN
  -- Pas de décallage
  Data_o(0)(0) <= Data_i(0)(0);
  Data_o(0)(1) <= Data_i(0)(1);
  Data_o(0)(2) <= Data_i(0)(2);
  Data_o(0)(3) <= Data_i(0)(3);
  -- Décallage de 1
  Data_o(1)(0) <= Data_i(1)(3);
  Data_o(1)(1) <= Data_i(1)(0);
  Data_o(1)(2) <= Data_i(1)(1);
  Data_o(1)(3) <= Data_i(1)(2);
  -- Décallage de 2
  Data_o(2)(0) <= Data_i(2)(2);
  Data_o(2)(1) <= Data_i(2)(3);
  Data_o(2)(2) <= Data_i(2)(0);
  Data_o(2)(3) <= Data_i(2)(1);
  -- Décallage de 3
  Data_o(3)(0) <= Data_i(3)(1);
  Data_o(3)(1) <= Data_i(3)(2);
  Data_o(3)(2) <= Data_i(3)(3);
  Data_o(3)(3) <= Data_i(3)(0);

END ARCHITECTURE;