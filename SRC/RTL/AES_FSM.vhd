LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY FSM_AES IS
    PORT (
        clock_i : IN STD_LOGIC;
        resetb_i : IN STD_LOGIC;
        round_i : IN bit4;
        start_i : IN STD_LOGIC;
        done_o, enableCounter_o, enableMixColumn_o,
        enableOutput_o, getciphertext_o,
        resetCounter_o, firstRound_o,idle_o : OUT STD_LOGIC
    );
END FSM_AES;

ARCHITECTURE FSM_AES_Arch OF FSM_AES IS
    
    TYPE etat IS (idle, Round10, Round9_1, Round0, fin);
    SIGNAL etatPresent, etatFutur : etat;
    -- Description des transtions des états

BEGIN

    init : PROCESS (clock_i, resetb_i)
    BEGIN
        IF (resetb_i = '1') THEN
            etatPresent <= Round10;
        ELSIF (clock_i'event AND clock_i = '1') THEN
            etatPresent <= etatFutur;
        END IF;
    END PROCESS;

    etats : PROCESS (etatPresent, round_i, start_i)
    BEGIN
        CASE etatPresent IS
            WHEN idle =>
                IF (start_i = '1') THEN
                    etatFutur <= Round10;
                ELSE
                    etatFutur <= etatPresent;
                END IF;
            WHEN Round10 =>
                IF (round_i < "1010" AND round_i > "0001") THEN
                    etatFutur <= Round9_1;
                ELSE
                    etatFutur <= etatPresent;
                END IF;
            WHEN Round9_1 =>
                IF (round_i = "0001") THEN
                    etatFutur <= Round0;
                ELSE
                    etatFutur <= etatPresent;
                END IF;
            WHEN Round0 =>
                IF (round_i = "0000") THEN
                    etatFutur <= fin;
                ELSE
                    etatFutur <= etatPresent;
                END IF;
            WHEN fin =>
                IF (start_i = '0') THEN
                    etatFutur <= idle;
                ELSE
                    etatFutur <= etatPresent;
                END IF;
        END CASE;
    END PROCESS;

    sorties : PROCESS (etatPresent)
    BEGIN

        CASE etatPresent IS
            WHEN idle =>
                done_o <= '0';
                enableMixColumn_o <= '0';
                firstRound_o <= '0';
                enableCounter_o <= '0';
                enableOutput_o <= '0';
                getciphertext_o <= '0';
                resetCounter_o <= '1';
                idle_o <= '1';
            WHEN Round10 =>
                done_o <= '0';
                enableCounter_o <= '1';
                enableOutput_o <= '0';
                enableMixColumn_o <= '0';
                firstRound_o <= '1';
                getciphertext_o <= '1';
                resetCounter_o <= '0';
                idle_o <= '0';
            WHEN Round9_1 =>
                done_o <= '0';
                enableMixColumn_o <= '1';
                enableCounter_o <= '1';
                enableOutput_o <= '0';
                firstRound_o <= '0';
                getciphertext_o <= '0';
                resetCounter_o <= '0';
                idle_o <= '0';
            WHEN Round0 =>
                done_o <= '0';
                enableMixColumn_o <= '0';
                enableCounter_o <= '0';
                enableOutput_o <= '0';
                firstRound_o <= '0';
                getciphertext_o <= '0';
                resetCounter_o <= '0';
                idle_o <= '0';
            WHEN fin =>
                done_o <= '1';
                enableMixColumn_o <= '0';
                enableCounter_o <= '0';
                enableOutput_o <= '1';
                firstRound_o <= '0';
                getciphertext_o <= '0';
                resetCounter_o <= '0';
                idle_o <= '0';
        END CASE;
    END PROCESS;
END FSM_AES_Arch;
