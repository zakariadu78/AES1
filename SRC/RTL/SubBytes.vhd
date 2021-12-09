library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

library lib_AES;
library lib_rtl; 
use lib_AES.state_definition_package.all;


entity SubBytes is 
  port ( 
    data_i : in type_state;
    data_o : out type_state
  ); 
end SubBytes; 

architecture SubBytes_arch of SubBytes is 

component Sbox_inv 
  port (
    data_i  : in bit8; 
    data_o  : out bit8
    );
end component;


begin 

loopi : for i in 0 to 3 generate 
    loopj : for j in 0 to 3 generate 
        Sbox_in : Sbox_inv port map (
          data_i => data_i(i)(j),
          data_o => data_o(i)(j)
        ); 
    end generate; 
end generate;

end SubBytes_arch; 

configuration SubBytes_conf of SubBytes is 
  for SubBytes_arch 
    for loopi
      for loopj
        for all : Sbox_inv
          use entity lib_rtl.Sbox_Inv(Sbox_inv_arch); 
        end for; 
      end for; 
    end for; 
  end for; 
end SubBytes_conf; 
