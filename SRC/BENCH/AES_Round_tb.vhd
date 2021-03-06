LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY inv_AES_Round_tb IS
END ENTITY inv_AES_Round_tb;
ARCHITECTURE inv_AES_Round_tb_arch OF inv_AES_Round_tb IS

  COMPONENT inv_AES_Round
    PORT (
      clock_i : IN STD_LOGIC;
      currentKey_i : IN type_key;
      currentText_i : IN type_state;
      enableInvMixColumns_i : IN STD_LOGIC;
      firstRound_i : IN STD_LOGIC;
      data_o : OUT type_state;
      idle_i : IN STD_LOGIC
    );

  END COMPONENT inv_AES_Round;

  SIGNAL clock_s : STD_LOGIC := '0';
  SIGNAL enableInvMixColumns_s, firstRound_s : STD_LOGIC;
  SIGNAL currentKey_s : type_key;
  SIGNAL currentText_s, data_o_s : type_state;
  SIGNAL signal_inter_ShiftRows_SubBytes : type_state;
  SIGNAL signal_inter_SubBytes_AddRoundKey : type_state;
  SIGNAL signal_inter_AddRoundKey_MixColumns : type_state;
  SIGNAL idle_s : STD_LOGIC := '0';
BEGIN

  DUT : inv_AES_Round
  PORT MAP(
    clock_i => clock_s,
    currentKey_i => currentKey_s,
    currentText_i => currentText_s,
    enableInvMixColumns_i => enableInvMixColumns_s,
    firstRound_i => firstRound_s,
    data_o => data_o_s,
    idle_i => idle_s);

  clock_s <= NOT clock_s AFTER 10 ns;
  
  -- Données d'entrée pour la round 9
  currentKey_s <= ((x"0b", x"69", x"f6", x"09"),
    (x"b8", x"85", x"cd", x"57"),
    (x"15", x"52", x"d9", x"7a"),
    (x"4b", x"75", x"70", x"6b"));

  currentText_s <= ((x"6b", x"88", x"a6", x"db"),
    (x"14", x"2d", x"87", x"19"),
    (x"25", x"06", x"77", x"a2"),
    (x"4f", x"f6", x"8d", x"63"));
  enableInvMixColumns_s <= '1';
  firstRound_s <= '0';
END ARCHITECTURE inv_AES_Round_tb_arch;

CONFIGURATION inv_AES_Round_tb_conf OF inv_AES_Round_tb IS
  FOR inv_AES_Round_tb_arch
    FOR DUT : inv_AES_Round
      USE ENTITY LIB_RTL.inv_AES_Round(inv_AES_Round_arch);
    END FOR;
  END FOR;
END inv_AES_Round_tb_conf;