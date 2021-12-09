library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_rtl;
library lib_aes;
use lib_aes.state_definition_package.all;


entity MixColumn_tb is 
end entity MixColumn_tb; 


architecture MixColumn_tb_arch of MixColumn_tb is 
    component MixColumn
    port (
    data_i : in type_state;
    data_o : out type_state;
    enablemc_i : in std_logic);
    end component;

    signal enablemc_i_s :  std_logic; 
    signal data_i_s, data_o_s : type_state; 


begin 
    DUT : MixColumn
        port map 
        (
            data_i => data_i_s,
            data_o => data_o_s,
            enablemc_i => enablemc_i_s
        );

        enablemc_i_s <= '1'; 

      data_i_s <= ( ( X"58", X"e6", X"46", X"d5"),
			( X"8d", X"c6", X"06", X"ab"),
			( X"ce", X"ce", X"76", X"31"),
			( X"72", X"f3", X"5a", X"9c") ); 


end architecture MixColumn_tb_arch;

configuration MixColumn_tb_conf of MixColumn_tb is 
  for MixColumn_tb_arch 
    for DUT : MixColumn
      use entity LIB_RTL.MixColumn(MixColumn_arch); 
    end for; 
  end for; 
end MixColumn_tb_conf; 