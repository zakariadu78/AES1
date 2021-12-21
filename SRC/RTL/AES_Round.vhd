library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;

entity AES_Round is 
port ( 
    clock_i : in std_logic; 
    currentKey_i : in type_key; 
    currentText_i : in type_state; 
    enableInvMixColumns_i : in std_logic; 
    enableRoundComputing_i : in std_logic; 
    Reset_i : in std_logic;
    data_o : out type_state
    ); 

end entity AES_Round; 



architecture AES_Round_arch of AES_Round is 



component SubBytes
    port ( 
    data_i : in type_state;
    data_o : out type_state
  ); 
end component; 

component ShiftRows
    port ( 
    Data_i : in type_state;
    Data_o : out type_state
  ); 
end component;

component AddRoundKey is
    port (
    Data_i : in type_state;
    Key_i : in type_key;
    Data_o : out type_state);
end component;


component MixColumn 
    port (
            data_i : in type_state;
            data_o : out type_state;
            mult3 : out type_state;
            mult2 : out type_state;
            enablemc_i : in std_logic);
end component;



signal signal_inter_ShiftRows_SubBytes : type_state;
signal signal_inter_SubBytes_AddRoundKey : type_state;
signal signal_inter_AddRoundKey_MixColumns : type_state; 
signal data_o_s : type_state; 

begin 

SHIFT: ShiftRows port map (
  data_i => currentText_i,
  data_o => signal_inter_ShiftRows_SubBytes); 


SUB : SubBytes port map (
  data_i => signal_inter_ShiftRows_SubBytes,
  data_o => signal_inter_SubBytes_AddRoundKey); 

signal_inter_SubBytes_AddRoundKey <= signal_inter_SubBytes_AddRoundKey when enableRoundComputing_i ='1' else currentText_i;

ADD : AddRoundKey port map (
  Data_i => signal_inter_SubBytes_AddRoundKey,
  Key_i => currentKey_i,
  Data_o => signal_inter_AddRoundKey_MixColumns); 


MIX : MixColumn port map ( 
  data_i => signal_inter_AddRoundKey_MixColumns,
  data_o => data_o_s,
  enablemc_i => enableInvMixColumns_i);



seq : process(clock_i)
begin 
if clock_i'event and clock_i ='1' then 
Data_o <= data_o_s; 
end if; 
end process seq; 

end AES_Round_arch; 