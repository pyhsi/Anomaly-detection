library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Common_types_and_functions.all;

-- A serial(n bit at a time) in parallell out shift register
-- Inputes four bands at a time, until a whole pixel is shifted in
entity shiftregister_four_pixels is
  port (din           : in    std_logic_vector (PIXEL_DATA_WIDTH*ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA-1 downto 0);
        valid         : in    std_logic;
        clk           : in    std_logic;
        clk_en        : in    std_logic;
        reset_n       : in    std_logic;
        shift_counter : out   std_logic_vector(log2(P_BANDS*PIXEL_DATA_WIDTH/(PIXEL_DATA_WIDTH*4)) downto 0);
-- Assuming PIXEL_DATA_WIDTH*4 (maximum 64) bit per input cycle, 4 pixel components at max 16 bit. Important to
-- know delay of first input pixel in clock cycles
        valid_out     : out   std_logic;
        dout          : inout std_logic_vector(P_BANDS*PIXEL_DATA_WIDTH -1 downto 0)
        );
end shiftregister_four_pixels;

architecture Behavioral of shiftregister_four_pixels is
  signal r, r_in                             : std_logic_vector(P_BANDS*PIXEL_DATA_WIDTH -1 downto 0);
  signal r_shift_counter_in, r_shift_counter : std_logic_vector(log2(P_BANDS*PIXEL_DATA_WIDTH/(PIXEL_DATA_WIDTH*ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA)) downto 0) := (others => '0');
  signal r_in_valid_out                      : std_logic;

begin
  comb_proc : process(din, valid, dout, r_shift_counter)
    variable v_shift_counter      : integer   := to_integer(unsigned(r_shift_counter));
    variable v_temp_shift_data_in : std_logic_vector(P_BANDS*PIXEL_DATA_WIDTH-1 -ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA*PIXEL_DATA_WIDTH downto 0);
    variable v                    : std_logic_vector(P_BANDS * PIXEL_DATA_WIDTH -1 downto 0);
    variable v_valid_out          : std_logic := '0';
  begin
    if(valid = '1')then
      v_shift_counter                                                                    := to_integer(unsigned(r_shift_counter)) + 1;
      v                                                                                  := dout;
      v_temp_shift_data_in                                                               := v(P_BANDS*PIXEL_DATA_WIDTH-1 downto ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA*PIXEL_DATA_WIDTH);
      v(P_BANDS*PIXEL_DATA_WIDTH-1 - ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA*PIXEL_DATA_WIDTH downto 0)                        := v_temp_shift_data_in;
      v(P_BANDS*PIXEL_DATA_WIDTH-1 downto P_BANDS*PIXEL_DATA_WIDTH - ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA*PIXEL_DATA_WIDTH) := din;
      if v_shift_counter = P_BANDS/ELEMENTS_SHIFTED_IN_FROM_CUBE_DMA then
        v_valid_out := '1';
      else
        v_valid_out := '0';
      end if;
    else
      v_shift_counter := 0;
      v               := (others => '0');
      v_valid_out     := '0';
    end if;
    if(reset_n = '0') then
      v               := (others => '0');
      v_shift_counter := 0;
      v_valid_out     := '0';
    end if;
    r_shift_counter_in <= std_logic_vector(to_unsigned(v_shift_counter, r_shift_counter_in'length));
    shift_counter      <= r_shift_counter;
    r_in_valid_out     <= v_valid_out;
    r_in               <= v;
    dout               <= r;
  end process;


  sequential_proc : process(clk, clk_en)
  begin
    if (rising_edge(clk) and clk_en = '1') then
      r               <= r_in;
      valid_out       <= r_in_valid_out;
      r_shift_counter <= r_shift_counter_in;
    end if;
  end process;


end Behavioral;
