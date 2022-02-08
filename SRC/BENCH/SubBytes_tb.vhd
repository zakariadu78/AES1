library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;
library lib_rtl;
library lib_aes;
use lib_aes.state_definition_package.all;


entity SubBytes_tb is 
end entity SubBytes_tb; 


architecture SubBytes_tb_arch of SubBytes_tb is 
    component SubBytes
    port ( 
    data_i : in type_state;
    data_o : out type_state
  ); 
    end component;

signal data_i_s : type_state; 
signal data_o_s : type_state; 


begin 
    DUT : SubBytes
        port map 
        (
            data_i => data_i_s,
            data_o => data_o_s
        );

      data_i_s <= ( ( X"00", X"01", X"02", X"03"),
			( X"10", X"11", X"12", X"13"),
			( X"20", X"21", X"22", X"23"),
			( X"30", X"31", X"32", X"33") ); 

      

end architecture SubBytes_tb_arch;

configuration SubBytes_tb_conf of SubBytes_tb is 
  for SubBytes_tb_arch 
    for DUT : SubBytes
      use entity LIB_RTL.SubBytes(SubBytes_arch); 
    end for; 
  end for; 
end SubBytes_tb_conf; 