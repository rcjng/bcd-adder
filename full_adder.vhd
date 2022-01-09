-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   Full Adder                     :| V1.0 :| Robert Jiang			    :| 12/07/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Calculates the 1-bit unsigned sum of two 1-bit unsigned numbers and a 1-bit unsigned carry-in taken as input 
-- =============================================================================================================

-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity full_adder is 
    
    port (
        A, B, C_in : in std_logic;
        S, C_out : out std_logic);

end full_adder;

-- architecture implementation
architecture full_adder_arch of full_adder is
    
    signal A_XOR_B : std_logic;

begin
    
    A_XOR_B <= A XOR B;

    S <= A_XOR_B XOR C_in;

    C_out <= (A_XOR_B AND C_in) OR (A AND B);
    
end full_adder_arch;

