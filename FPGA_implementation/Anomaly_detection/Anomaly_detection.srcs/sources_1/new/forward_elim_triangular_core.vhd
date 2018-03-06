

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

use work.Common_types_and_functions.all;

entity forward_elim_triangular_core is
  port(clk                         : in    std_logic;
       reset                       : in    std_logic;
       clk_en                      : in    std_logic;
       row                         : in    row_reg_type;
       forward_elim_triangular_row : inout row_reg_type);
end forward_elim_triangular_core;

architecture Behavioral of forward_elim_triangular_core is

  signal r, r_in : row_reg_type;

begin

  comb : process(row, r, reset)
    variable v          : row_reg_type;
    variable temp_row_i : row_reg_type;

  begin
    v              := r;
    v.row_j        := row.row_j;
    v.row_i        := row.row_i;
    v.a_j_i        := row.a_j_i;
    v.a_i_i        := row.a_i_i;
    v.elim_index_j := row.elim_index_j;
    v.elim_index_i := row.elim_index_i;

    if(row.valid_data = '1') then
      if(to_integer(signed(v.row_j(0, to_integer(unsigned(v.elim_index_j)))))/=0) then
        for i in 0 to P_BANDS-1 loop
          temp_row_i.row_i(0, i) := v.row_i(0, i);
          v.row_i(0, i)          := v.row_j(0, i);
          v.row_j(0, i)          := temp_row_i.row_i(0, i);
          v.valid_data           := '1';
        end loop;
      end if;
    end if;
    if (reset = '1') then
      --  v.elim_index := std_logic_vector(to_signed(P_BANDS-1, 32));
      v.valid_data := '0';
    end if;
    forward_elim_triangular_row <= r;
    r_in                        <= v;
  end process;

  sequential_process : process(clk, clk_en)
  begin
    if(rising_edge(clk) and clk_en = '1') then
      r <= r_in;
    end if;
  end process;

end Behavioral;
