-------------------------------------------------------------------------------
-- Title      : Testbench for design "inverse_matrix"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : inverse_matrix_tb.vhd
-- Author     :   <Martin@MARTIN-PC>
-- Company    : 
-- Created    : 2018-03-08
-- Last update: 2018-03-08
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2018 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2018-03-08  1.0      Martin  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
library work;
use work.Common_types_and_functions.all;
-------------------------------------------------------------------------------

entity inverse_matrix_tb is

end entity inverse_matrix_tb;

-------------------------------------------------------------------------------

architecture behavioral of inverse_matrix_tb is

  -- component ports
  signal reset           : std_logic;
  signal clk_en          : std_logic;
  signal clk             : std_logic := '1';
  signal start_inversion : std_logic;
  signal M_corr          : matrix_reg_type;
  signal M_inv           : matrix_reg_type;

  -- clock

begin  -- architecture behavioral

  -- component instantiation
  DUT : entity work.inverse_matrix
    port map (
      reset           => reset,
      clk_en          => clk_en,
      clk             => clk,
      start_inversion => start_inversion,
      M_corr          => M_corr,
      M_inv           => M_inv);

  -- clock generation
  clk <= not clk after 10 ns;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here

    reset           <= '1';
    wait for 20 ns;
    reset           <= '0';
    wait for 10 ns;
    clk_en          <= '1';
    start_inversion <= '1';

    M_corr.matrix(0, 0) <= std_logic_vector(to_unsigned(1, 32));
    M_corr.matrix(0, 1) <= std_logic_vector(to_unsigned(3, 32));
    M_corr.matrix(0, 2) <= std_logic_vector(to_unsigned(1, 32));

    M_corr.matrix(1, 0) <= std_logic_vector(to_unsigned(2, 32));
    M_corr.matrix(1, 1) <= std_logic_vector(to_unsigned(3, 32));
    M_corr.matrix(1, 2) <= std_logic_vector(to_unsigned(2, 32));

    M_corr.matrix(2, 0) <= std_logic_vector(to_unsigned(6, 32));
    M_corr.matrix(2, 1) <= std_logic_vector(to_unsigned(8, 32));
    M_corr.matrix(2, 2) <= std_logic_vector(to_unsigned(7, 32));
    -- 

    -- M.matrix_inv(0, 0) <= std_logic_vector(to_unsigned(1, 32));
    -- M.matrix_inv(0, 1) <= std_logic_vector(to_unsigned(0, 32));
    -- M.matrix_inv(0, 2) <= std_logic_vector(to_unsigned(0, 32));
    -- M.matrix_inv(1, 0) <= std_logic_vector(to_unsigned(0, 32));
    -- M.matrix_inv(1, 1) <= std_logic_vector(to_unsigned(1, 32));
    -- M.matrix_inv(1, 2) <= std_logic_vector(to_unsigned(0, 32));
    -- M.matrix_inv(2, 0) <= std_logic_vector(to_unsigned(0, 32));
    -- M.matrix_inv(2, 1) <= std_logic_vector(to_unsigned(0, 32));
    -- M.matrix_inv(2, 2) <= std_logic_vector(to_unsigned(1, 32));
    wait for 10 ns;
    start_inversion <='0';
    wait for 100000000 ns;

  end process WaveGen_Proc;



-------------------------------------------------------------------------------

-------------------------------------------------------------------------------


end architecture behavioral;

-------------------------------------------------------------------------------







