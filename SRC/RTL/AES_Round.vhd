LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY AES_Round IS
  PORT (
    clock_i : IN STD_LOGIC;
    currentKey_i : IN type_key;
    currentText_i : IN type_state;
    enableInvMixColumns_i : IN STD_LOGIC;
    firstRound_i : IN STD_LOGIC;
    data_o : OUT type_state;
    idle_i : IN STD_LOGIC
  );

END ENTITY AES_Round;

ARCHITECTURE AES_Round_arch OF AES_Round IS

  COMPONENT SubBytes
    PORT (
      data_i : IN type_state;
      data_o : OUT type_state
    );
  END COMPONENT;

  COMPONENT ShiftRows
    PORT (
      Data_i : IN type_state;
      Data_o : OUT type_state
    );
  END COMPONENT;

  COMPONENT AddRoundKey IS
    PORT (
      Data_i : IN type_state;
      Key_i : IN type_key;
      Data_o : OUT type_state);
  END COMPONENT;
  COMPONENT MixColumn
    PORT (
      data_i : IN type_state;
      data_o : OUT type_state;
      enablemc_i : IN STD_LOGIC);
  END COMPONENT;

  SIGNAL inter_ShiftRows_SubBytes_s : type_state; -- Signal intermédiaire entre Shiftrows et subBytes
  SIGNAL inter_SubBytes_AddRoundKey_s : type_state; -- Signal intermédiaire entre subBytes et AddRoundKey
  SIGNAL inter_SubBytes_AddRoundKey_temp_s : type_state; -- Signal temporaire intermédiaire entre Shiftrows et subBytes
  SIGNAL inter_AddRoundKey_MixColumns_s : type_state; -- Signal intermédiaire entre AddRoundKey et MixColumn
  SIGNAL data_o_s : type_state;
  SIGNAL data_idle_o_s : type_state;
BEGIN

  SHIFT : ShiftRows PORT MAP(
    data_i => currentText_i,
    data_o => inter_ShiftRows_SubBytes_s);

  SUB : SubBytes PORT MAP(
    data_i => inter_ShiftRows_SubBytes_s,
    data_o => inter_SubBytes_AddRoundKey_s);

  inter_SubBytes_AddRoundKey_temp_s <= inter_SubBytes_AddRoundKey_s WHEN (firstRound_i = '0' AND idle_i = '0') ELSE
    currentText_i; -- On veut avoir seulement AddRoundKey dans le cas de la premiere ronde. Il faut alors lui mettre directement la donnée d'entrée
  ADD : AddRoundKey PORT MAP(
    Data_i => inter_SubBytes_AddRoundKey_temp_s,
    Key_i => currentKey_i,
    Data_o => inter_AddRoundKey_MixColumns_s);

  MIX : MixColumn PORT MAP(
    data_i => inter_AddRoundKey_MixColumns_s,
    data_o => data_o_s,
    enablemc_i => enableInvMixColumns_i);

  data_idle_o_s <= data_o_s WHEN idle_i = '0' ELSE
    currentText_i;  -- Si idle, on veut avoir en sortie l'entrée de notre Ronde (on ne change pas la donnée)
  seq : PROCESS (clock_i)
  BEGIN
    IF clock_i'event AND clock_i = '1' THEN
      IF firstRound_i = '0' THEN
        data_o <= data_idle_o_s;  
      ELSE
        data_o <= inter_AddRoundKey_MixColumns_s; -- Si premiere ronde, on envoie directement le signal de sortie d'AddRoundKey
      END IF;
    END IF;
  END PROCESS seq;
END AES_Round_arch;

CONFIGURATION AES_Round_conf OF AES_Round IS
  FOR AES_Round_arch
    FOR ALL : AddRoundKey
      USE ENTITY lib_rtl.AddRoundKey(AddRoundKey_arch);
    END FOR;
    FOR ALL : ShiftRows
      USE ENTITY lib_rtl.ShiftRows(ShiftRows_arch);
    END FOR;
    FOR ALL : SubBytes
      USE CONFIGURATION lib_rtl.SubBytes_conf;
    END FOR;
    FOR ALL : MixColumn
      USE ENTITY lib_rtl.MixColumn(MixColumn_arch);
    END FOR;
  END FOR;
END AES_Round_conf;