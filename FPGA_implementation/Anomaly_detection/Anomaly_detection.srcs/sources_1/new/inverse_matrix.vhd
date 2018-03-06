----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2018 02:19:19 PM
-- Design Name: 
-- Module Name: inverse_matrix - Behavioral
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
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


library work;
use work.Common_types_and_functions.all;
--use work.gauss_jordan_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- This entity is the top-level for computing the inverse of a matrix
-- It uses the two-step method, as described by Jiri Gaisler, with one modification;
-- added initialization process
entity inverse_matrix is
  port (M_corr : in    matrix_reg_type;
        -- maybe generic ?
        reset  : in    std_logic;
        clk_en : in    std_logic;
        clk    : in    std_logic;
        M_inv  : inout matrix_reg_type
        );

end inverse_matrix;

architecture Behavioral of inverse_matrix is
  signal M_identity_matrix                               : matrix_32 := create_identity_matrix(P_BANDS);
  signal r, r_in, M_backward_elim, M_forward_elim  : matrix_reg_type;
  signal fsm_state_reg                                   : reg_state_type;
  signal start_inversion :std_logic;

begin
  top_backward_elimination_1 : entity work.top_backward_elimination
    port map (
      clk             => clk,
      reset           => reset,
      clk_en          => clk_en,
      M               => M_forward_elim,
      M_backward_elim => M_backward_elim);

  fsm_inverse_matrix_1 : entity work.fsm_inverse_matrix
    port map (
      reset           => reset,
      clk             => clk,
      clk_en          => clk_en,
      start_inversion => start_inversion,
      state_reg       => fsm_state_reg);

--init:process    -- Initialization process; only to be runned once
--begin
--    M_identity_matrix <= (others=>(others=>(others=>'0')));
--    for i in 0 to P_BANDS-1 loop
--        M_identity_matrix(i,i) <= std_logic_vector(to_unsigned(1,32));
--    end loop;
--    wait;
-- end process;


  comb : process(all)                   -- combinatorial process
    variable v : matrix_reg_type;
  begin
    v                           := r;
    v.state_reg                 := fsm_state_reg;
    v.state_reg.start_inversion := M_corr.state_reg.start_inversion;
    case v.state_reg.state is
      when STATE_IDLE =>
        v.matrix := M_corr.matrix;
      v.matrix_inv := M_identity_matrix;
      when STATE_FORWARD_ELIMINATION =>
        v.matrix := M_forward_elim.matrix;
      v.matrix_inv := M_forward_elim.matrix_inv;
      when STATE_BACKWARD_ELIMINATION =>
        v.matrix := M_backward_elim.matrix;
      v.matrix_inv := M_backward_elim.matrix_inv;
      when STATE_IDENTITY_MATRIX_BUILDING =>
      v.matrix_inv := M_inv.matrix_inv;
      when others =>
      v.matrix := M_corr.matrix;
      v.matrix_inv := M_identity_matrix;
    end case;
    if(v.state_reg.start_inversion = '1') then
      v.matrix     := M_corr.matrix;
      v.matrix_inv := M_identity_matrix;
    end if;

    r_in  <= v;
    M_inv <= r;
  end process;


  regs : process(clk, reset, clk_en)
  begin
    if(reset = '1') then
      M_inv.matrix_inv          <= M_identity_matrix;
    elsif(rising_edge(clk) and clk_en = '1') then
      r <= r_in;
    end if;

  end process;

end Behavioral;