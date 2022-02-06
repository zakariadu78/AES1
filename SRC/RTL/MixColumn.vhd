library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;

entity MixColumn is
port (
		data_i : in type_state;
		data_o : out type_state;
		mult2 : out column_state;
		mult3 : out column_state;
		mult4 : out column_state;
		mult8 : out column_state;
		mult9 : out column_state;
		multb : out column_state;
		multd : out column_state;
		multe : out column_state;
		enablemc_i : in std_logic);
end MixColumn;

architecture MixColumn_arch of MixColumn is

	signal mult2_1_s,mult4_1_s,mult8_1_s,mult9_1_s,mult3_1_s,multb_1_s,multd_1_s,multe_1_s  : column_state; 
	signal mult2_2_s,mult4_2_s,mult8_2_s,mult9_2_s,mult3_2_s,multb_2_s,multd_2_s,multe_2_s  : column_state; 
	signal mult2_3_s,mult4_3_s,mult8_3_s,mult9_3_s,mult3_3_s,multb_3_s,multd_3_s,multe_3_s  : column_state; 
	signal mult2_4_s,mult4_4_s,mult8_4_s,mult9_4_s,mult3_4_s,multb_4_s,multd_4_s,multe_4_s  : column_state; 

	signal col_i_1_s,col_i_2_s,col_i_3_s,col_i_4_s : column_state; 
	signal col_o_1_s,col_o_2_s,col_o_3_s,col_o_4_s :column_state;
	signal data_o_s : type_state;

