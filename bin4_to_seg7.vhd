-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   Binary to 7-Segment            :| V1.0 :| Robert Jiang			    :| 12/10/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Converts 4-bit binary to 2-display 7-segment 
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity bin4_to_seg7 is 
    
    port (
        BIN : in std_logic_vector (3 downto 0);
        HEX0, HEX1 : out std_logic_vector (7 downto 0));

end bin4_to_seg7;

-- architecture implementation
architecture bin4_to_seg7_arch of bin4_to_seg7 is

    component bcd2_to_seg7 is 
        
        port (
            BCD : in std_logic_vector(7 downto 0);
            HEX0, HEX1 : out std_logic_vector(7 downto 0));

    end component;

    signal BCD1, BCD0 : std_logic_vector (3 downto 0);

begin
    
    BCD1 <=     "0001" when (BIN > "1001") else
                "0000" when (BIN < "1010") else
                "0000";

    BCD0 <= std_logic_vector ( unsigned (BIN) mod 10);

    to_7seg : bcd2_to_seg7 port map (BCD => (BCD1 & BCD0), HEX0 => HEX0, HEX1 => HEX1);

end bin4_to_seg7_arch;

