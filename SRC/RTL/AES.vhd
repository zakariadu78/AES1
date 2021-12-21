library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library LIB_AES;
use lib_aes.state_definition_package.all;

entity AES is 
port ( 
    start_i : in std_logic; 
    clock_i : in std_logic;
    reset_i : in std_logic;
    data_i : in type_state; 
    aes_on_o : out std_logic; 
    data_o : out type_state
    ); 

end entity AES; 



architecture AES_arch of AES is 

    component Counter is 
    port(
        resetb_i : in  std_logic;
        enable_i : in  std_logic;
        clock_i  : in  std_logic;
        count_o  : out bit4
        );
    end component Counter;

    component FSM_AES is 
    port (
        clock_i: in std_logic;
        resetb_i : in std_logic;
        round_i : in bit4;
        start_i : in std_logic;
        done_o,enableCounter_o,enableMixColumn_o,
        enableOutput_o,enableRoundComputing_o,getciphertext_o,
        resetCounter_o : out std_logic
    ); 
    end component FSM_AES; 

    component KeyExpansion_table is
    port (
        round_i         : in  bit4;
        expansion_key_o : out type_key
    );
    end component KeyExpansion_table;

    component AES_Round is 
    port ( 
        clock_i : in std_logic; 
        currentKey_i : in type_key; 
        currentText_i : in type_state; 
        enableInvMixColumns_i : in std_logic; 
        enableRoundComputing_i : in std_logic; 
        Reset_i : in std_logic;
        data_o : out type_state
        ); 
    end component AES_Round; 

    component MUX is 
port (
  I0 : in type_state; 
  I1 : in type_state; 
  S  : in std_logic; 
  O : out type_state); 
end component MUX; 
signal Counter_s : bit4; 
signal done_s,enableCounter_s,enableMixColumn_s,enableOutput_s,
enableRoundComputing_s,getciphertext_s,resetCounter_s : std_logic; 
signal ExpansionKey_s : type_key; 
signal data_o_s : type_state;
signal currentText_s : type_state; 
signal state_s : type_state; 

begin

    Compteur : Counter 
        port map (
            clock_i => clock_i,
            enable_i => enableCounter_s,
            resetb_i => resetCounter_s,
            count_o => Counter_s
        );

    FSM : FSM_AES
        port map (
            clock_i => clock_i,
            resetb_i => reset_i,
            round_i => Counter_s,
            start_i => start_i,
            done_o => aes_on_o,
            enableCounter_o => enableCounter_s,
            enableMixColumn_o => enableMixColumn_s,
            enableOutput_o => enableOutput_s,
            enableRoundComputing_o => enableRoundComputing_s,
            getciphertext_o => getciphertext_s,
            resetCounter_o => resetCounter_s
        );

    KEY : KeyExpansion_table
        port map (
            round_i => Counter_s,
            expansion_key_o => ExpansionKey_s
        );

    AESROUND : AES_Round
        port map (
            clock_i => clock_i,
            currentKey_i => ExpansionKey_s,
            currentText_i => currentText_s,
            enableInvMixColumns_i => enableMixColumn_s,
            enableRoundComputing_i => enableRoundComputing_s,
            Reset_i => reset_i,
            data_o => data_o_s
        );

    MULTIPLEXEUR : MUX 
        port map (
            I0 => data_i,
            I1 => data_o_s,
            S => getciphertext_s,
            O => currentText_s
        );

    seq_0 : process (clock_i, reset_i) is
    begin -- process seq_0
    if reset_i = '0' then -- asynchronous reset (active-low)
        state_s <= ((others => (others => (others => '0'))));
    -- or use 2 x for ... generate
    elsif clock_i'event and clock_i = '1' and enableOutput_s = '1' then -- rising clock
        state_s <= data_o_s;
    end if;
    end process seq_0;
end AES_arch; 