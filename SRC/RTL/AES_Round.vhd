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
    inter_ShiftRows_SubBytes : OUT type_state;
    inter_SubBytes_AddRoundKey : OUT type_state;
    inter_AddRoundKey_MixColumns : OUT type_state;
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

  SIGNAL signal_inter_ShiftRows_SubBytes : type_state;
  SIGNAL signal_inter_SubBytes_AddRoundKey : type_state;
  SIGNAL signal_inter_SubBytes_AddRoundKey_temp : type_state;
  SIGNAL signal_inter_AddRoundKey_MixColumns : type_state;
  SIGNAL data_o_s : type_state;
  SIGNAL data_idle_o_s : type_state;
BEGIN

  SHIFT : ShiftRows PORT MAP(
    data_i => currentText_i,
    data_o => signal_inter_ShiftRows_SubBytes);

  inter_ShiftRows_SubBytes <= signal_inter_ShiftRows_SubBytes;

  SUB : SubBytes PORT MAP(
    data_i => signal_inter_ShiftRows_SubBytes,
    data_o => signal_inter_SubBytes_AddRoundKey);

    signal_inter_SubBytes_AddRoundKey_temp <= signal_inter_SubBytes_AddRoundKey WHEN (firstRound_i = '0' AND idle_i = '0') ELSE currentText_i;
    inter_SubBytes_AddRoundKey <= signal_inter_SubBytes_AddRoundKey;


  ADD : AddRoundKey PORT MAP(
    Data_i => signal_inter_SubBytes_AddRoundKey_temp,
    Key_i => currentKey_i,
    Data_o => signal_inter_AddRoundKey_MixColumns);

  inter_AddRoundKey_MixColumns <= signal_inter_AddRoundKey_MixColumns;
  MIX : MixColumn PORT MAP(
    data_i => signal_inter_AddRoundKey_MixColumns,
    data_o => data_o_s,
    enablemc_i => enableInvMixColumns_i);
  inter_AddRoundKey_MixColumns <= signal_inter_AddRoundKey_MixColumns;

  data_idle_o_s <= data_o_s WHEN idle_i = '0' ELSE
    currentText_i;
  seq : PROCESS (clock_i)
  BEGIN
    IF clock_i'event AND clock_i = '1' THEN
      IF firstRound_i = '0' THEN
      data_o <= data_idle_o_s;
      ELSE
      data_o <= signal_inter_AddRoundKey_MixColumns;
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