library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;
library lib_rtl;
library lib_aes;
use lib_aes.state_definition_package.all;

entity AES_Round_tb is 
end entity AES_Round_tb; 


architecture AES_Round_tb_arch of AES_Round_tb is 

component AES_Round
port ( 
  clock_i : IN STD_LOGIC;
  currentKey_i : IN type_key;
  currentText_i : IN type_state;
  enableInvMixColumns_i : IN STD_LOGIC;
  firstRound_i : IN STD_LOGIC;
  data_o : OUT type_state;
  inter_ShiftRows_SubBytes : OUT type_state;
  inter_SubBytes_AddRoundKey : OUT type_state;
  inter_AddRoundKey_MixColumns : OUT type_state
    ); 

end component AES_Round; 

signal clock_s : std_logic :='0'; 
signal enableInvMixColumns_s, firstRound_s: std_logic; 
signal currentKey_s : type_key; 
signal currentText_s, data_o_s : type_state; 
signal signal_inter_ShiftRows_SubBytes : type_state;
signal signal_inter_SubBytes_AddRoundKey : type_state;
signal signal_inter_AddRoundKey_MixColumns : type_state; 


begin

  DUT: AES_Round 
  port map (
    clock_i => clock_s,
    currentKey_i => currentKey_s, 
    currentText_i => currentText_s,
    enableInvMixColumns_i => enableInvMixColumns_s,
    firstRound_i => firstRound_s,
    data_o => data_o_s,
    inter_ShiftRows_SubBytes => signal_inter_ShiftRows_SubBytes,
    inter_SubBytes_AddRoundKey => signal_inter_SubBytes_AddRoundKey,
    inter_AddRoundKey_MixColumns => signal_inter_AddRoundKey_MixColumns);


clock_s <= not clock_s after 10 ns;

currentKey_s <= ((x"0b",x"69",x"f6",x"09"),
                (x"b8",x"85",x"cd",x"57"),
                (x"15",x"52",x"d9",x"7a"),
                (x"4b",x"75",x"70",x"6b"));
                               
currentText_s <= ((x"6b",x"88",x"a6",x"db"),
                  (x"14",x"2d",x"87",x"19"),
                  (x"25",x"06",x"77",x"a2"),
                  (x"4f",x"f6",x"8d",x"63"));


enableInvMixColumns_s <= '1';
firstRound_s <= '0';


end architecture AES_Round_tb_arch; 



configuration AES_Round_tb_conf of AES_Round_tb is 
  for AES_Round_tb_arch 
    for DUT : AES_Round
      use entity LIB_RTL.AES_Round(AES_Round_arch);
    end for; 
  end for; 
end AES_Round_tb_conf; 