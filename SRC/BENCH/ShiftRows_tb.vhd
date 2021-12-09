library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_rtl;
library lib_aes;
use lib_aes.state_definition_package.all;


entity ShiftRows_tb is 
end entity ShiftRows_tb; 


architecture ShiftRows_tb_arch of ShiftRows_tb is 
    component ShiftRows
    port ( 
    Data_i : in type_state;
    Data_o : out type_state
  ); 
    end component;

signal data_i_s : type_state; 
signal data_o_s : type_state; 


begin 
    DUT : ShiftRows
        port map 
        (
            Data_i => data_i_s,
            Data_o => data_o_s
        );

      data_i_s <= ( ( X"00", X"01", X"02", X"03"),
			( X"10", X"11", X"12", X"13"),
			( X"20", X"21", X"22", X"23"),
			( X"30", X"31", X"32", X"33") ); 


end architecture ShiftRows_tb_arch;

