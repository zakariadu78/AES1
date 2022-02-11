LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;
ENTITY FSM_AES_MOORE IS
    PORT (
        clock_i : IN STD_LOGIC;
        reset_i : IN STD_LOGIC;
        round_i : IN bit4;
        start_i : IN STD_LOGIC;
        done_o, enableCounter_o, enableMixColumn_o,
        enableOutput_o, getciphertext_o,
        resetCounter_o, firstRound_o, idle_o : OUT STD_LOGIC
    );
END FSM_AES_MOORE;

ARCHITECTURE FSM_AES_MOORE_Arch OF FSM_AES_MOORE IS

    TYPE etat IS (idle, Round10, Round9_1, Round0, fin);
    SIGNAL etatPresent, etatFutur : etat;
    -- Description des transtions des états

BEGIN

    init : PROCESS (clock_i, reset_i)
    BEGIN
        IF (reset_i = '1') THEN
            etatPresent <= idle;
        ELSIF (clock_i'event AND clock_i = '1') THEN
            etatPresent <= etatFutur;
        ELSE
            etatPresent <= etatPresent;
        END IF;
    END PROCESS;

    etats : PROCESS (etatPresent, round_i, start_i, clock_i)
    BEGIN
        CASE etatPresent IS
            WHEN idle =>
                IF (start_i = '1') THEN
                    etatFutur <= Round10;
                ELSE
                    etatFutur <= etatPresent;
                END IF;
            WHEN Round10 =>
                etatFutur <= Round9_1;
            WHEN Round9_1 =>
                IF (round_i = "0001") THEN
                    etatFutur <= Round0;
                END IF;
            WHEN Round0 =>
                IF (round_i = "0000") THEN
                    etatFutur <= fin;

                END IF;
            WHEN fin =>
                IF (start_i = '0') THEN
                    etatFutur <= idle;

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
                getciphertext_o <= '0';
                resetCounter_o <= '0';
                idle_o <= '0';
            WHEN Round9_1 =>
                done_o <= '0';
                enableMixColumn_o <= '1';
                enableCounter_o <= '1';
                enableOutput_o <= '0';
                firstRound_o <= '0';
                getciphertext_o <= '1';
                resetCounter_o <= '0';
                idle_o <= '0';
            WHEN Round0 =>
                done_o <= '0';
                enableMixColumn_o <= '0';
                enableCounter_o <= '0';
                enableOutput_o <= '0';
                firstRound_o <= '0';
                getciphertext_o <= '1';
                resetCounter_o <= '0';
                idle_o <= '0';
            WHEN fin =>
                done_o <= '1';
                enableMixColumn_o <= '0';
                enableCounter_o <= '0';
                enableOutput_o <= '1';
                firstRound_o <= '0';
                getciphertext_o <= '1';
                resetCounter_o <= '0';
                idle_o <= '0';
        END CASE;
    END PROCESS;
END FSM_AES_MOORE_Arch;