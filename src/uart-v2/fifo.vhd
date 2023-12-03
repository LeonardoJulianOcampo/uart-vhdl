----------------------------------------------------------------------------------
-- Company: 
-- Autor: Leonardo Ocampo 
-- 
-- Create Date:    23:34:16 12/02/2023 
-- Design Name: 
-- Module Name:    fifo - Behavioral 
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

entity fifo is
    Port ( push_in     : in   STD_LOGIC;
           pop_in      : in   STD_LOGIC;
           clk_in      : in   STD_LOGIC;
           reset_in    : in   STD_LOGIC;
           data_in     : in   STD_LOGIC_VECTOR (7 downto 0);
           data_out    : out  STD_LOGIC_VECTOR (7 downto 0);
           full_out    : out  STD_LOGIC;
           empty_out   : out  STD_LOGIC;
			  write_ena   : out  STD_LOGIC;
			  address_out : out  STD_LOGIC_VECTOR (2 downto 0));
end fifo;

architecture Behavioral of fifo is
-- This is a sample state-machine using enumerated types.
-- This will allow the synthesis tool to select the appropriate
-- encoding style and will make the code more readable.
	constant origin        : std_logic_vector (2 downto 0) := B"000"   --direccion de inicio
	constant end_reg       : std_logic_vector (2 downto 0) := B"111";  --direccion final
--Insert the following in the architecture before the begin keyword
   --Use descriptive names for the states, like st1_reset, st2_search
   type state_type is (st1_start, st2_idle, st3_push, st4_push_full, st5_pop, st6_pop_empty); 
   signal state, next_state : state_type; 
   --Declare internal signals for all outputs of the state-machine
	signal empty_out_i     : std_logic;
	signal data_out_i      : std_logic_vector (7 downto 0);
	signal full_out_i      : std_logic_vector (7 downto 0);
	signal address_out_i   : std_logic_vector (2 downto 0);
	signal write_ena_i     : std_logic;
	
	signal head            : std_logic_vector (2 downto 0);   --registro que almacena la direccion de memoria actual
	signal tail            : std_logic_vector (2 downto 0);   --registro que almacena la direccion de memoria anterior (actual - 1 palabra)
   --other outputs
 
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk_in)
   begin
      if (clk_in'event and clk_in = '1') then
         if (reset_in = '1') then
            state <= st1_start;
--            <output> <= '0';
				empty_out <= '1';
				full_out  <= '0';
				data_out  <= '0';
         else
            state <= next_state;
--            <output> <= <output>_i;
				empty_out <= empty_out_i;
				full_out  <= full_out_i;
				data_out  <= data_out_i;
         -- assign other outputs to internal signals
         end if;        
      end if;
   end process;
 
   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      if state = st3_<name> then
         <output>_i <= '1';
      else
         <output>_i <= '0';
      end if;
   end process;
 
   NEXT_STATE_DECODE: process (state, clk_in, pop_in, push_in, data_in, reset_in)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when st1_<name> =>
            if <input_1> = '1' then
               next_state <= st2_<name>;
            end if;
         when st2_<name> =>
            if <input_2> = '1' then
               next_state <= st3_<name>;
            end if;
         when st3_<name> =>
            next_state <= st1_<name>;
         when others =>
            next_state <= st1_<name>;
      end case;      
   end process;
begin


end Behavioral;

