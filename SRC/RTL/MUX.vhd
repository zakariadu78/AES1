LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY MUX IS
  PORT (
    I0_i : IN type_state;
    I1_i : IN type_state;
    S_i : IN STD_LOGIC;
    O_o : OUT type_state);
END ENTITY MUX;

ARCHITECTURE MUX_arch OF MUX IS

BEGIN
  seq0 : PROCESS (S_i, I0_i, I1_i)
  BEGIN
    IF S_i = '1' THEN
      O_o <= I1_i;
    ELSE
      O_o <= I0_i;
    END IF;
  END PROCESS seq0;
END ARCHITECTURE MUX_arch;