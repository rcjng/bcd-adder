-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   Ripple Carry Adder             :| V1.0 :| Robert Jiang			    :| 12/07/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Calculates the 4-bit unsigned sum of two 4-bit unsigned numbers taken as input using 4 full adders 
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity rc_adder is 
    
    port (
        A, B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        S : out std_logic_vector(3 downto 0);
        C_out : out std_logic);

end rc_adder;

-- architecture implementation
architecture rc_adder_arch of rc_adder is

    component full_adder is 
        
        port (
            A, B, C_in : in std_logic;
            S, C_out : out std_logic);

    end component;

    signal S_0, S_1, S_2, S_3, C_1, C_2, C_3 : std_logic;

begin
    
    add0 : full_adder port map (A => A(0), B => B(0), C_in => C_in, S => S_0, C_out => C_1);

    add1 : full_adder port map (A => A(1), B => B(1), C_in => C_1, S => S_1, C_out => C_2);

    add2 : full_adder port map (A => A(2), B => B(2), C_in => C_2, S => S_2, C_out => C_3);

    add3 : full_adder port map (A => A(3), B => B(3), C_in => C_3, S => S_3, C_out => C_out);

    S <= S_3 & S_2 & S_1 & S_0;
    
end rc_adder_arch;

