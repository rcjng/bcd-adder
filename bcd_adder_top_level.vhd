-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   BCD Adder Top Level            :| V1.0 :| Robert Jiang			    :| 12/10/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Calculates and outputs the sum of two 4-bit BCD numbers on 6-display 7-segment
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity bcd_adder_top_level is 
    
    port (
        X, Y : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        HEX0, HEX1 : out std_logic_vector (7 downto 0);
        X_Y_GT_9 : out std_logic);
    
end bcd_adder_top_level;

-- architecture implementation
architecture bcd_adder_top_level_arch of bcd_adder_top_level is

    component bcd_adder is 
        
        port (
            X, Y : in std_logic_vector(3 downto 0);
            C_in : in std_logic;
            BCD : out std_logic_vector(7 downto 0);
            X_Y_GT_9 : out std_logic);

    end component;
    
    component bcd2_to_seg7 is 
        
        port (
            BCD : in std_logic_vector(7 downto 0);
            HEX0, HEX1 : out std_logic_vector(7 downto 0));

    end component;

    signal BCD : std_logic_vector(7 downto 0);

begin
    
    add : bcd_adder port map (X => X, Y => Y, C_in => C_in, BCD => BCD, X_Y_GT_9 => X_Y_GT_9);

    to_7seg : bcd2_to_seg7 port map (BCD => BCD, HEX0 => HEX0, HEX1 => HEX1);

end bcd_adder_top_level_arch;

