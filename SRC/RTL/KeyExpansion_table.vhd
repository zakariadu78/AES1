LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY KeyExpansion_table IS
  PORT (
    round_i : IN bit4;
    expansion_key_o : OUT type_key);
END KeyExpansion_table;

ARCHITECTURE KeyExpansion_table_arch OF KeyExpansion_table IS
  TYPE key_memory IS ARRAY(0 TO 10) OF type_key;
  CONSTANT KeyMemory_s : key_memory := (
  ((x"2b", x"28", x"ab", x"09"),
    (x"7e", x"ae", x"f7", x"cf"),
    (x"15", x"d2", x"15", x"4f"),
    (x"16", x"a6", x"88", x"3c")),

    ((x"75", x"5d", x"f6", x"ff"),
    (x"ec", x"42", x"b5", x"7a"),
    (x"78", x"aa", x"bf", x"f0"),
    (x"56", x"f0", x"78", x"44")),

    ((x"ca", x"97", x"61", x"9e"),
    (x"fb", x"b9", x"0c", x"76"),
    (x"fe", x"54", x"eb", x"1b"),
    (x"2b", x"db", x"a3", x"e7")),

    ((x"c1", x"56", x"37", x"a9"),
    (x"bf", x"06", x"0a", x"7c"),
    (x"4e", x"1a", x"f1", x"ea"),
    (x"f4", x"2f", x"8c", x"6b")),

    ((x"c8", x"9e", x"a9", x"00"),
    (x"04", x"02", x"08", x"74"),
    (x"4b", x"51", x"a0", x"4a"),
    (x"43", x"6c", x"e0", x"8b")),

    ((x"12", x"8c", x"25", x"25"),
    (x"58", x"5a", x"52", x"26"),
    (x"85", x"d4", x"74", x"3e"),
    (x"11", x"7d", x"9d", x"16")),

    ((x"11", x"9d", x"b8", x"9d"),
    (x"89", x"d3", x"81", x"a7"),
    (x"7a", x"ae", x"da", x"e4"),
    (x"d3", x"ae", x"33", x"25")),

    ((x"d8", x"45", x"fd", x"60"),
    (x"27", x"f4", x"75", x"d2"),
    (x"b8", x"16", x"cc", x"28"),
    (x"a6", x"08", x"3b", x"1e")),

    ((x"27", x"62", x"9f", x"ff"),
    (x"c9", x"3d", x"48", x"9a"),
    (x"51", x"47", x"8b", x"a3"),
    (x"36", x"3e", x"05", x"1b")),

    ((x"0b", x"69", x"f6", x"09"),
    (x"b8", x"85", x"cd", x"57"),
    (x"15", x"52", x"d9", x"7a"),
    (x"4b", x"75", x"70", x"6b")),

    ((x"e7", x"8e", x"78", x"71"),
    (x"05", x"80", x"4d", x"1a"),
    (x"10", x"42", x"9b", x"e1"),
    (x"0b", x"7e", x"0e", x"65")));

BEGIN
  expansion_key_o <= KeyMemory_s(to_integer(unsigned(round_i)));
END ARCHITECTURE KeyExpansion_table_arch;