begin


	col_i_1_s <= data_i(0);


	L0: for ligne in 0 to 3 generate		
			mult2_1_s(ligne) <= (col_i_1_s(ligne)(6 downto 0) & '0') xor "00011011" when col_i_1_s(ligne)(7) = '1' else col_i_1_s(ligne)(6 downto 0) &'0';
			mult4_1_s(ligne) <= (mult2_1_s(ligne)(6 downto 0) & '0') xor "00011011" when mult2_1_s(ligne)(7) = '1' else mult2_1_s(ligne)(6 downto 0) &'0';
			mult8_1_s(ligne) <= (mult4_1_s(ligne)(6 downto 0) & '0') xor "00011011" when mult4_1_s(ligne)(7) = '1' else mult4_1_s(ligne)(6 downto 0) &'0';
			mult9_1_s(ligne) <= mult8_1_s(ligne) xor col_i_1_s(ligne); 
			mult3_1_s(ligne) <= mult2_1_s(ligne) xor col_i_1_s(ligne);
			multb_1_s(ligne) <= mult8_1_s(ligne) xor mult3_1_s(ligne); 
			multd_1_s(ligne) <= mult9_1_s(ligne) xor mult4_1_s(ligne); 
			multe_1_s(ligne) <= multd_1_s(ligne) xor col_i_1_s(ligne);
	end generate L0;


	col_o_1_s(0) <= multe_1_s(0) xor multb_1_s(1) xor multd_1_s(2) xor mult9_1_s(3) ;
	col_o_1_s(1) <= mult9_1_s(0) xor multe_1_s(1) xor multb_1_s(2) xor multd_1_s(3) ;
	col_o_1_s(2) <= multd_1_s(0) xor mult9_1_s(1) xor multe_1_s(2) xor multb_1_s(3) ;
	col_o_1_s(3) <= multb_1_s(0) xor multd_1_s(1) xor mult9_1_s(2) xor multe_1_s(3) ;

	data_o_s(0) <= col_o_1_s;



	col_i_2_s <= data_i(1);


	L1: for ligne in 0 to 3 generate		
			mult2_2_s(ligne) <= (col_i_2_s(ligne)(6 downto 0) & '0') xor "00011011" when col_i_2_s(ligne)(7) = '1' else col_i_2_s(ligne)(6 downto 0) &'0';
			mult4_2_s(ligne) <= (mult2_2_s(ligne)(6 downto 0) & '0') xor "00011011" when mult2_2_s(ligne)(7) = '1' else mult2_2_s(ligne)(6 downto 0) &'0';
			mult8_2_s(ligne) <= (mult4_2_s(ligne)(6 downto 0) & '0') xor "00011011" when mult4_2_s(ligne)(7) = '1' else mult4_2_s(ligne)(6 downto 0) &'0';
			mult9_2_s(ligne) <= mult8_2_s(ligne) xor col_i_2_s(ligne); 
			mult3_2_s(ligne) <= mult2_2_s(ligne) xor col_i_2_s(ligne);
			multb_2_s(ligne) <= mult8_2_s(ligne) xor mult3_2_s(ligne); 
			multd_2_s(ligne) <= mult9_2_s(ligne) xor mult4_2_s(ligne); 
			multe_2_s(ligne) <= multd_2_s(ligne) xor col_i_2_s(ligne);
	end generate L1;


	col_o_2_s(0) <= multe_2_s(0) xor multb_2_s(1) xor multd_2_s(2) xor mult9_2_s(3) ;
	col_o_2_s(1) <= mult9_2_s(0) xor multe_2_s(1) xor multb_2_s(2) xor multd_2_s(3) ;
	col_o_2_s(2) <= multd_2_s(0) xor mult9_2_s(1) xor multe_2_s(2) xor multb_2_s(3) ;
	col_o_2_s(3) <= multb_2_s(0) xor multd_2_s(1) xor mult9_2_s(2) xor multe_2_s(3) ;

	data_o_s(1) <= col_o_2_s;
	



		col_i_3_s <= data_i(2);


	L2: for ligne in 0 to 3 generate		
			mult2_3_s(ligne) <= (col_i_3_s(ligne)(6 downto 0) & '0') xor "00011011" when col_i_3_s(ligne)(7) = '1' else col_i_3_s(ligne)(6 downto 0) &'0';
			mult4_3_s(ligne) <= (mult2_3_s(ligne)(6 downto 0) & '0') xor "00011011" when mult2_3_s(ligne)(7) = '1' else mult2_3_s(ligne)(6 downto 0) &'0';
			mult8_3_s(ligne) <= (mult4_3_s(ligne)(6 downto 0) & '0') xor "00011011" when mult4_3_s(ligne)(7) = '1' else mult4_3_s(ligne)(6 downto 0) &'0';
			mult9_3_s(ligne) <= mult8_3_s(ligne) xor col_i_3_s(ligne); 
			mult3_3_s(ligne) <= mult2_3_s(ligne) xor col_i_3_s(ligne);
			multb_3_s(ligne) <= mult8_3_s(ligne) xor mult3_3_s(ligne); 
			multd_3_s(ligne) <= mult9_3_s(ligne) xor mult4_3_s(ligne); 
			multe_3_s(ligne) <= multd_3_s(ligne) xor col_i_3_s(ligne);
	end generate L2;


	col_o_3_s(0) <= multe_3_s(0) xor multb_3_s(1) xor multd_3_s(2) xor mult9_3_s(3) ;
	col_o_3_s(1) <= mult9_3_s(0) xor multe_3_s(1) xor multb_3_s(2) xor multd_3_s(3) ;
	col_o_3_s(2) <= multd_3_s(0) xor mult9_3_s(1) xor multe_3_s(2) xor multb_3_s(3) ;
	col_o_3_s(3) <= multb_3_s(0) xor multd_3_s(1) xor mult9_3_s(2) xor multe_3_s(3) ;

	data_o_s(2) <= col_o_3_s;


		col_i_4_s <= data_i(3);


	L3: for ligne in 0 to 3 generate		
			mult2_4_s(ligne) <= (col_i_4_s(ligne)(6 downto 0) & '0') xor "00011011" when col_i_4_s(ligne)(7) = '1' else col_i_4_s(ligne)(6 downto 0) &'0';
			mult4_4_s(ligne) <= (mult2_4_s(ligne)(6 downto 0) & '0') xor "00011011" when mult2_4_s(ligne)(7) = '1' else mult2_4_s(ligne)(6 downto 0) &'0';
			mult8_4_s(ligne) <= (mult4_4_s(ligne)(6 downto 0) & '0') xor "00011011" when mult4_4_s(ligne)(7) = '1' else mult4_4_s(ligne)(6 downto 0) &'0';
			mult9_4_s(ligne) <= mult8_4_s(ligne) xor col_i_4_s(ligne); 
			mult3_4_s(ligne) <= mult2_4_s(ligne) xor col_i_4_s(ligne);
			multb_4_s(ligne) <= mult8_4_s(ligne) xor mult3_4_s(ligne); 
			multd_4_s(ligne) <= mult9_4_s(ligne) xor mult4_4_s(ligne); 
			multe_4_s(ligne) <= multd_4_s(ligne) xor col_i_4_s(ligne);
	end generate L3;


	col_o_4_s(0) <= multe_4_s(0) xor multb_4_s(1) xor multd_4_s(2) xor mult9_4_s(3) ;
	col_o_4_s(1) <= mult9_4_s(0) xor multe_4_s(1) xor multb_4_s(2) xor multd_4_s(3) ;
	col_o_4_s(2) <= multd_4_s(0) xor mult9_4_s(1) xor multe_4_s(2) xor multb_4_s(3) ;
	col_o_4_s(3) <= multb_4_s(0) xor multd_4_s(1) xor mult9_4_s(2) xor multe_4_s(3) ;

	data_o_s(3) <= col_o_4_s;


	mult2 <= mult2_1_s;
	mult3 <= mult3_1_s;
	mult4 <= mult4_1_s;
	mult8 <= mult8_1_s;
	mult9 <= mult9_1_s;
	multb <= multb_1_s;
	multd <= multd_1_s;
	multe <= multe_1_s;

data_o <= data_o_s when enablemc_i = '1' else data_i;


end MixColumn_arch;
