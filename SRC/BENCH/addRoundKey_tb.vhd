LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY addRoundKey_tb IS
END ENTITY;

ARCHITECTURE addRoundKey_tb_arch OF addRoundKey_tb IS

  COMPONENT AddRoundKey
    PORT (
      Data_i : IN type_state;
      Key_i : IN type_key;
      Data_o : OUT type_state);
  END COMPONENT;
  SIGNAL Data_i_s : type_state;
  SIGNAL Key_s : type_key;
  SIGNAL Data_o_s : type_state;
BEGIN

  DUT : AddRoundKey
  PORT MAP(
    Data_i => Data_i_s,
    Key_i => Key_s,
    Data_o => Data_o_s
  );

  Data_i_s <= (
    (x"41", x"73", x"2d", x"74"),
    (x"75", x"20", x"6c", x"61"),
    (x"20", x"43", x"4f", x"56"),
    (x"49", x"44", x"20", x"3f")
    );

  Key_s <= (
    (x"2b", x"7e", x"15", x"16"),
    (x"28", x"ae", x"d2", x"a6"),
    (x"ab", x"f7", x"15", x"88"),
    (x"09", x"cf", x"4f", x"3c")
    );

END ARCHITECTURE;