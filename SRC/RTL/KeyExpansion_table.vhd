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
    
    ((x"75",x"ec",x"78",x"56"),
    (x"5d",x"42",x"aa",x"f0"),
    (x"f6",x"b5",x"bf",x"78"),
    (x"ff",x"7a",x"f0",x"44")),
    
    ((x"ca",x"fb",x"fe",x"2b"),
    (x"97",x"b9",x"54",x"db"),
    (x"61",x"0c",x"eb",x"a3"),
    (x"9e",x"76",x"1b",x"e7")),

                   
    ((x"c1",x"bf",x"4e",x"f4"),
    (x"56",x"06",x"1a",x"2f"),
    (x"37",x"0a",x"f1",x"8c"),
    (x"a9",x"7c",x"ea",x"6b")),

                   
    ((x"c8",x"04",x"4b",x"43"),
    (x"9e",x"02",x"51",x"6c"),
    (x"a9",x"08",x"a0",x"e0"),
    (x"00",x"74",x"4a",x"8b")),

                   
    ((x"12",x"58",x"85",x"11"),
    (x"8c",x"5a",x"d4",x"7d"),
    (x"25",x"52",x"74",x"9d"),
    (x"25",x"26",x"3e",x"16")),

                   
    ((x"11",x"89",x"7a",x"d3"),
    (x"9d",x"d3",x"ae",x"ae"),
    (x"b8",x"81",x"da",x"33"),
    (x"9d",x"a7",x"e4",x"25")),

                   
    ((x"d8",x"27",x"b8",x"a6"),
    (x"45",x"f4",x"16",x"08"),
    (x"fd",x"75",x"cc",x"3b"),
    (x"60",x"d2",x"28",x"1e")),
    
                   
    ((x"27",x"c9",x"51",x"36"),
    (x"62",x"3d",x"47",x"3e"),
    (x"9f",x"48",x"8b",x"05"),
    (x"ff",x"9a",x"a3",x"1b")),
    
                   
    ((x"0b",x"b8",x"15",x"4b"),
    (x"69",x"85",x"52",x"75"),
    (x"f6",x"cd",x"d9",x"70"),
    (x"09",x"57",x"7a",x"6b")),
      
                   
    ((x"e7",x"05",x"10",x"0b"),
    (x"8e",x"80",x"42",x"7e"),
    (x"78",x"4d",x"9b",x"0e"),
    (x"71",x"1a",x"e1",x"65")));

begin
  expansion_key_o <= KeyMemory_s(to_integer(unsigned(round_i)));
end architecture KeyExpansion_table_arch;

