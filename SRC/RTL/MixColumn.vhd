LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY LIB_AES;
USE lib_aes.state_definition_package.ALL;

ENTITY MixColumn IS
	PORT (
		data_i : IN type_state;
		data_o : OUT type_state;
		mult2 : OUT column_state;
		mult3 : OUT column_state;
		mult4 : OUT column_state;
		mult8 : OUT column_state;
		mult9 : OUT column_state;
		multb : OUT column_state;
		multd : OUT column_state;
		multe : OUT column_state;
		enablemc_i : IN STD_LOGIC);
END MixColumn;

ARCHITECTURE MixColumn_arch OF MixColumn IS

	SIGNAL mult2_1_s, mult4_1_s, mult8_1_s, mult9_1_s, mult3_1_s, multb_1_s, multd_1_s, multe_1_s : column_state;
	SIGNAL mult2_2_s, mult4_2_s, mult8_2_s, mult9_2_s, mult3_2_s, multb_2_s, multd_2_s, multe_2_s : column_state;
	SIGNAL mult2_3_s, mult4_3_s, mult8_3_s, mult9_3_s, mult3_3_s, multb_3_s, multd_3_s, multe_3_s : column_state;
	SIGNAL mult2_4_s, mult4_4_s, mult8_4_s, mult9_4_s, mult3_4_s, multb_4_s, multd_4_s, multe_4_s : column_state;

	SIGNAL col_i_1_s, col_i_2_s, col_i_3_s, col_i_4_s : column_state;
	SIGNAL col_o_1_s, col_o_2_s, col_o_3_s, col_o_4_s : column_state;
	SIGNAL data_o_s : type_state;

