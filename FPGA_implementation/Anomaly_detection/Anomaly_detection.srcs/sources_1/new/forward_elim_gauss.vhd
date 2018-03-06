
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

library work;
use work.Common_types_and_functions.all;

entity forward_elim_gauss is
  Port (    clk :                           in std_logic;
            reset :                         in std_logic;
            clk_en :                        in std_logic;
            M :                             in matrix_reg_type;
            M_forward_elimination :         out matrix_reg_type); 
end forward_elim_gauss;

architecture Behavioral of forward_elim_gauss is

signal r, r_in : matrix_reg_type; --cointains all registered values 

begin 

  comb : process(M, r, reset)
--comb: process(all)
    variable v : matrix_reg_type;
    variable temp_i_i : std_logic_vector(31 downto 0);
    variable temp_p_l : std_logic_vector(31 downto 0);
    variable temp_p_i : std_logic_vector(31 downto 0); 


  begin
    v := r;
   
    if(M.state_reg.state = STATE_FORWARD_ELIMINATION and M.state_reg.fsm_start_signal = START_FORWARD_ELIMINATION) then
    v.matrix := M.matrix;
    v.matrix_inv := M.matrix_inv;
    for i in 0 to P_BANDS-1 loop
      if(v.matrix(i, i) = std_logic_vector(to_unsigned(0, 32))) then
        for j in i+1 to P_BANDS-1 loop
          if(v.matrix(j, j) /= std_logic_vector(to_unsigned(0, 32))) then
            for k in 0 to P_BANDS-1 loop
              temp_i_i := M.matrix(i,k); 
              v.matrix(i, k) := v.matrix(j,k);
              --v.matrix(j, k) := M.matrix(i,k);
              v.matrix(j,k) := temp_i_i;
            end loop;
          end if;
        end loop;
      end if;
      if (v.matrix(i, i) = std_logic_vector(to_unsigned(0, 32))) then
      --matrix is singular, output some kind of error      
      end if;
      for p in i+1 to P_BANDS-1 loop
        --for l in 0 to P_BANDS-1 loop
       --   if (M.matrix(i, i) /= std_logic_vector(to_unsigned(0, 32))) then
        --    temp_p_l:= v.matrix(p,i);
        --    temp_p_i:= v.matrix(i,i);
        --    v.matrix(p, l)     := std_logic_vector(to_signed(to_integer(signed(v.matrix(p,l)))- to_integer(signed(v.matrix(i, l)))*to_integer(signed(temp_p_l))/to_integer(signed(temp_p_i)), 32));
        --    v.matrix_inv(p, l) := std_logic_vector(to_signed(to_integer(signed(v.matrix_inv(p, l)))- to_integer(signed(v.matrix_inv(i, l)))*to_integer(signed(temp_p_l))/to_integer(signed(temp_p_i)), 32));
        --  end if;
        --end loop;
      end loop;
    end loop;
    if (reset ='1') then
       	v.matrix := (others=>(others=>(others=>'0')));
     	v.matrix_inv := (others=>(others=>(others=>'0')));
    end if;
    end if;
    r_in <= v;
    M_forward_elimination.matrix <= r.matrix;
    M_forward_elimination.matrix_inv <= r.matrix_inv;      
    
end process;

sequential_process: process(clk, clk_en)
begin
    if(rising_edge(clk) and clk_en='1') then
        r <= r_in;
    end if;
end process;



end Behavioral;