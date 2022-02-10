LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY Counter IS
  PORT (
    resetb_i : IN STD_LOGIC;
    enable_i : IN STD_LOGIC;
    clock_i : IN STD_LOGIC;
    count_o : OUT bit4);
END ENTITY Counter;

ARCHITECTURE Counter_arch OF Counter IS
  SIGNAL counter_s : INTEGER RANGE 0 TO 15;
  SIGNAL bool_s : STD_LOGIC := '0';

BEGIN
  P0 : PROCESS (clock_i, resetb_i, enable_i)
  BEGIN
    IF (resetb_i = '1') THEN
      counter_s <= 10;
    ELSIF (clock_i'event AND clock_i = '1') THEN
      bool_s <= NOT bool_s;
      IF bool_s = '0' THEN
        IF (enable_i = '1') THEN
          counter_s <= counter_s - 1;
        END IF;
      END IF;
    END IF;
  END PROCESS P0;

  count_o <= STD_LOGIC_VECTOR(to_unsigned(counter_s, 4));

END ARCHITECTURE Counter_arch;