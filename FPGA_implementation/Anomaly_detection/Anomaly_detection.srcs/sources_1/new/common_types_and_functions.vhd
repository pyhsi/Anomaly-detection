----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 12:31:59 PM
-- Design Name: 
-- Module Name: common_types_and_functions - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package Common_types_and_functions is 
    generic map ( N_pixels =>    2578;
                  p_bands  =>    100;
                  k       =>    0);
    constant pixel_data_size is std_logic_vector(11 downto 0);
    type pixel_vector is array (0 to p_bands-1) of std_logic_vector(pixel_data_size downto 0);          
    type matrix is array (  natural range <> , natural range <>) of pixel_data_size; 
    
end Common_types_and_functions;

--package body Common_types_and_functions is 
    -- subprogram bodies here
    
--end Common_types_and_functions;
