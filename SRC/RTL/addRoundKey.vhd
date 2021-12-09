library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;
library LIB_RTL;

entity AddRoundKey is
port (
Data_i : in type_state;
Key_i : in type_key;
Data_o : out type_state);
end AddRoundKey;

architecture AddRoundKey_arch of AddRoundKey is

begin

Data_o(0)(0) <= Data_i(0)(0) xor Key_i(0)(0);
Data_o(0)(1) <= Data_i(0)(1) xor Key_i(0)(1);
Data_o(0)(2) <= Data_i(0)(2) xor Key_i(0)(2);
Data_o(0)(3) <= Data_i(0)(3) xor Key_i(0)(3);
Data_o(1)(0) <= Data_i(1)(0) xor Key_i(1)(0);
Data_o(1)(1) <= Data_i(1)(1) xor Key_i(1)(1);
Data_o(1)(2) <= Data_i(1)(2) xor Key_i(1)(2);
Data_o(1)(3) <= Data_i(1)(3) xor Key_i(1)(3);
Data_o(2)(0) <= Data_i(2)(0) xor Key_i(2)(0);
Data_o(2)(1) <= Data_i(2)(1) xor Key_i(2)(1);
Data_o(2)(2) <= Data_i(2)(2) xor Key_i(2)(2);
Data_o(2)(3) <= Data_i(2)(3) xor Key_i(2)(3);
Data_o(3)(0) <= Data_i(3)(0) xor Key_i(3)(0);
Data_o(3)(1) <= Data_i(3)(1) xor Key_i(3)(1);
Data_o(3)(2) <= Data_i(3)(2) xor Key_i(3)(2);
Data_o(3)(3) <= Data_i(3)(3) xor Key_i(3)(3);

end AddRoundKey_arch;
