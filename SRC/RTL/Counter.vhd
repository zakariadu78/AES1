LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY Counter IS
  PORT (
    reset_i : IN STD_LOGIC;
    enable_i : IN STD_LOGIC;
    clock_i : IN STD_LOGIC;
    count_o : OUT bit4);
END ENTITY Counter;

ARCHITECTURE Counter_arch OF Counter IS
  SIGNAL counter_s : INTEGER RANGE 0 TO 15; -- 16 possibilités comme count_o sur 4 bits

BEGIN
  P0 : PROCESS (clock_i, reset_i, enable_i)
  BEGIN
    IF (reset_i = '1') THEN
      counter_s <= 10;  -- Si idle, on remet le compteur à 10
    ELSIF (clock_i'event AND clock_i = '1') THEN
      IF (enable_i = '1') THEN
        counter_s <= counter_s - 1; -- On décrémente jusqu'à avoir 0
      END IF;
    END IF;
  END PROCESS P0;

  count_o <= STD_LOGIC_VECTOR(to_unsigned(counter_s, 4)); -- car count_o de type bit4

END ARCHITECTURE Counter_arch;