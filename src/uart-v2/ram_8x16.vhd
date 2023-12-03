----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:37 12/02/2023 
-- Design Name: 
-- Module Name:    ram_8x16 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_8x16 is
    Port ( address_i : in  STD_LOGIC_VECTOR(3 downto 0);
           data_o    : out STD_LOGIC_VECTOR(7 downto 0);
           data_i    : in  STD_LOGIC_VECTOR(7 downto 0);
           write_enable : in  STD_LOGIC);
end ram_8x16;

architecture Behavioral of ram_8x16 is
	type ram_type is array (0 to 15) of STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal memory : ram_type := (others => (others => '0'));
begin

	process (address_i, write_enable, data_i)
	begin
		if write_enable = '1' then
			memory(conv_integer(address_i)) <= data_i;
		end if;
		
		data_o <= memory(conv_integer(address_i));	
	end process;


end Behavioral;