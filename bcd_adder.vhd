-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   BCD Adder                      :| V1.0 :| Robert Jiang			    :| 12/09/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Calculates the 2-digit BCD sum of two 1-digit BCD numbers taken as input 
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity bcd_adder is
    
    port (
        X, Y : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        BCD : out std_logic_vector(7 downto 0);
        X_Y_GT_9 : out std_logic);

end bcd_adder;

-- architecture implementation
architecture bcd_adder_arch of bcd_adder is

    component bin5_to_bcd2 is port(
        
        BIN : in std_logic_vector (4 downto 0);
        BCD : out std_logic_vector (7 downto 0));

    end component;

    component rc_adder is 
        
        port (
            A, B : in std_logic_vector(3 downto 0);
            C_in : in std_logic;
            S : out std_logic_vector(3 downto 0);
            C_out : out std_logic);

    end component;

    signal S_rca: std_logic_vector(3 downto 0);
    signal C_out_rca : std_logic;

begin
    
    X_Y_GT_9 <= '1' when ((X > "1001") OR (Y > "1001")) else
                '0';

    add : rc_adder port map (A => X, B => Y, C_in => C_in, S => S_rca, C_out => C_out_rca);

    to_bcd : bin5_to_bcd2 port map (BIN => (C_out_rca & S_rca), BCD => BCD);

end bcd_adder_arch;

