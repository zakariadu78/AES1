library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library lib_rtl;
library lib_aes;
use lib_aes.state_definition_package.all;


entity AES_tb is 
end entity AES_tb; 

architecture AES_tb_arch of AES_tb is 
  component AES is 
  port ( 
      start_i : in std_logic; 
      clock_i : in std_logic;
      reset_i : in std_logic;
      data_i : in type_state; 
      aes_on_o : out std_logic; 
      data_o : out type_state
      ); 
  end component AES;
  
  signal start_s, reset_s, aes_on_s : std_logic; 

  signal clock_s : std_logic := '0'; 
  signal data_i_s, data_o_s : type_state; 

  begin 
    DUT : AES 
      port map 
      (
        start_i => start_s,
        clock_i => clock_s,
        reset_i => reset_s,
        data_i => data_i_s,
        aes_on_o => aes_on_s,
        data_o => data_o_s
      );

    start_s <= '0', '1' after 60 ns, '0' after 85 ns, '1' after 560 ns, '0' after 585 ns;
    clock_s <= not clock_s after 10 ns;
    reset_s <= '0', '1' after 10 ns, '0' after 35 ns;
    data_i_s <= (
    (x"8c",x"11",x"35",x"44"),
    (x"06",x"ad",x"44",x"88"),
    (x"de",x"ca",x"ec",x"83"),
    (x"aa",x"03",x"43",x"06"));

end architecture AES_tb_arch; 