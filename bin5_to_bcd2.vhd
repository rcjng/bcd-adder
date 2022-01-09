-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   Binary to BCD                  :| V1.0 :| Robert Jiang			    :| 12/07/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Converts 5-bit unsigned binary to 2-digit BCD
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity bin5_to_bcd2 is 
    
    port (
        BIN : in std_logic_vector (4 downto 0);
        BCD : out std_logic_vector (7 downto 0));

end bin5_to_bcd2;

-- architecture implementation
architecture bin5_to_bcd2_arch of bin5_to_bcd2 is
    
    signal BCD1, BCD0 : std_logic_vector (3 downto 0);
    signal BCD0_temp : std_logic_vector (4 downto 0);
    
begin
    
    BCD1 <= "0000" when ((BIN < "01010") AND (BIN >= "00000")) else
            "0001" when ((BIN > "01001") AND (BIN <= "10011")) else
            "0010" when ((BIN > "10011") AND (BIN <= "11101")) else
            "0011" when ((BIN > "11101") AND (BIN <= "11111")) else
            "0000";
    
    BCD0_temp <= std_logic_vector ( unsigned (BIN) mod 10);

    BCD0 <= BCD0_temp (3 downto 0);

    BCD <= BCD1 & BCD0;

end bin5_to_bcd2_arch;

