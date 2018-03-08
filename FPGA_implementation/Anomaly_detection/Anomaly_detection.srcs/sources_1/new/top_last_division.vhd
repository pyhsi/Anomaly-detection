library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Common_types_and_functions.all;

entity top_last_division is
  port(clk             : in    std_logic;
       reset           : in    std_logic;
       clk_en          : in    std_logic;
       M               : in    matrix_reg_type;
       M_last_division : inout matrix_reg_type);
end top_last_division;

architecture Behavioral of top_last_division is

  signal r, r_in : matrix_reg_type;

begin

  comb_process : process(M, r, reset)
    variable v : matrix_reg_type;
  begin

    v                            := r;
    v.state_reg.fsm_start_signal := M.state_reg.fsm_start_signal;
    if(M.state_reg.state = STATE_IDENTITY_MATRIX_BUILDING and not(r.state_reg.drive = STATE_IDENTITY_MATRIX_BUILDING_FINISHED)) then
      if(M.state_reg.fsm_start_signal = START_IDENTITY_MATRIX_BUILDING and M.valid_matrix_data = '1') then
        -- Loading matrix and set index_i to initial value
        v                      := M;
        v.row_reg.elim_index_i := std_logic_vector(to_signed(0, 32));
        v.row_reg.valid_data   := '1';
      end if;

      if(to_integer(signed(v.row_reg.elim_index_i)) <= P_BANDS-1 and v.row_reg.valid_data = '1') then
        for i in 0 to P_BANDS-1 loop
          v.matrix_inv(to_integer(unsigned(v.row_reg.elim_index_i)), i) := std_logic_vector(to_signed(to_integer(signed(v.matrix_inv(to_integer(unsigned(v.row_reg.elim_index_i)), i))) * 1/to_integer(signed(v.matrix(to_integer(unsigned(v.row_reg.elim_index_i)), to_integer(unsigned(v.row_reg.elim_index_i))))), 32));
        end loop;
      end if;
      if( to_integer(signed(v.row_reg.elim_index_i)) >= P_BANDS-1) then
         v.state_reg.drive := STATE_IDENTITY_MATRIX_BUILDING_FINISHED;
        end if;
      if (v.row_reg.elim_index_i < std_logic_vector(to_unsigned(P_BANDS-1, 32)) and M.state_reg.forward_elim_ctrl_signal /= START_IDENTITY_MATRIX_BUILDING) then
        -- Wait until we actually have registered in some matrix-value before
        -- altering the index.
        v.row_reg.elim_index_i := std_logic_vector(to_signed(to_integer(signed(r.row_reg.elim_index_i))+1, 32));
      end if;
    end if;

    if(reset = '1') then
      v.row_reg.elim_index_i := std_logic_vector(to_signed(0, 32));
      v.row_reg.valid_data := '0';
    end if;
    r_in            <= v;
    M_last_division <= r;
  end process;


  sequential_process : process(clk, clk_en)
  begin
    if(rising_edge(clk) and clk_en = '1') then
      r <= r_in;
    end if;
  end process;

end Behavioral;