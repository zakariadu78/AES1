LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY stateToBit128 IS
    PORT (
        entree_i : IN type_state;
        sortie_o : OUT bit128
    );
END stateToBit128;

ARCHITECTURE stateToBit128_arch OF stateToBit128 IS
BEGIN
    G : FOR i IN 0 TO 15 GENERATE
        sortie_o((127 - i * 8) DOWNTO (120 - i * 8)) <= entree_i(i MOD 4)(i/4); -- Permet la transformation d'un typestate à un bit128 pour le data_o final de l'aes global
    END GENERATE;
END ARCHITECTURE stateToBit128_arch;