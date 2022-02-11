LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY AddRoundKey IS
    PORT (
        Data_i : IN type_state;
        Key_i : IN type_key;
        Data_o : OUT type_state);
END AddRoundKey;

ARCHITECTURE AddRoundKey_arch OF AddRoundKey IS

BEGIN -- XOR data et clé pour chaque octet
    Data_o(0)(0) <= Data_i(0)(0) XOR Key_i(0)(0);
    Data_o(0)(1) <= Data_i(0)(1) XOR Key_i(0)(1);
    Data_o(0)(2) <= Data_i(0)(2) XOR Key_i(0)(2);
    Data_o(0)(3) <= Data_i(0)(3) XOR Key_i(0)(3);
    Data_o(1)(0) <= Data_i(1)(0) XOR Key_i(1)(0);
    Data_o(1)(1) <= Data_i(1)(1) XOR Key_i(1)(1);
    Data_o(1)(2) <= Data_i(1)(2) XOR Key_i(1)(2);
    Data_o(1)(3) <= Data_i(1)(3) XOR Key_i(1)(3);
    Data_o(2)(0) <= Data_i(2)(0) XOR Key_i(2)(0);
    Data_o(2)(1) <= Data_i(2)(1) XOR Key_i(2)(1);
    Data_o(2)(2) <= Data_i(2)(2) XOR Key_i(2)(2);
    Data_o(2)(3) <= Data_i(2)(3) XOR Key_i(2)(3);
    Data_o(3)(0) <= Data_i(3)(0) XOR Key_i(3)(0);
    Data_o(3)(1) <= Data_i(3)(1) XOR Key_i(3)(1);
    Data_o(3)(2) <= Data_i(3)(2) XOR Key_i(3)(2);
    Data_o(3)(3) <= Data_i(3)(3) XOR Key_i(3)(3);

END AddRoundKey_arch;