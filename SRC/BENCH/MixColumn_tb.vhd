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
      data_i : IN type_state;
      data_o : OUT type_state;
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


      data_i_s <= ( 
      ( X"12", X"FD", X"89", X"2C"),
			( X"90", X"BB", X"E2", X"FD"),
			( X"56", X"A1", X"BF", X"8A"),
			( X"F9", X"01", X"93", X"1C") ); 


end architecture MixColumn_tb_arch;

configuration MixColumn_tb_conf of MixColumn_tb is 
  for MixColumn_tb_arch 
    for DUT : MixColumn
      use entity LIB_RTL.MixColumn(MixColumn_arch); 
    end for; 
  end for; 
end MixColumn_tb_conf; 