LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY Shiftrows IS
  PORT (
    Data_i : IN type_state;
    Data_o : OUT type_state
  );
END ENTITY;
ARCHITECTURE Shiftrows_arch OF Shiftrows IS

BEGIN

  Data_o(0)(0) <= Data_i(0)(0);
  Data_o(0)(1) <= Data_i(0)(1);
  Data_o(0)(2) <= Data_i(0)(2);
  Data_o(0)(3) <= Data_i(0)(3);

  Data_o(1)(0) <= Data_i(1)(3);
  Data_o(1)(1) <= Data_i(1)(0);
  Data_o(1)(2) <= Data_i(1)(1);
  Data_o(1)(3) <= Data_i(1)(2);

  Data_o(2)(0) <= Data_i(2)(2);
  Data_o(2)(1) <= Data_i(2)(3);
  Data_o(2)(2) <= Data_i(2)(0);
  Data_o(2)(3) <= Data_i(2)(1);

  Data_o(3)(0) <= Data_i(3)(1);
  Data_o(3)(1) <= Data_i(3)(2);
  Data_o(3)(2) <= Data_i(3)(3);
  Data_o(3)(3) <= Data_i(3)(0);

END ARCHITECTURE;