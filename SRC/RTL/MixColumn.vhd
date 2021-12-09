library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;
library LIB_RTL;

entity MixColumn is
port (
		data_i : in type_state;
		data_o : out type_state;
		mult3 : out type_state;
		mult2 : out type_state;
		enablemc_i : in std_logic);
end MixColumn;

architecture MixColumn_arch of MixColumn is

  signal mult2_s : type_state; 
  signal mult3_s : type_state; 
  signal data_i_s, data_o_s : type_state; 
begin


L1: for row in 0 to 3 generate
	L2: for col in 0 to 3 generate
		
		mult2_s(row)(col) <= data_i(row)(col)(6 downto 0) &'0' xor "00011011" when data_i(row)(col)(7) = '1' else data_i(row)(col)(6 downto 0) &'0';


	end generate L2;
end generate L1;

L3: for row in 0 to 3 generate
	L4: for col in 0 to 3 generate
		mult3_s(row)(col) <= mult2_s(row)(col) xor data_i(row)(col);
	end generate L4;
end generate L3;

L5: for col in 0 to 3 generate
	data_o(0)(col) <= mult2_s(0)(col) xor mult3_s(1)(col) xor data_i(2)(col) xor data_i(3)(col) ;
	data_o(1)(col) <= data_i(0)(col) xor mult2_s(1)(col) xor mult3_s(2)(col)  xor data_i(3)(col) ;
	data_o(2)(col) <= data_i(0)(col) xor data_i(1)(col) xor mult2_s(2)(col) xor mult3_s(3)(col) ;
	data_o(3)(col) <= mult3_s(0)(col) xor data_i(1)(col) xor data_i(2)(col) xor mult2_s(3)(col) ;
end generate L5;

data_o <= data_o_s when enablemc_i = '1' else data_i;
mult3 <= mult3_s; 
mult2 <= mult2_s;

end MixColumn_arch;
