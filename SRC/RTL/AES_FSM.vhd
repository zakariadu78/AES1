library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;
library lib_rtl;
library lib_aes;
use lib_aes.state_definition_package.all;


entity FSM_AES is 
    port (
        clock_i: in std_logic;
        resetb_i : in std_logic;
        round_i : in bit4;
        start_i : in std_logic;
        done_o,enableCounter_o,enableMixColumn_o,
        enableOutput_o,enableRoundComputing_o,getciphertext_o,
        resetCounter_o : out std_logic
    ); 
end FSM_AES; 


architecture FSM_AES_Arch of FSM_AES is 

type etat is (idle,Round10 , Round9_1, Round0, fin );
signal etatPresent, etatFutur : etat; 


-- Description des transtions des états
begin

    init: process(clock_i,resetb_i)
    begin 
        if (resetb_i='0') then 
            etatPresent <= idle; 
        elsif  (clock_i'event and clock_i = '1') then
                etatPresent <= etatFutur;  
        else 
                etatPresent <= idle; 
        end if; 
    end process; 

    etats: process(etatPresent, round_i, start_i)
    begin 
    case etatPresent is 
        when idle =>
            if (start_i = '1') then 
                etatFutur <= Round10; 
            else 
                etatFutur <= etatPresent; 
            end if; 
        when Round10 =>
            if (round_i < "1010" and round_i > "0001") then 
                etatFutur <= Round9_1; 
            else 
                etatFutur <= etatPresent;
            end if; 
        when Round9_1 =>
            if (round_i = "0001") then 
                etatFutur <= Round0; 
            else 
                etatFutur <= etatPresent; 
            end if; 
        when Round0 => 
            if (round_i = "0000") then 
                etatFutur <= fin; 
            else 
                etatFutur <= etatPresent; 
            end if; 
        when fin => 
            if (start_i ='0') then 
                etatFutur <= idle; 
            else 
                etatFutur <= etatPresent; 
            end if; 
        end case; 
    end process; 

    sorties : process(etatPresent)
    begin 
            case etatPresent is 
                when idle => 
                    done_o <= '0';
                    enableMixColumn_o <= '0'; 
                    enableCounter_o <= '0';
                    enableOutput_o <= '0';
                    enableRoundComputing_o <= '0';
                    getciphertext_o <= '0';
                    resetCounter_o <= '1';
                when Round10 => 
                    done_o <= '0';
                    enableCounter_o <= '1';
                    enableOutput_o <= '0';
                    enableMixColumn_o <= '0'; 
                    enableRoundComputing_o <= '0'; -- Car on n'effectue que AddRoundKey
                    getciphertext_o <= '1';
                    resetCounter_o <= '0';
                when Round9_1 => 
                    done_o <= '0';
                    enableMixColumn_o <= '1'; 
                    enableCounter_o <= '1';
                    enableOutput_o <= '0';
                    enableRoundComputing_o <= '1';
                    getciphertext_o <= '0';
                    resetCounter_o <= '0';
                when Round0 => 
                    done_o <= '0';
                    enableMixColumn_o <= '0'; 
                    enableCounter_o <= '0'; -- Car on arrive à la fin
                    enableOutput_o <= '0';
                    enableRoundComputing_o <= '1';
                    getciphertext_o <= '0';
                    resetCounter_o <= '0';
                when fin => 
                    done_o <= '1';
                    enableMixColumn_o <= '0'; 
                    enableCounter_o <= '0'; 
                    enableOutput_o <= '1';
                    enableRoundComputing_o <= '0';
                    getciphertext_o <= '0';
                    resetCounter_o <= '0';
            end case; 
        end process; 
end FSM_AES_Arch; 
