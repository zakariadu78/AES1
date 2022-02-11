LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY lib_rtl;
LIBRARY lib_aes;
USE lib_aes.state_definition_package.ALL;

ENTITY AES IS
    PORT (
        start_i : IN STD_LOGIC;
        clock_i : IN STD_LOGIC;
        reset_i : IN STD_LOGIC;
        data_i : IN type_state;
        aes_on_o : OUT STD_LOGIC;
        data_o : OUT bit128
    );

END ENTITY AES;

ARCHITECTURE AES_arch OF AES IS

    COMPONENT Counter IS
        PORT (
            reset_i : IN STD_LOGIC;
            enable_i : IN STD_LOGIC;
            clock_i : IN STD_LOGIC;
            count_o : OUT bit4
        );
    END COMPONENT Counter;

    COMPONENT FSM_AES_MOORE IS
        PORT (
            clock_i : IN STD_LOGIC;
            reset_i : IN STD_LOGIC;
            round_i : IN bit4;
            start_i : IN STD_LOGIC;
            done_o, enableCounter_o, enableMixColumn_o,
            enableOutput_o, firstRound_o, getciphertext_o,
            resetCounter_o, idle_o : OUT STD_LOGIC
        );
    END COMPONENT FSM_AES_MOORE;

    COMPONENT KeyExpansion_table IS
        PORT (
            round_i : IN bit4;
            expansion_key_o : OUT type_key
        );
    END COMPONENT KeyExpansion_table;

    COMPONENT AES_Round IS
        PORT (
            clock_i : IN STD_LOGIC;
            currentKey_i : IN type_key;
            currentText_i : IN type_state;
            enableInvMixColumns_i : IN STD_LOGIC;
            firstRound_i : IN STD_LOGIC;
            idle_i : IN STD_LOGIC;
            data_o : OUT type_state
        );
    END COMPONENT AES_Round;

    COMPONENT MUX IS
        PORT (
            I0_i : IN type_state;
            I1_i : IN type_state;
            S_i : IN STD_LOGIC;
            O_o : OUT type_state);
    END COMPONENT MUX;

    COMPONENT stateToBit128 IS
        PORT (
            entree_i : IN type_state;
            sortie_o : OUT bit128
        );
    END COMPONENT stateToBit128;

    SIGNAL Counter_s : bit4;
    SIGNAL done_s, enableCounter_s, enableMixColumn_s, enableOutput_s,
    firstRound_s, getciphertext_s, resetCounter_s : STD_LOGIC;
    SIGNAL ExpansionKey_s : type_key;
    SIGNAL data_o_s : type_state;
    SIGNAL currentText_s : type_state;
    SIGNAL state_s : type_state;
    SIGNAL idle_s : STD_LOGIC;
BEGIN

    Compteur : Counter
    PORT MAP(
        clock_i => clock_i,
        enable_i => enableCounter_s,
        reset_i => resetCounter_s,
        count_o => Counter_s
    );

    FSM : FSM_AES_MOORE
    PORT MAP(
        clock_i => clock_i,
        reset_i => reset_i,
        round_i => Counter_s,
        start_i => start_i,
        done_o => aes_on_o,
        enableCounter_o => enableCounter_s,
        enableMixColumn_o => enableMixColumn_s,
        enableOutput_o => enableOutput_s,
        firstRound_o => firstRound_s,
        getciphertext_o => getciphertext_s,
        resetCounter_o => resetCounter_s,
        idle_o => idle_s
    );

    KEY : KeyExpansion_table
    PORT MAP(
        round_i => Counter_s,
        expansion_key_o => ExpansionKey_s
    );

    AESROUND : AES_Round
    PORT MAP(
        clock_i => clock_i,
        currentKey_i => ExpansionKey_s,
        currentText_i => currentText_s,
        enableInvMixColumns_i => enableMixColumn_s,
        firstRound_i => firstRound_s,
        data_o => data_o_s,
        idle_i => idle_s
    );

    MULTIPLEXEUR : MUX
    PORT MAP(
        I0_i => data_i,
        I1_i => data_o_s,
        S_i => getciphertext_s,
        O_o => currentText_s
    );
    seq_0 : PROCESS (clock_i, reset_i) IS
    BEGIN -- process seq_0
        IF reset_i = '1' THEN -- asynchronous reset (active-low)
            state_s <= ((OTHERS => (OTHERS => (OTHERS => '0'))));
            -- or use 2 x for ... generate
        ELSE
            IF clock_i'event AND clock_i = '1' THEN
                IF enableOutput_s = '1' THEN -- rising clock
                    state_s <= data_o_s;
                END IF;
            END IF;
        END IF;
    END PROCESS seq_0;

    STATETO128 : stateToBit128
    PORT MAP(
        entree_i => state_s,
        sortie_o => data_o
    );
END AES_arch;