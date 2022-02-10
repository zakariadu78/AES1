LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY MixColumn IS
	PORT (
		data_i : IN type_state;
		data_o : OUT type_state;
		enablemc_i : IN STD_LOGIC);
END MixColumn;

ARCHITECTURE MixColumn_arch OF MixColumn IS

	SIGNAL mult2_s, mult4_s, mult8_s, mult9_s, multb_s, multd_s, multe_s : type_state;
	SIGNAL col_i_s : type_state;
	SIGNAL col_o_s : type_state;
	SIGNAL data_o_s : type_state;

BEGIN
	L0 : FOR colonne IN 0 TO 3 GENERATE
		col_i_s(colonne) <= data_i(colonne);
		L1 : FOR ligne IN 0 TO 3 GENERATE
			mult2_s(ligne)(colonne) <= (col_i_s(ligne)(colonne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN col_i_s(ligne)(colonne)(7) = '1' ELSE
			col_i_s(ligne)(colonne)(6 DOWNTO 0) & '0';
			mult4_s(ligne)(colonne) <= (mult2_s(ligne)(colonne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult2_s(ligne)(colonne)(7) = '1' ELSE
			mult2_s(ligne)(colonne)(6 DOWNTO 0) & '0';
			mult8_s(ligne)(colonne) <= (mult4_s(ligne)(colonne)(6 DOWNTO 0) & '0') XOR "00011011" WHEN mult4_s(ligne)(colonne)(7) = '1' ELSE
			mult4_s(ligne)(colonne)(6 DOWNTO 0) & '0';
			mult9_s(ligne)(colonne) <= mult8_s(ligne)(colonne) XOR col_i_s(ligne)(colonne);
			multb_s(ligne)(colonne) <= mult8_s(ligne)(colonne) XOR mult2_s(ligne)(colonne) XOR col_i_s(ligne)(colonne);
			multd_s(ligne)(colonne) <= mult8_s(ligne)(colonne) XOR mult4_s(ligne)(colonne) XOR col_i_s(ligne)(colonne);
			multe_s(ligne)(colonne) <= mult8_s(ligne)(colonne) XOR mult4_s(ligne)(colonne) XOR mult2_s(ligne)(colonne);
		END GENERATE L1;

		col_o_s(0)(colonne) <= multe_s(0)(colonne) XOR multb_s(1)(colonne) XOR multd_s(2)(colonne) XOR mult9_s(3)(colonne);
		col_o_s(1)(colonne) <= mult9_s(0)(colonne) XOR multe_s(1)(colonne) XOR multb_s(2)(colonne) XOR multd_s(3)(colonne);
		col_o_s(2)(colonne) <= multd_s(0)(colonne) XOR mult9_s(1)(colonne) XOR multe_s(2)(colonne) XOR multb_s(3)(colonne);
		col_o_s(3)(colonne) <= multb_s(0)(colonne) XOR multd_s(1)(colonne) XOR mult9_s(2)(colonne) XOR multe_s(3)(colonne);

		data_o_s(colonne) <= col_o_s(colonne);
	END GENERATE L0;

	data_o <= data_o_s WHEN enablemc_i = '1' ELSE
		data_i;
END MixColumn_arch;