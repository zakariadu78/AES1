library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

library lib_AES;
library lib_rtl; 
use lib_AES.state_definition_package.all;

entity Shiftrows is 
  port ( 
    Data_i : in type_state; 
    Data_o : out type_state
  ); 
end entity; 


architecture Shiftrows_arch of Shiftrows is 

begin 

Data_o(0)(0) <= Data_i(0)(0); 
Data_o(0)(1) <= Data_i(0)(0); 
Data_o(0)(2) <= Data_i(0)(0); 
Data_o(0)(3) <= Data_i(0)(0);

Data_o(1)(0) <= Data_i(1)(1); 
Data_o(1)(1) <= Data_i(1)(2); 
Data_o(1)(2) <= Data_i(1)(3); 
Data_o(1)(3) <= Data_i(1)(0);

Data_o(2)(0) <= Data_i(2)(2); 
Data_o(2)(1) <= Data_i(2)(3); 
Data_o(2)(2) <= Data_i(2)(0); 
Data_o(2)(3) <= Data_i(2)(1);

Data_o(3)(0) <= Data_i(3)(3); 
Data_o(3)(1) <= Data_i(3)(0); 
Data_o(3)(2) <= Data_i(3)(1); 
Data_o(3)(3) <= Data_i(3)(2);

end architecture; 