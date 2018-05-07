library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Common_types_and_functions.all;

entity top_last_division is
  port(clk                  : in  std_logic;
       reset_n              : in  std_logic;
       clk_en               : in  std_logic;
       input_last_division  : in  input_last_division_reg_type;
       output_last_division : out output_last_division_reg_type);
end top_last_division;

architecture Behavioral of top_last_division is

  signal r, r_in             : input_last_division_reg_type;
-- number of shifts required to approximate the division
  signal divisor_is_negative : std_logic;
  -- If the divisor is negative, we need to take two's complement of the divisor
  signal divisor             : std_logic_vector(PIXEL_DATA_WIDTH*2 -1 downto 0);
  signal divisor_valid       : std_logic                             := '0';
  signal remainder_valid     : std_logic                             := '0';
  type remainders_array is array(0 to PIXEL_DATA_WIDTH*2-2) of std_logic_vector(PIXEL_DATA_WIDTH*2-1 downto 0);
  signal remainders          : remainders_array;
  constant ONE               : signed(PIXEL_DATA_WIDTH*2-1 downto 0) := (0 => '1', others => '0');
  signal msb_index           : integer range 0 to 31;  -- msb of the divisor(unsigned)
  signal msb_valid           : std_logic                             := '0';
  -- to be used in two's complement.

  constant INITIAL_BEST_APPROX : remainder_after_approximation_record := (
    remainder        => (PIXEL_DATA_WIDTH*2-1 => '0', others => '1'),
    number_of_shifts => 0,
    remainder_valid  => '0'
    );

begin

  check_if_divisor_is_negative : process(input_last_division.state_reg.state, input_last_division.row_i, input_last_division.valid_data, reset_n)
  begin
    if reset_n = '0' or not(input_last_division.state_reg.state = STATE_LAST_DIVISION) then
      divisor_valid       <= '0';
      divisor_is_negative <= '0';
      divisor             <= std_logic_vector(to_signed(1, PIXEL_DATA_WIDTH*2));
    elsif(input_last_division.row_i(input_last_division.index_i)(PIXEL_DATA_WIDTH*2-1) = '1' and input_last_division.valid_data = '1') then
      -- row[i][i] is negative
      -- using the absolute value
      divisor_is_negative <= '1';
      divisor             <= std_logic_vector(abs(signed(input_last_division.row_i(input_last_division.index_i))));
      divisor_valid       <= '1';
    elsif input_last_division.row_i(input_last_division.index_i)(PIXEL_DATA_WIDTH*2-1) = '0' and input_last_division.valid_data = '1' then
      divisor_is_negative <= '0';
      divisor             <= std_logic_vector(input_last_division.row_i(input_last_division.index_i));
      divisor_valid       <= '1';
    else
      divisor_valid       <= '0';
      divisor_is_negative <= '0';
      divisor             <= std_logic_vector(to_signed(1, PIXEL_DATA_WIDTH*2));
    end if;
  end process;


