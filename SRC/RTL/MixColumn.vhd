library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;

entity MixColumn is
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
end MixColumn;

architecture MixColumn_arch of MixColumn is

	signal mult2_s,mult4_s,mult8_s,mult9_s,mult3_s,multb_s,multd_s,multe_s  : row_state; 
	signal col_i_s, col_o_s : row_state;
	signal data_o_s : type_state;

begin



L2 : for colonne in 0 to 3 generate
	col_i_s <= data_i(colonne);

	L1: for col in 0 to 3 generate		
			mult2_s(col) <= (col_i_s(col)(6 downto 0) & '0') xor x"1b" when col_i_s(col)(7) = '1' else col_i_s(col)(6 downto 0) &'0';
			mult4_s(col) <= (mult2_s(col)(6 downto 0) & '0') xor x"1b" when mult2_s(col)(7) = '1' else mult2_s(col)(6 downto 0) &'0';
			mult8_s(col) <= (mult4_s(col)(6 downto 0) & '0') xor x"1b" when mult4_s(col)(7) = '1' else mult4_s(col)(6 downto 0) &'0';
			mult9_s(col) <= mult8_s(col) xor col_i_s(col); 
			mult3_s(col) <= mult2_s(col) xor col_i_s(col);
			multb_s(col) <= mult8_s(col) xor mult3_s(col); 
			multd_s(col) <= mult9_s(col) xor mult4_s(col); 
			multe_s(col) <= mult9_s(col) xor mult4_s(col) xor col_i_s(col);
	end generate L1;


	col_o_s(0) <= multe_s(0) xor multb_s(1) xor multd_s(2) xor mult9_s(3) ;
	col_o_s(1) <= mult9_s(0) xor multe_s(1) xor multb_s(2) xor multd_s(3) ;
	col_o_s(2) <= multd_s(0) xor mult9_s(1) xor multe_s(2) xor multb_s(3) ;
	col_o_s(3) <= multb_s(0) xor multd_s(1) xor mult9_s(2) xor multe_s(3) ;

	data_o_s(colonne) <= col_o_s;

end generate L2; 
data_o <= data_o_s when enablemc_i = '1' else data_i;
mult2 <= mult2_s;
mult3 <= mult3_s; 
mult4 <= mult4_s;
mult8 <= mult8_s;
mult9 <= mult9_s;
multb <= multb_s;
multd <= multd_s; 
multe <= multe_s;  

end MixColumn_arch;
