library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Common_types_and_functions.all;


entity top_forward_elimination is
  port(clk                        : in  std_logic;
       reset_n                    : in  std_logic;
       clk_en                     : in  std_logic;
       input_elimination          : in  input_elimination_reg_type;
       output_forward_elimination : out output_forward_elimination_reg_type
       );
end top_forward_elimination;

architecture Behavioral of top_forward_elimination is

  signal row_forward_elim_inner      : output_forward_elimination_reg_type;
  signal row_forward_elim_triangular : output_forward_elimination_reg_type;
  signal r, r_in                     : input_elimination_reg_type;

begin


--  forward_elim_triangular_triangular_controller_1 : entity work.forward_elim_triangular_triangular_controller
--    port map (
--      clk                         => clk,
--      reset                       => reset,
--      clk_en                      => clk_en,
--      row                         => row_forward_elim,
--      row_forward_elim_triangular => row_forward_elim_triangular);
--
--  forward_elim_inner_loop_controller_1 : entity work.forward_elim_inner_loop_controller
--    port map (
--      clk              => clk,
--      reset            => reset,
--      clk_en           => clk_en,
--      row              => row_forward_elim,
--      row_forward_elim => row_forward_elim_inner);


  comb_process : process(input_elimination, r, reset_n, row_forward_elim_inner, row_forward_elim_triangular)

    variable v : input_elimination_reg_type;

  begin
    v                            := r;
    v.state_reg.fsm_start_signal := input_elimination.state_reg.fsm_start_signal;

    if(input_elimination.state_reg.state = STATE_FORWARD_ELIMINATION and not(r.state_reg.drive = STATE_FORWARD_ELIMINATION_FINISHED)) then
      if(input_elimination.state_reg.fsm_start_signal = START_FORWARD_ELIMINATION)then
        -- Load matrix and set index_i, the index of the outer forward
        -- elimination loop. Also start triangular-loop if M[i][i]==0
        v                                           := input_elimination;
        v.index_i                                   := 0;
        v.state_reg.start_inner_loop                := '1';
        v.state_reg.flag_forward_triangular_started := '0';
        v.state_reg.flag_forward_core_started       := '0';
      else
        v.state_reg.start_inner_loop := '0';
      end if;
      -- Drop the check if M(i,i)==0(??) Dropped for now
      if (r.valid_data = '1' and r.index_i <= P_BANDS-1) then
        if(r.state_reg.forward_elim_state_signal = STATE_FORWARD_TRIANGULAR) then
          if(row_forward_elim_triangular.state_reg.inner_loop_iter_finished = '1' and row_forward_elim_triangular.valid_data = '1' and r.index_i < P_BANDS-1) then
            -- received data
            v.row_j                                     := row_forward_elim_triangular.new_row_j;
            v.row_i                                     := row_forward_elim_triangular.new_row_i;
            v.index_i                                   := r.index_i+1;
            v.state_reg.inner_loop_iter_finished        := '0';
            v.state_reg.start_inner_loop                := '1';
            v.state_reg.flag_forward_triangular_started := '0';
          end if;
        elsif(r.state_reg.forward_elim_state_signal = STATE_FORWARD_ELIM) then
          if(row_forward_elim_inner.state_reg.inner_loop_iter_finished = '1' and row_forward_elim_inner.valid_data = '1' and r.index_i < P_BANDS-1) then
            -- received data
            v.row_j                               := row_forward_elim_inner.new_row_j;
            v.inv_row_j                           := row_forward_elim_inner.new_inv_row_j;
            -- update index_i 
            v.index_i                             := r.index_i+1;
            v.state_reg.inner_loop_iter_finished  := '0';
            v.state_reg.start_inner_loop          := '1';
            v.state_reg.flag_forward_core_started := '0';

          elsif(row_forward_elim_inner.state_reg.inner_loop_last_iter_finished = '1' and row_forward_elim_inner.valid_data = '1') then
            -- This is the last iteration of the forward elimination, signal
            -- to top module
            -- Finished forward elimination
            v.state_reg.drive                         := STATE_FORWARD_ELIMINATION_FINISHED;
            v.row_j                                   := row_forward_elim_inner.new_row_j;
            v.inv_row_j                               := row_forward_elim_inner.new_inv_row_j;
            v.state_reg.inner_loop_last_iter_finished := '1';
          end if;
        end if;
        -- Check if M(i,i)==0
        if(v.row_i(r.index_i) = to_signed(0, 32)) then
          v.state_reg.forward_elim_state_signal := STATE_FORWARD_TRIANGULAR;
          if(v.state_reg.flag_forward_triangular_started = '1') then
            v.state_reg.forward_elim_ctrl_signal := IDLING;
          else
            v.state_reg.forward_elim_ctrl_signal        := START_FORWARD_ELIM_TRIANGULAR;
            v.state_reg.flag_forward_triangular_started := '1';
          end if;
        else
          v.state_reg.forward_elim_state_signal := STATE_FORWARD_ELIM;
          -- v.state_reg.inner_loop_iter_finished      := M_forward_elim_inner.state_reg.inner_loop_iter_finished;
          -- v.state_reg.inner_loop_last_iter_finished := M_forward_elim_inner.state_reg.inner_loop_last_iter_finished;
          if(v.state_reg.flag_forward_core_started = '1') then
            v.state_reg.forward_elim_ctrl_signal := IDLING;
          else
            v.state_reg.forward_elim_ctrl_signal  := START_FORWARD_ELIM_CORE;
            v.state_reg.flag_forward_core_started := '1';
          end if;
        end if;


      end if;
    end if;
    if(reset_n = '0') then
      v.index_i      := 0;--P_BANDS-1;
      v.index_j := 1;--P_BANDS-2;
    end if;
    r_in                                     <= v;
    output_forward_elimination.new_row_j     <= r.row_j;      --output stage
    output_forward_elimination.new_row_i     <= r.row_i;      --output stage
    output_forward_elimination.new_inv_row_j <= r.inv_row_j;  --output stage
    output_forward_elimination.wr_addr_new   <= r.index_j;

  end process;


  sequential_process : process(clk, clk_en)
  begin
    if(rising_edge(clk) and clk_en = '1') then
      r <= r_in;
    end if;
  end process;

end Behavioral;
