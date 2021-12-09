library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 

library LIB_AES; 
library LIB_RTL; 
use lib_aes.state_definition_package.all;
 
entity addRoundKey_tb is 
end entity; 



architecture addRoundKey_tb_arch of addRoundKey_tb is

component AddRoundKey 
  port (
  Data_i : in type_state;
  Key_i : in type_key;
  Data_o : out type_state);
  end component;


signal Data_i_s : type_state; 
signal Key_s : type_key; 
signal Data_o_s : type_state; 


begin 

  DUT : AddRoundKey
  port map (
   Data_i => Data_i_s,
   Key_i => Key_s,
   Data_o => Data_o_s
  ); 

  Data_i_s <= (
    (x"41",x"73",x"2d",x"74"),
    (x"75",x"20",x"6c",x"61"),
    (x"20",x"43",x"4f",x"56"),
    (x"49",x"44",x"20",x"3f")
  ); 

  Key_s <= (
    (x"2b",x"7e",x"15",x"16"),
    (x"28",x"ae",x"d2",x"a6"),
    (x"ab",x"f7",x"15",x"88"),
    (x"09",x"cf",x"4f",x"3c")
  );

  end architecture; 