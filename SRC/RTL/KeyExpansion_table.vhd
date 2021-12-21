library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library lib_AES;
use lib_AES.state_definition_package.all;

entity KeyExpansion_table is
  port (round_i         : in  bit4;
        expansion_key_o : out type_key);
end KeyExpansion_table;

architecture KeyExpansion_table_arch of KeyExpansion_table is
  type key_memory is array(0 to 10) of type_key;
  constant KeyMemory_s : key_memory := (
    ((x"2b",x"7e",x"15",x"16"),
    (x"28",x"ae",x"d2",x"a6"),
    (x"ab",x"f7",x"15",x"88"),
    (x"09",x"cf",x"4f",x"3c")),
    
    ((x"a0",x"fa",x"fe",x"17"),
    (x"88",x"54",x"2c",x"b1"),
    (x"23",x"a3",x"39",x"39"),
    (x"2a",x"6c",x"76",x"05")),
    
    ((x"f2",x"c2",x"95",x"f2"),
    (x"7a",x"96",x"b9",x"43"),
    (x"59",x"35",x"80",x"7a"),
    (x"73",x"59",x"f6",x"7f")),

    ((x"3d",x"80",x"47",x"7d"),
    (x"47",x"16",x"fe",x"3e"),
    (x"1e",x"23",x"7e",x"44"),
    (x"6d",x"7a",x"88",x"3b")),

    ((x"ef",x"44",x"a5",x"41"),
    (x"a8",x"52",x"5b",x"7f"),
    (x"b6",x"71",x"25",x"3b"),
    (x"db",x"0b",x"ad",x"00")),

    ((x"d4",x"d1",x"c6",x"f8"),
    (x"7c",x"83",x"9d",x"87"),
    (x"ca",x"f2",x"b8",x"bc"),
    (x"11",x"f9",x"15",x"bc")),

    ((x"6d",x"88",x"a3",x"7a"),
    (x"11",x"0b",x"3e",x"fd"),
    (x"db",x"f9",x"86",x"41"),
    (x"ca",x"00",x"93",x"fd")),

    ((x"4e",x"54",x"f7",x"0e"),
    (x"5f",x"5f",x"c9",x"f3"),
    (x"84",x"a6",x"4f",x"b2"),
    (x"4e",x"a6",x"dc",x"4f")),
    
    ((x"ea",x"d2",x"73",x"21"),
    (x"b5",x"8d",x"ba",x"d2"),
    (x"31",x"2b",x"f5",x"60"),
    (x"7f",x"8d",x"29",x"2f")),
    
    ((x"ac",x"77",x"66",x"f3"),
    (x"19",x"fa",x"dc",x"21"),
    (x"28",x"d1",x"29",x"41"),
    (x"57",x"5c",x"00",x"6e")),
      
    ((x"d0",x"14",x"f9",x"a8"),
    (x"c9",x"ee",x"25",x"89"),
    (x"e1",x"3f",x"0c",x"c8"),
    (x"b6",x"63",x"0c",x"a6")));

begin
  expansion_key_o <= KeyMemory_s(to_integer(unsigned(round_i)));
end architecture KeyExpansion_table_arch;

