library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;

entity AES_Round_tb is 
end entity AES_Round_tb; 


architecture AES_Round_tb_arch of AES_Round_tb is 


signal clock_s : std_logic :='0'; 
signal enableInvMixColumns_s, enableRoundComputing_s, Reset_s: std_logic; 
signal currentKey_s : type_key; 
signal currentText_s, data_o_s : type_state; 

component  AES_Round is 
port ( 
    clock_i : in std_logic; 
    currentKey_i : in type_key; 
    currentText_i : in type_state; 
    enableInvMixColumns_i : in std_logic; 
    enableRoundComputing_i : in std_logic; 
    Reset_i : in std_logic;
    data_o : out type_state
    ); 

end component AES_Round; 

begin

  DUT: AES_Round port map (
    clock_i => clock_s,
    currentKey_i => currentKey_s, 
    currentText_i => currentText_s,
    enableInvMixColumns_i => enableInvMixColumns_s,
    enableRoundComputing_i => enableRoundComputing_s,
    Reset_i => Reset_s,
    data_o => data_o_s);


clock_s <= not clock_s after 10 ns;
currentKey_s <= ((x"2b",x"7e",x"15",x"16"),
                (x"28",x"ae",x"d2",x"a6"),
                (x"ab",x"f7",x"15",x"88"),
                (x"09",x"cf",x"4f",x"3c"));

currentText_s <= ((x"8c", x"11", x"35", x"44"),
                 (x"06", x"ad", x"44", x"88"),
                 (x"de", x"ca", x"ec", x"83"),
                 (x"aa", x"03", x"43", x"06"));
enableInvMixColumns_s <= '0', '1' after 200 ns, '0' after 250 ns;
enableRoundComputing_s <= '0', '1' after 200 ns, '0' after 250 ns;
Reset_s <= '1','0' after 5 ns, '1' after 15 ns;


end architecture AES_Round_tb_arch; 