BEGIN
	col_i_1_s <= data_i(0);
	L0 : FOR ligne IN 0 TO 3 GENERATE
		mult2_1_s(ligne) <= (col_i_1_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN col_i_1_s(ligne)(7) = '1' ELSE
		col_i_1_s(ligne)(6 DOWNTO 0) & '0';
		mult4_1_s(ligne) <= (mult2_1_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult2_1_s(ligne)(7) = '1' ELSE
		mult2_1_s(ligne)(6 DOWNTO 0) & '0';
		mult8_1_s(ligne) <= (mult4_1_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult4_1_s(ligne)(7) = '1' ELSE
		mult4_1_s(ligne)(6 DOWNTO 0) & '0';
		mult9_1_s(ligne) <= mult8_1_s(ligne) XOR col_i_1_s(ligne);
		mult3_1_s(ligne) <= mult2_1_s(ligne) XOR col_i_1_s(ligne);
		multb_1_s(ligne) <= mult8_1_s(ligne) XOR mult3_1_s(ligne);
		multd_1_s(ligne) <= mult9_1_s(ligne) XOR mult4_1_s(ligne);
		multe_1_s(ligne) <= multd_1_s(ligne) xor mult2_1_s(ligne) xor col_i_1_s(ligne);
	END GENERATE L0;
	col_o_1_s(0) <= multe_1_s(0) XOR multb_1_s(1) XOR multd_1_s(2) XOR mult9_1_s(3);
	col_o_1_s(1) <= mult9_1_s(0) XOR multe_1_s(1) XOR multb_1_s(2) XOR multd_1_s(3);
	col_o_1_s(2) <= multd_1_s(0) XOR mult9_1_s(1) XOR multe_1_s(2) XOR multb_1_s(3);
	col_o_1_s(3) <= multb_1_s(0) XOR multd_1_s(1) XOR mult9_1_s(2) XOR multe_1_s(3);

	data_o_s(0) <= col_o_1_s;

	col_i_2_s <= data_i(1);
	L1 : FOR ligne IN 0 TO 3 GENERATE
		mult2_2_s(ligne) <= (col_i_2_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN col_i_2_s(ligne)(7) = '1' ELSE
		col_i_2_s(ligne)(6 DOWNTO 0) & '0';
		mult4_2_s(ligne) <= (mult2_2_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult2_2_s(ligne)(7) = '1' ELSE
		mult2_2_s(ligne)(6 DOWNTO 0) & '0';
		mult8_2_s(ligne) <= (mult4_2_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult4_2_s(ligne)(7) = '1' ELSE
		mult4_2_s(ligne)(6 DOWNTO 0) & '0';
		mult9_2_s(ligne) <= mult8_2_s(ligne) XOR col_i_2_s(ligne);
		mult3_2_s(ligne) <= mult2_2_s(ligne) XOR col_i_2_s(ligne);
		multb_2_s(ligne) <= mult8_2_s(ligne) XOR mult3_2_s(ligne);
		multd_2_s(ligne) <= mult9_2_s(ligne) XOR mult4_2_s(ligne);
		multe_2_s(ligne) <= multd_2_s(ligne) xor mult2_2_s(ligne) xor col_i_2_s(ligne);
	END GENERATE L1;
	col_o_2_s(0) <= multe_2_s(0) XOR multb_2_s(1) XOR multd_2_s(2) XOR mult9_2_s(3);
	col_o_2_s(1) <= mult9_2_s(0) XOR multe_2_s(1) XOR multb_2_s(2) XOR multd_2_s(3);
	col_o_2_s(2) <= multd_2_s(0) XOR mult9_2_s(1) XOR multe_2_s(2) XOR multb_2_s(3);
	col_o_2_s(3) <= multb_2_s(0) XOR multd_2_s(1) XOR mult9_2_s(2) XOR multe_2_s(3);

	data_o_s(1) <= col_o_2_s;
	col_i_3_s <= data_i(2);
	L2 : FOR ligne IN 0 TO 3 GENERATE
		mult2_3_s(ligne) <= (col_i_3_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN col_i_3_s(ligne)(7) = '1' ELSE
		col_i_3_s(ligne)(6 DOWNTO 0) & '0';
		mult4_3_s(ligne) <= (mult2_3_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult2_3_s(ligne)(7) = '1' ELSE
		mult2_3_s(ligne)(6 DOWNTO 0) & '0';
		mult8_3_s(ligne) <= (mult4_3_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult4_3_s(ligne)(7) = '1' ELSE
		mult4_3_s(ligne)(6 DOWNTO 0) & '0';
		mult9_3_s(ligne) <= mult8_3_s(ligne) XOR col_i_3_s(ligne);
		mult3_3_s(ligne) <= mult2_3_s(ligne) XOR col_i_3_s(ligne);
		multb_3_s(ligne) <= mult8_3_s(ligne) XOR mult3_3_s(ligne);
		multd_3_s(ligne) <= mult9_3_s(ligne) XOR mult4_3_s(ligne);
		multe_3_s(ligne) <= multd_3_s(ligne) xor mult2_3_s(ligne) xor col_i_3_s(ligne);
	END GENERATE L2;
	col_o_3_s(0) <= multe_3_s(0) XOR multb_3_s(1) XOR multd_3_s(2) XOR mult9_3_s(3);
	col_o_3_s(1) <= mult9_3_s(0) XOR multe_3_s(1) XOR multb_3_s(2) XOR multd_3_s(3);
	col_o_3_s(2) <= multd_3_s(0) XOR mult9_3_s(1) XOR multe_3_s(2) XOR multb_3_s(3);
	col_o_3_s(3) <= multb_3_s(0) XOR multd_3_s(1) XOR mult9_3_s(2) XOR multe_3_s(3);

	data_o_s(2) <= col_o_3_s;
	col_i_4_s <= data_i(3);
	L3 : FOR ligne IN 0 TO 3 GENERATE
		mult2_4_s(ligne) <= (col_i_4_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN col_i_4_s(ligne)(7) = '1' ELSE
		col_i_4_s(ligne)(6 DOWNTO 0) & '0';
		mult4_4_s(ligne) <= (mult2_4_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult2_4_s(ligne)(7) = '1' ELSE
		mult2_4_s(ligne)(6 DOWNTO 0) & '0';
		mult8_4_s(ligne) <= (mult4_4_s(ligne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult4_4_s(ligne)(7) = '1' ELSE
		mult4_4_s(ligne)(6 DOWNTO 0) & '0';
		mult9_4_s(ligne) <= mult8_4_s(ligne) XOR col_i_4_s(ligne);
		mult3_4_s(ligne) <= mult2_4_s(ligne) XOR col_i_4_s(ligne);
		multb_4_s(ligne) <= mult8_4_s(ligne) XOR mult3_4_s(ligne);
		multd_4_s(ligne) <= mult9_4_s(ligne) XOR mult4_4_s(ligne);
		multe_4_s(ligne) <= multd_4_s(ligne) xor mult2_4_s(ligne) xor col_i_4_s(ligne);
	END GENERATE L3;
	col_o_4_s(0) <= multe_4_s(0) XOR multb_4_s(1) XOR multd_4_s(2) XOR mult9_4_s(3);
	col_o_4_s(1) <= mult9_4_s(0) XOR multe_4_s(1) XOR multb_4_s(2) XOR multd_4_s(3);
	col_o_4_s(2) <= multd_4_s(0) XOR mult9_4_s(1) XOR multe_4_s(2) XOR multb_4_s(3);
	col_o_4_s(3) <= multb_4_s(0) XOR multd_4_s(1) XOR mult9_4_s(2) XOR multe_4_s(3);

	data_o_s(3) <= col_o_4_s;
	mult2 <= mult2_1_s;
	mult3 <= mult3_1_s;
	mult4 <= mult4_1_s;
	mult8 <= mult8_1_s;
	mult9 <= mult9_1_s;
	multb <= multb_1_s;
	multd <= multd_1_s;
	multe <= multe_1_s;

	data_o <= data_o_s WHEN enablemc_i = '1' ELSE
		data_i;
END MixColumn_arch;