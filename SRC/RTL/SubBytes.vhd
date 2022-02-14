LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY inv_SubBytes IS
  PORT (
    data_i : IN type_state;
    data_o : OUT type_state
  );
END inv_SubBytes;

ARCHITECTURE inv_SubBytes_arch OF inv_SubBytes IS

  COMPONENT Sbox_inv
    PORT (
      data_i : IN bit8;
      data_o : OUT bit8
    );
  END COMPONENT;

  SIGNAL temp : bit8;

BEGIN

  temp <= data_i(0)(0);

  -- On applique Sbox pour tout les éléments de notre matrice d'entrée
  loopi : FOR i IN 0 TO 3 GENERATE
    loopj : FOR j IN 0 TO 3 GENERATE
      SBOX : Sbox_inv PORT MAP(
        data_i => data_i(i)(j),
        data_o => data_o(i)(j)
      );
    END GENERATE;
  END GENERATE;

END inv_SubBytes_arch;

CONFIGURATION inv_SubBytes_conf OF inv_SubBytes IS
  FOR inv_SubBytes_arch
    FOR loopi
      FOR loopj
        FOR ALL : Sbox_inv
          USE ENTITY lib_rtl.Sbox_Inv(Sbox_inv_arch);
        END FOR;
      END FOR;
    END FOR;
  END FOR;
END inv_SubBytes_conf;