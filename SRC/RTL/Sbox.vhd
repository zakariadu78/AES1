LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY Sbox_Inv IS
    PORT (
        data_i : IN bit8;
        data_o : OUT bit8
    );
END ENTITY;
ARCHITECTURE Sbox_inv_arch OF Sbox_inv IS
BEGIN
    -- On suit le tableau de la norme
    data_o <=
        x"63" WHEN data_i = x"00" ELSE
        x"7C" WHEN data_i = x"01" ELSE
        x"77" WHEN data_i = x"02" ELSE
        x"7B" WHEN data_i = x"03" ELSE
        x"F2" WHEN data_i = x"04" ELSE
        x"6B" WHEN data_i = x"05" ELSE
        x"6F" WHEN data_i = x"06" ELSE
        x"C5" WHEN data_i = x"07" ELSE
        x"30" WHEN data_i = x"08" ELSE
        x"01" WHEN data_i = x"09" ELSE
        x"67" WHEN data_i = x"0A" ELSE
        x"2B" WHEN data_i = x"0B" ELSE
        x"FE" WHEN data_i = x"0C" ELSE
        x"D7" WHEN data_i = x"0D" ELSE
        x"AB" WHEN data_i = x"0E" ELSE
        x"76" WHEN data_i = x"0F" ELSE

        x"CA" WHEN data_i = x"10" ELSE
        x"82" WHEN data_i = x"11" ELSE
        x"C9" WHEN data_i = x"12" ELSE
        x"7D" WHEN data_i = x"13" ELSE
        x"FA" WHEN data_i = x"14" ELSE
        x"59" WHEN data_i = x"15" ELSE
        x"47" WHEN data_i = x"16" ELSE
        x"F0" WHEN data_i = x"17" ELSE
        x"AD" WHEN data_i = x"18" ELSE
        x"D4" WHEN data_i = x"19" ELSE
        x"A2" WHEN data_i = x"1A" ELSE
        x"AF" WHEN data_i = x"1B" ELSE
        x"9C" WHEN data_i = x"1C" ELSE
        x"A4" WHEN data_i = x"1D" ELSE
        x"72" WHEN data_i = x"1E" ELSE
        x"C0" WHEN data_i = x"1F" ELSE

        x"B7" WHEN data_i = x"20" ELSE
        x"FD" WHEN data_i = x"21" ELSE
        x"93" WHEN data_i = x"22" ELSE
        x"26" WHEN data_i = x"23" ELSE
        x"36" WHEN data_i = x"24" ELSE
        x"3F" WHEN data_i = x"25" ELSE
        x"F7" WHEN data_i = x"26" ELSE
        x"CC" WHEN data_i = x"27" ELSE
        x"34" WHEN data_i = x"28" ELSE
        x"A5" WHEN data_i = x"29" ELSE
        x"E5" WHEN data_i = x"2A" ELSE
        x"F1" WHEN data_i = x"2B" ELSE
        x"71" WHEN data_i = x"2C" ELSE
        x"D8" WHEN data_i = x"2D" ELSE
        x"31" WHEN data_i = x"2E" ELSE
        x"15" WHEN data_i = x"2F" ELSE

        x"04" WHEN data_i = x"30" ELSE
        x"C7" WHEN data_i = x"31" ELSE
        x"23" WHEN data_i = x"32" ELSE
        x"C3" WHEN data_i = x"33" ELSE
        x"18" WHEN data_i = x"34" ELSE
        x"96" WHEN data_i = x"35" ELSE
        x"05" WHEN data_i = x"36" ELSE
        x"9A" WHEN data_i = x"37" ELSE
        x"07" WHEN data_i = x"38" ELSE
        x"12" WHEN data_i = x"39" ELSE
        x"80" WHEN data_i = x"3A" ELSE
        x"E2" WHEN data_i = x"3B" ELSE
        x"EB" WHEN data_i = x"3C" ELSE
        x"27" WHEN data_i = x"3D" ELSE
        x"B2" WHEN data_i = x"3E" ELSE
        x"75" WHEN data_i = x"3F" ELSE

        x"09" WHEN data_i = x"40" ELSE
        x"83" WHEN data_i = x"41" ELSE
        x"EC" WHEN data_i = x"42" ELSE
        x"1A" WHEN data_i = x"43" ELSE
        x"1B" WHEN data_i = x"44" ELSE
        x"6E" WHEN data_i = x"45" ELSE
        x"5A" WHEN data_i = x"46" ELSE
        x"A0" WHEN data_i = x"47" ELSE
        x"52" WHEN data_i = x"48" ELSE
        x"3B" WHEN data_i = x"49" ELSE
        x"D6" WHEN data_i = x"4A" ELSE
        x"B3" WHEN data_i = x"4B" ELSE
        x"29" WHEN data_i = x"4C" ELSE
        x"E3" WHEN data_i = x"4D" ELSE
        x"2F" WHEN data_i = x"4E" ELSE
        x"84" WHEN data_i = x"4F" ELSE

        x"53" WHEN data_i = x"50" ELSE
        x"D1" WHEN data_i = x"51" ELSE
        x"00" WHEN data_i = x"52" ELSE
        x"ED" WHEN data_i = x"53" ELSE
        x"20" WHEN data_i = x"54" ELSE
        x"FC" WHEN data_i = x"55" ELSE
        x"B1" WHEN data_i = x"56" ELSE
        x"5B" WHEN data_i = x"57" ELSE
        x"6A" WHEN data_i = x"58" ELSE
        x"CB" WHEN data_i = x"59" ELSE
        x"BE" WHEN data_i = x"5A" ELSE
        x"39" WHEN data_i = x"5B" ELSE
        x"4A" WHEN data_i = x"5C" ELSE
        x"4C" WHEN data_i = x"5D" ELSE
        x"58" WHEN data_i = x"5E" ELSE
        x"CF" WHEN data_i = x"5F" ELSE

        x"D0" WHEN data_i = x"60" ELSE
        x"EF" WHEN data_i = x"61" ELSE
        x"AA" WHEN data_i = x"62" ELSE
        x"FB" WHEN data_i = x"63" ELSE
        x"43" WHEN data_i = x"64" ELSE
        x"4D" WHEN data_i = x"65" ELSE
        x"33" WHEN data_i = x"66" ELSE
        x"85" WHEN data_i = x"67" ELSE
        x"45" WHEN data_i = x"68" ELSE
        x"F9" WHEN data_i = x"69" ELSE
        x"02" WHEN data_i = x"6A" ELSE
        x"7F" WHEN data_i = x"6B" ELSE
        x"50" WHEN data_i = x"6C" ELSE
        x"3C" WHEN data_i = x"6D" ELSE
        x"9F" WHEN data_i = x"6E" ELSE
        x"A8" WHEN data_i = x"6F" ELSE

        x"51" WHEN data_i = x"70" ELSE
        x"A3" WHEN data_i = x"71" ELSE
        x"40" WHEN data_i = x"72" ELSE
        x"8F" WHEN data_i = x"73" ELSE
        x"92" WHEN data_i = x"74" ELSE
        x"9D" WHEN data_i = x"75" ELSE
        x"38" WHEN data_i = x"76" ELSE
        x"F5" WHEN data_i = x"77" ELSE
        x"BC" WHEN data_i = x"78" ELSE
        x"B6" WHEN data_i = x"79" ELSE
        x"DA" WHEN data_i = x"7A" ELSE
        x"21" WHEN data_i = x"7B" ELSE
        x"10" WHEN data_i = x"7C" ELSE
        x"FF" WHEN data_i = x"7D" ELSE
        x"F3" WHEN data_i = x"7E" ELSE
        x"D2" WHEN data_i = x"7F" ELSE

        x"CD" WHEN data_i = x"80" ELSE
        x"0C" WHEN data_i = x"81" ELSE
        x"13" WHEN data_i = x"82" ELSE
        x"EC" WHEN data_i = x"83" ELSE
        x"5F" WHEN data_i = x"84" ELSE
        x"97" WHEN data_i = x"85" ELSE
        x"44" WHEN data_i = x"86" ELSE
        x"17" WHEN data_i = x"87" ELSE
        x"C4" WHEN data_i = x"88" ELSE
        x"A7" WHEN data_i = x"89" ELSE
        x"7E" WHEN data_i = x"8A" ELSE
        x"3D" WHEN data_i = x"8B" ELSE
        x"64" WHEN data_i = x"8C" ELSE
        x"5D" WHEN data_i = x"8D" ELSE
        x"19" WHEN data_i = x"8E" ELSE
        x"73" WHEN data_i = x"8F" ELSE

        x"60" WHEN data_i = x"90" ELSE
        x"81" WHEN data_i = x"91" ELSE
        x"4F" WHEN data_i = x"92" ELSE
        x"DC" WHEN data_i = x"93" ELSE
        x"22" WHEN data_i = x"94" ELSE
        x"2A" WHEN data_i = x"95" ELSE
        x"90" WHEN data_i = x"96" ELSE
        x"88" WHEN data_i = x"97" ELSE
        x"46" WHEN data_i = x"98" ELSE
        x"EE" WHEN data_i = x"99" ELSE
        x"B8" WHEN data_i = x"9A" ELSE
        x"14" WHEN data_i = x"9B" ELSE
        x"DE" WHEN data_i = x"9C" ELSE
        x"5E" WHEN data_i = x"9D" ELSE
        x"0B" WHEN data_i = x"9E" ELSE
        x"DB" WHEN data_i = x"9F" ELSE

        x"E0" WHEN data_i = x"A0" ELSE
        x"32" WHEN data_i = x"A1" ELSE
        x"3A" WHEN data_i = x"A2" ELSE
        x"0A" WHEN data_i = x"A3" ELSE
        x"40" WHEN data_i = x"A4" ELSE
        x"06" WHEN data_i = x"A5" ELSE
        x"24" WHEN data_i = x"A6" ELSE
        x"5C" WHEN data_i = x"A7" ELSE
        x"C2" WHEN data_i = x"A8" ELSE
        x"D3" WHEN data_i = x"A9" ELSE
        x"AC" WHEN data_i = x"AA" ELSE
        x"62" WHEN data_i = x"AB" ELSE
        x"91" WHEN data_i = x"AC" ELSE
        x"95" WHEN data_i = x"AD" ELSE
        x"E4" WHEN data_i = x"AE" ELSE
        x"79" WHEN data_i = x"AF" ELSE

        x"E7" WHEN data_i = x"B0" ELSE
        x"C8" WHEN data_i = x"B1" ELSE
        x"37" WHEN data_i = x"B2" ELSE
        x"6D" WHEN data_i = x"B3" ELSE
        x"8D" WHEN data_i = x"B4" ELSE
        x"D5" WHEN data_i = x"B5" ELSE
        x"4E" WHEN data_i = x"B6" ELSE
        x"A9" WHEN data_i = x"B7" ELSE
        x"6C" WHEN data_i = x"B8" ELSE
        x"56" WHEN data_i = x"B9" ELSE
        x"F4" WHEN data_i = x"BA" ELSE
        x"EA" WHEN data_i = x"BB" ELSE
        x"65" WHEN data_i = x"BC" ELSE
        x"7A" WHEN data_i = x"BD" ELSE
        x"AE" WHEN data_i = x"BE" ELSE
        x"08" WHEN data_i = x"BF" ELSE

        x"BA" WHEN data_i = x"C0" ELSE
        x"78" WHEN data_i = x"C1" ELSE
        x"25" WHEN data_i = x"C2" ELSE
        x"2E" WHEN data_i = x"C3" ELSE
        x"1C" WHEN data_i = x"C4" ELSE
        x"A6" WHEN data_i = x"C5" ELSE
        x"B4" WHEN data_i = x"C6" ELSE
        x"C6" WHEN data_i = x"C7" ELSE
        x"E8" WHEN data_i = x"C8" ELSE
        x"DD" WHEN data_i = x"C9" ELSE
        x"74" WHEN data_i = x"CA" ELSE
        x"1F" WHEN data_i = x"CB" ELSE
        x"4B" WHEN data_i = x"CC" ELSE
        x"BD" WHEN data_i = x"CD" ELSE
        x"8B" WHEN data_i = x"CE" ELSE
        x"8A" WHEN data_i = x"CF" ELSE

        x"70" WHEN data_i = x"D0" ELSE
        x"3E" WHEN data_i = x"D1" ELSE
        x"B5" WHEN data_i = x"D2" ELSE
        x"66" WHEN data_i = x"D3" ELSE
        x"48" WHEN data_i = x"D4" ELSE
        x"03" WHEN data_i = x"D5" ELSE
        x"F6" WHEN data_i = x"D6" ELSE
        x"0E" WHEN data_i = x"D7" ELSE
        x"61" WHEN data_i = x"D8" ELSE
        x"35" WHEN data_i = x"D9" ELSE
        x"57" WHEN data_i = x"DA" ELSE
        x"B9" WHEN data_i = x"DB" ELSE
        x"86" WHEN data_i = x"DC" ELSE
        x"C1" WHEN data_i = x"DD" ELSE
        x"1D" WHEN data_i = x"DE" ELSE
        x"9E" WHEN data_i = x"DF" ELSE
        x"E1" WHEN data_i = x"E0" ELSE
        x"F8" WHEN data_i = x"E1" ELSE
        x"98" WHEN data_i = x"E2" ELSE
        x"11" WHEN data_i = x"E3" ELSE
        x"69" WHEN data_i = x"E4" ELSE
        x"D9" WHEN data_i = x"E5" ELSE
        x"8E" WHEN data_i = x"E6" ELSE
        x"94" WHEN data_i = x"E7" ELSE
        x"9B" WHEN data_i = x"E8" ELSE
        x"1E" WHEN data_i = x"E9" ELSE
        x"87" WHEN data_i = x"EA" ELSE
        x"E9" WHEN data_i = x"EB" ELSE
        x"CE" WHEN data_i = x"EC" ELSE
        x"55" WHEN data_i = x"ED" ELSE
        x"28" WHEN data_i = x"EE" ELSE
        x"DF" WHEN data_i = x"EF" ELSE

        x"9C" WHEN data_i = x"F0" ELSE
        x"A1" WHEN data_i = x"F1" ELSE
        x"89" WHEN data_i = x"F2" ELSE
        x"0D" WHEN data_i = x"F3" ELSE
        x"BF" WHEN data_i = x"F4" ELSE
        x"E6" WHEN data_i = x"F5" ELSE
        x"42" WHEN data_i = x"F6" ELSE
        x"68" WHEN data_i = x"F7" ELSE
        x"41" WHEN data_i = x"F8" ELSE
        x"99" WHEN data_i = x"F9" ELSE
        x"2D" WHEN data_i = x"FA" ELSE
        x"0F" WHEN data_i = x"FB" ELSE
        x"B0" WHEN data_i = x"FC" ELSE
        x"54" WHEN data_i = x"FD" ELSE
        x"BB" WHEN data_i = x"FE" ELSE
        x"16" WHEN data_i = x"FF";
END ARCHITECTURE;