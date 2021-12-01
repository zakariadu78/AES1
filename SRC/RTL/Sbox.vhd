library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library lib_rtl;
use lib_rtl.state_definition_package.all;

entity Sbox_Inv is 
    port (
    data_i  : in bit8; 
    data_o  : out bit8
    );
end entity; 


architecture Sbox_inv_arch of Sbox_inv is 
begin 
    data_o <= 
    x"63" when data_i = x"00" else 
    x"7C" when data_i = x"01" else
    x"77" when data_i = x"02" else
    x"7B" when data_i = x"03" else
    x"F2" when data_i = x"04" else
    x"6B" when data_i = x"05" else
    x"6F" when data_i = x"06" else
    x"C5" when data_i = x"07" else
    x"30" when data_i = x"08" else
    x"01" when data_i = x"09" else
    x"67" when data_i = x"0A" else
    x"2B" when data_i = x"0B" else
    x"FE" when data_i = x"0C" else
    x"D7" when data_i = x"0D" else
    x"AB" when data_i = x"0E" else
    x"76" when data_i = x"0F" else

    x"CA" when data_i = x"10" else
    x"82" when data_i = x"11" else
    x"C9" when data_i = x"12" else
    x"7D" when data_i = x"13" else
    x"FA" when data_i = x"14" else
    x"59" when data_i = x"15" else
    x"47" when data_i = x"16" else
    x"F0" when data_i = x"17" else
    x"AD" when data_i = x"18" else
    x"D4" when data_i = x"19" else
    x"A2" when data_i = x"1A" else
    x"AF" when data_i = x"1B" else
    x"9C" when data_i = x"1C" else
    x"A4" when data_i = x"1D" else
    x"72" when data_i = x"1E" else
    x"C0" when data_i = x"1F" else
    
    x"B7" when data_i = x"20" else
    x"FD" when data_i = x"21" else
    x"93" when data_i = x"22" else
    x"26" when data_i = x"23" else
    x"36" when data_i = x"24" else
    x"3F" when data_i = x"25" else
    x"F7" when data_i = x"26" else
    x"CC" when data_i = x"27" else
    x"34" when data_i = x"28" else
    x"A5" when data_i = x"29" else
    x"E5" when data_i = x"2A" else
    x"F1" when data_i = x"2B" else
    x"71" when data_i = x"2C" else
    x"D8" when data_i = x"2D" else
    x"31" when data_i = x"2E" else
    x"15" when data_i = x"2F" else

    x"04" when data_i = x"30" else
    x"C7" when data_i = x"31" else
    x"23" when data_i = x"32" else
    x"C3" when data_i = x"33" else
    x"18" when data_i = x"34" else
    x"96" when data_i = x"35" else
    x"05" when data_i = x"36" else
    x"9A" when data_i = x"37" else
    x"07" when data_i = x"38" else
    x"12" when data_i = x"39" else
    x"80" when data_i = x"3A" else
    x"E2" when data_i = x"3B" else
    x"EB" when data_i = x"3C" else
    x"27" when data_i = x"3D" else
    x"B2" when data_i = x"3E" else
    x"75" when data_i = x"3F" else

    x"09" when data_i = x"40" else
    x"83" when data_i = x"41" else
    x"EC" when data_i = x"42" else
    x"1A" when data_i = x"43" else
    x"1B" when data_i = x"44" else
    x"6E" when data_i = x"45" else
    x"5A" when data_i = x"46" else
    x"A0" when data_i = x"47" else
    x"52" when data_i = x"48" else
    x"3B" when data_i = x"49" else
    x"D6" when data_i = x"4A" else
    x"B3" when data_i = x"4B" else
    x"29" when data_i = x"4C" else
    x"E3" when data_i = x"4D" else
    x"2F" when data_i = x"4E" else
    x"84" when data_i = x"4F" else

    x"53" when data_i = x"50" else
    x"D1" when data_i = x"51" else
    x"00" when data_i = x"52" else
    x"ED" when data_i = x"53" else
    x"20" when data_i = x"54" else
    x"FC" when data_i = x"55" else
    x"B1" when data_i = x"56" else
    x"5B" when data_i = x"57" else
    x"6A" when data_i = x"58" else
    x"CB" when data_i = x"59" else
    x"BE" when data_i = x"5A" else
    x"39" when data_i = x"5B" else
    x"4A" when data_i = x"5C" else
    x"4C" when data_i = x"5D" else
    x"58" when data_i = x"5E" else
    x"CF" when data_i = x"5F" else

    x"D0" when data_i = x"60" else
    x"EF" when data_i = x"61" else
    x"AA" when data_i = x"62" else
    x"FB" when data_i = x"63" else
    x"43" when data_i = x"64" else
    x"4D" when data_i = x"65" else
    x"33" when data_i = x"66" else
    x"85" when data_i = x"67" else
    x"45" when data_i = x"68" else
    x"F9" when data_i = x"69" else
    x"02" when data_i = x"6A" else
    x"7F" when data_i = x"6B" else
    x"50" when data_i = x"6C" else
    x"3C" when data_i = x"6D" else
    x"9F" when data_i = x"6E" else
    x"A8" when data_i = x"6F" else

    x"51" when data_i = x"70" else
    x"A3" when data_i = x"71" else
    x"40" when data_i = x"72" else
    x"8F" when data_i = x"73" else
    x"92" when data_i = x"74" else
    x"9D" when data_i = x"75" else
    x"38" when data_i = x"76" else
    x"F5" when data_i = x"77" else
    x"BC" when data_i = x"78" else
    x"B6" when data_i = x"79" else
    x"DA" when data_i = x"7A" else
    x"21" when data_i = x"7B" else
    x"10" when data_i = x"7C" else
    x"FF" when data_i = x"7D" else
    x"F3" when data_i = x"7E" else
    x"D2" when data_i = x"7F" else

    x"CD" when data_i = x"80" else
    x"0C" when data_i = x"81" else
    x"13" when data_i = x"82" else
    x"EC" when data_i = x"83" else
    x"5F" when data_i = x"84" else
    x"97" when data_i = x"85" else
    x"44" when data_i = x"86" else
    x"17" when data_i = x"87" else
    x"C4" when data_i = x"88" else
    x"A7" when data_i = x"89" else
    x"7E" when data_i = x"8A" else
    x"3D" when data_i = x"8B" else
    x"64" when data_i = x"8C" else
    x"5D" when data_i = x"8D" else
    x"19" when data_i = x"8E" else
    x"73" when data_i = x"8F" else

    x"60" when data_i = x"90" else
    x"81" when data_i = x"91" else
    x"4F" when data_i = x"92" else
    x"DC" when data_i = x"93" else
    x"22" when data_i = x"94" else
    x"2A" when data_i = x"95" else
    x"90" when data_i = x"96" else
    x"88" when data_i = x"97" else
    x"46" when data_i = x"98" else
    x"EE" when data_i = x"99" else
    x"B8" when data_i = x"9A" else
    x"14" when data_i = x"9B" else
    x"DE" when data_i = x"9C" else
    x"5E" when data_i = x"9D" else
    x"0B" when data_i = x"9E" else
    x"DB" when data_i = x"9F" else

    x"E0" when data_i = x"A0" else
    x"32" when data_i = x"A1" else
    x"3A" when data_i = x"A2" else
    x"0A" when data_i = x"A3" else
    x"40" when data_i = x"A4" else
    x"06" when data_i = x"A5" else
    x"24" when data_i = x"A6" else
    x"5C" when data_i = x"A7" else
    x"C2" when data_i = x"A8" else
    x"D3" when data_i = x"A9" else
    x"AC" when data_i = x"AA" else
    x"62" when data_i = x"AB" else
    x"91" when data_i = x"AC" else
    x"95" when data_i = x"AD" else
    x"E4" when data_i = x"AE" else
    x"79" when data_i = x"AF" else

    x"E7" when data_i = x"B0" else
    x"C8" when data_i = x"B1" else
    x"37" when data_i = x"B2" else
    x"6D" when data_i = x"B3" else
    x"8D" when data_i = x"B4" else
    x"D5" when data_i = x"B5" else
    x"4E" when data_i = x"B6" else
    x"A9" when data_i = x"B7" else
    x"6C" when data_i = x"B8" else
    x"56" when data_i = x"B9" else
    x"F4" when data_i = x"BA" else
    x"EA" when data_i = x"BB" else
    x"65" when data_i = x"BC" else
    x"7A" when data_i = x"BD" else
    x"AE" when data_i = x"BE" else
    x"08" when data_i = x"BF" else

    x"BA" when data_i = x"C0" else
    x"78" when data_i = x"C1" else
    x"25" when data_i = x"C2" else
    x"2E" when data_i = x"C3" else
    x"1C" when data_i = x"C4" else
    x"A6" when data_i = x"C5" else
    x"B4" when data_i = x"C6" else
    x"C6" when data_i = x"C7" else
    x"E8" when data_i = x"C8" else
    x"DD" when data_i = x"C9" else
    x"74" when data_i = x"CA" else
    x"1F" when data_i = x"CB" else
    x"4B" when data_i = x"CC" else
    x"BD" when data_i = x"CD" else
    x"8B" when data_i = x"CE" else
    x"8A" when data_i = x"CF" else

    x"70" when data_i = x"D0" else
    x"3E" when data_i = x"D1" else
    x"B5" when data_i = x"D2" else
    x"66" when data_i = x"D3" else
    x"48" when data_i = x"D4" else
    x"03" when data_i = x"D5" else
    x"F6" when data_i = x"D6" else
    x"0E" when data_i = x"D7" else
    x"61" when data_i = x"D8" else
    x"35" when data_i = x"D9" else
    x"57" when data_i = x"DA" else
    x"B9" when data_i = x"DB" else
    x"86" when data_i = x"DC" else
    x"C1" when data_i = x"DD" else
    x"1D" when data_i = x"DE" else
    x"9E" when data_i = x"DF" else
    x"E1" when data_i = x"E0" else
    x"F8" when data_i = x"E1" else
    x"98" when data_i = x"E2" else
    x"11" when data_i = x"E3" else
    x"69" when data_i = x"E4" else
    x"D9" when data_i = x"E5" else
    x"8E" when data_i = x"E6" else
    x"94" when data_i = x"E7" else
    x"9B" when data_i = x"E8" else
    x"1E" when data_i = x"E9" else
    x"87" when data_i = x"EA" else
    x"E9" when data_i = x"EB" else
    x"CE" when data_i = x"EC" else
    x"55" when data_i = x"ED" else
    x"28" when data_i = x"EE" else
    x"DF" when data_i = x"EF" else

    x"9C" when data_i = x"F0" else
    x"A1" when data_i = x"F1" else
    x"89" when data_i = x"F2" else
    x"0D" when data_i = x"F3" else
    x"BF" when data_i = x"F4" else
    x"E6" when data_i = x"F5" else
    x"42" when data_i = x"F6" else
    x"68" when data_i = x"F7" else
    x"41" when data_i = x"F8" else
    x"99" when data_i = x"F9" else
    x"2D" when data_i = x"FA" else
    x"0F" when data_i = x"FB" else
    x"B0" when data_i = x"FC" else
    x"54" when data_i = x"FD" else
    x"BB" when data_i = x"FE" else
    x"16" when data_i = x"FF";
    end architecture;









