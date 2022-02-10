LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY MUX IS
  PORT (
    I0_in : IN type_state;
    I1_in : IN type_state;
    S_in : IN STD_LOGIC;
    O_out : OUT type_state);
END ENTITY MUX;

ARCHITECTURE MUX_arch OF MUX IS

BEGIN
  seq0 : PROCESS (S_in, I0_in, I1_in)
  BEGIN
    IF S_in = '1' THEN
    O_out <= I1_in;
    ELSE
    O_out <= I0_in;
    END IF;
  END PROCESS seq0;
END ARCHITECTURE MUX_arch;