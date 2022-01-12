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
		mult2 : out row_state;
		mult3 : out row_state;
		mult4 : out row_state;
		mult8 : out row_state;
		mult9 : out row_state;
		multb : out row_state;
		multd : out row_state;
		multe : out row_state;
		enablemc_i : in std_logic);
    end component;

    signal enablemc_i_s :  std_logic; 
    signal data_i_s, data_o_s : type_state; 
    signal mult2_s,mult3_s, mult4_s, mult8_s, mult9_s, multb_s, multd_s, multe_s : row_state; 

begin 
    DUT : MixColumn
        port map 
        (
            data_i => data_i_s,
            data_o => data_o_s,
            enablemc_i => enablemc_i_s,
            mult2 => mult2_s,
            mult3 => mult3_s,
            mult4 => mult4_s,
            mult8 => mult8_s,
            mult9 => mult9_s,
            multb => multb_s,
            multd => multd_s,
            multe => multe_s 
        );

      enablemc_i_s <= '1'; 


      data_i_s <= ( 
      ( X"01", X"AD", X"D2", X"B0"),
			( X"02", X"7F", X"15", X"40"),
			( X"03", X"68", X"E6", X"15"),
			( X"04", X"28", X"8B", X"EF") ); 


end architecture MixColumn_tb_arch;

configuration MixColumn_tb_conf of MixColumn_tb is 
  for MixColumn_tb_arch 
    for DUT : MixColumn
      use entity LIB_RTL.MixColumn(MixColumn_arch); 
    end for; 
  end for; 
end MixColumn_tb_conf; 