-- generate PIXEL_DATA_WIDTH*2-1 number of shifters that shifts
-- A[i][i] n places in order to see how many shifts yield the best
-- approximation to the division. Don't need to shift the
-- 31 bit as this is the sign bit.
  generate_shifters : for i in 1 to PIXEL_DATA_WIDTH*2-1 generate
    signal remainder_after_approximation_i : remainder_after_approximation_record;
  begin
    process(divisor, divisor_valid, reset_n, input_last_division.state_reg)
    begin
      if reset_n = '0' or not(input_last_division.state_reg.state = STATE_LAST_DIVISION) then
        remainder_after_approximation_i.remainder        <= std_logic_vector(shift_right(signed(divisor), i));
        remainder_after_approximation_i.number_of_shifts <= i;
        remainder_after_approximation_i.remainder_valid  <= '0';
      elsif divisor_valid = '1' then
        remainder_after_approximation_i.remainder        <= std_logic_vector(shift_right(signed(divisor), i));
        remainder_after_approximation_i.number_of_shifts <= i;
        remainder_after_approximation_i.remainder_valid  <= '1';
      else
        remainder_after_approximation_i.remainder        <= std_logic_vector(shift_right(signed(divisor), i));
        remainder_after_approximation_i.number_of_shifts <= i;
        remainder_after_approximation_i.remainder_valid  <= '0';
      end if;
    end process;
    remainders(i-1) <= remainder_after_approximation_i.remainder;
    remainder_valid <= remainder_after_approximation_i.remainder_valid;
  end generate;


  find_msb : process(divisor_valid, input_last_division, reset_n,divisor)
  begin
    if divisor_valid = '1' and reset_n = '1' then
      --For PIXEL_DATA_WIDTH = 16.
      if divisor(30) = '1' then
        msb_index <= 30;
      elsif divisor(29) = '1' then
        msb_index <= 29;
      elsif divisor(28) = '1' then
        msb_index <= 28;
      elsif divisor(27) = '1' then
        msb_index <= 27;
      elsif divisor(26) = '1'then
        msb_index <= 26;
      elsif divisor(25) = '1' then
        msb_index <= 25;
      elsif divisor(24) = '1' then
        msb_index <= 24;
      elsif divisor(23) = '1' then
        msb_index <= 23;
      elsif divisor(22) = '1' then
        msb_index <= 22;
      elsif divisor(21) = '1' then
        msb_index <= 21;
      elsif divisor(20) = '1' then
        msb_index <= 20;
      elsif divisor(19) = '1' then
        msb_index <= 19;
      elsif divisor(18) = '1' then
        msb_index <= 18;
      elsif divisor(17) = '1'then
        msb_index <= 17;
      elsif divisor(16) = '1' then
        msb_index <= 16;
      elsif divisor(15) = '1' then
        msb_index <= 15;
      elsif divisor(14) = '1' then
        msb_index <= 14;
      elsif divisor(13) = '1' then
        msb_index <= 13;
      elsif divisor(12) = '1' then
        msb_index <= 12;
      elsif divisor(11) = '1' then
        msb_index <= 11;
      elsif divisor(10) = '1'then
        msb_index <= 10;
      elsif divisor(9) = '1' then
        msb_index <= 9;
      elsif divisor(8) = '1' then
        msb_index <= 8;
      elsif divisor(7) = '1' then
        msb_index <= 7;
      elsif divisor(6) = '1' then
        msb_index <= 6;
      elsif divisor(5) = '1' then
        msb_index <= 5;
      elsif divisor(4) = '1' then
        msb_index <= 4;
      elsif divisor(3) = '1' then
        msb_index <= 3;
      elsif divisor(2) = '1' then
        msb_index <= 2;
      elsif divisor(1) = '1' then
        msb_index <= 1;
      elsif divisor(0) = '1' then
        msb_index <= 0;
      end if;
      msb_valid <= '1';
    else
      msb_index <= 0;
      msb_valid <= '0';
    end if;
  end process;


  comb_process : process(input_last_division, r, reset_n, divisor_is_negative, divisor, remainder_valid, remainders,msb_valid)
    variable v : input_last_division_reg_type;
  begin

    v := r;
    if(input_last_division.state_reg.state = STATE_LAST_DIVISION and input_last_division.valid_data = '1' and remainder_valid = '1' and msb_valid = '1') then
      v             := input_last_division;
      v.best_approx := INITIAL_BEST_APPROX;

      -- find msb
      if divisor_is_negative = '1' then
        -- Need to negate the divisor before finding the msb
        v.row_i(input_last_division.index_i) := not(v.row_i(input_last_division.index_i)) + ONE;
      end if;
      for i in 0 to PIXEL_DATA_WIDTH*2-2 loop
        if(v.row_i(input_last_division.index_i)(i) = '1') then
          -- the first '1' found is the msb.
          -- msb index is one-indexed
          v.msb_index := i+1;
        end if;
      end loop;


-- Finding closest approximation to divisor 
      for j in 0 to PIXEL_DATA_WIDTH*2-2 loop
        if to_integer(unsigned(remainders(j))) < to_integer(unsigned(v.best_approx.remainder)) and (j <= v.msb_index) then
          --if to_integer(unsigned(remainders(j))) < to_integer(unsigned(v.best_approx.remainder)) and (j <= msb_index) then
          -- This is a better approximation
          v.best_approx.remainder        := remainders(j);
          v.best_approx.number_of_shifts := j;
        end if;
      end loop;
      -- The best approximation to the divisor may be larger than the divisor.
      if to_integer(signed(divisor))- to_integer(shift_left(to_signed(1, PIXEL_DATA_WIDTH*2), v.best_approx.number_of_shifts)) > to_integer(shift_left(to_signed(1, PIXEL_DATA_WIDTH*2), v.best_approx.number_of_shifts+1))- to_integer(signed(divisor)) then
        -- This is a better approximation
        v.best_approx.remainder        := std_logic_vector(to_signed(to_integer(shift_left(to_signed(1, PIXEL_DATA_WIDTH*2), v.best_approx.number_of_shifts+1))-to_integer(signed(divisor)), PIXEL_DATA_WIDTH*2));
        v.best_approx.number_of_shifts := v.best_approx.number_of_shifts+1;
      end if;

-- Doing division
      if divisor_is_negative = '1' then
        for i in 0 to P_BANDS-1 loop
          v.inv_row_i(i) := shift_right(input_last_division.inv_row_i(i), v.best_approx.number_of_shifts);
          -- Negating the number with two's complement
          v.inv_row_i(i) := not(v.inv_row_i(i)) + ONE;
        end loop;
      else
        for i in 0 to P_BANDS-1 loop
          v.inv_row_i(i) := shift_right(input_last_division.inv_row_i(i), v.best_approx.number_of_shifts);
        end loop;
      end if;
    end if;

    if(reset_n = '0' or input_last_division.state_reg.state /= STATE_LAST_DIVISION) then
      v.valid_data  := '0';
      v.best_approx := INITIAL_BEST_APPROX;
      v.msb_index   := 31;
    end if;
    r_in                                        <= v;
    output_last_division.new_inv_row_i          <= r.inv_row_i;
    output_last_division.valid_data             <= r.valid_data;
    output_last_division.index_i                <= r.index_i;
    output_last_division.write_address_even     <= r.write_address_even;
    output_last_division.write_address_odd      <= r.write_address_odd;
    output_last_division.flag_write_to_even_row <= r.flag_write_to_even_row;
    output_last_division.state_reg              <= r.state_reg;
  end process;


  sequential_process : process(clk, clk_en)
  begin
    if(rising_edge(clk) and clk_en = '1') then
      r <= r_in;
    end if;
  end process;

end Behavioral;
