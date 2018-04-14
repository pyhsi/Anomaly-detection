library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Common_types_and_functions.all;

-- Correlation module with AXI lite stream interface
entity acad_correlation is
  port(din                : in  std_logic_vector(P_BANDS*PIXEL_DATA_WIDTH-1 downto 0);  --
                                        --Horizontal
                                        --input vector
       valid              : in  std_logic;
       clk                : in  std_logic;
       clk_en             : in  std_logic;
       reset_n            : in  std_logic;
       dout               : out std_logic_vector(P_BANDS*PIXEL_DATA_WIDTH*2*2 -1 downto
                                   0);  -- writing two 32-bit elements per cycle
       writes_done_on_row : out std_logic_vector(log2(P_BANDS/2) downto 0)
   -- its just done a write or if its reading
       );
end acad_correlation;

architecture Behavioral of acad_correlation is
  constant N_BRAMS                             : integer range 0 to P_BANDS   := P_BANDS;
  constant NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM : integer range 0 to 2         := 2;  -- using True dual port BRAM
  constant NUMBER_OF_WRITES_PER_ROW            : integer range 0 to P_BANDS/2 := P_BANDS/2;

  --signal r_address_counter_even : std_logic_vector (BRAM_TDP_ADDRESS_WIDTH-1 downto 0) := (others => '0');
  signal r_address_counter_even : integer range 0 to B_RAM_SIZE-1;
  signal write_done_on_row      : std_logic_vector (log2(P_BANDS/2) downto 0) := (others => '0');
-- width defined in TDP spec
  signal flag_has_read_first    : std_logic :=
    '0';  --first element in the read-write pipeline 
  signal write_enable                                    : std_logic;
  signal read_enable                                     : std_logic;
  signal read_address_even, read_address_odd             : integer range 0 to B_RAM_SIZE-1;
  signal write_address_even, write_address_odd           : integer range 0 to B_RAM_SIZE-1;
  signal read_address_even_temp, read_address_odd_temp   : integer range 0 to B_RAM_SIZE-1;
  signal write_address_even_temp, write_address_odd_temp : integer range 0 to B_RAM_SIZE-1;
  signal flag_first_pixel                                : std_logic := '1';
-- indicates that the current pixel working on is the first pixel 




begin


  gen_BRAM_18_updates : for i in 0 to (P_BANDS-1)/2 generate
    -- Generating N_BRAMS = P_BANDS BRAMS.
    signal data_in_even_i, data_in_odd_i, data_out_even_i, data_out_odd_i : std_logic_vector(B_RAM_BIT_WIDTH -1 downto 0);
    signal input_even_i, input_odd_i                                      : std_logic_vector(B_RAM_BIT_WIDTH-1 downto 0);  --
    signal prev_value_even_i                                              : std_logic_vector(PIXEL_DATA_WIDTH*2-1 downto 0);  --value read from BRAM (even index) before writing to address
    signal prev_value_odd_i : std_logic_vector(PIXEL_DATA_WIDTH*2-1 downto
                                               0);
    signal r_address_counter_even_i : integer range 0 to B_RAM_SIZE -1;
--value read from BRAM (odd index) before writing to address
  begin
    -- Block ram row for even addresses and row indexes of the correlation matrix
    block_ram_even : entity work.block_ram
      generic map (
        B_RAM_SIZE      => B_RAM_SIZE,
        B_RAM_BIT_WIDTH => B_RAM_BIT_WIDTH)
      port map (
        clk           => clk,
        aresetn       => reset_n,
        data_in       => data_in_even_i,
        write_enable  => write_enable,
        read_enable   => read_enable,
        read_address  => read_address_even,
        write_address => write_address_even,
        data_out      => data_out_even_i);
    -- Block ram row for odd addresses and row indexes of the correlation matrix
    block_ram_odd : entity work.block_ram
      generic map (
        B_RAM_SIZE      => B_RAM_SIZE,
        B_RAM_BIT_WIDTH => B_RAM_BIT_WIDTH)
      port map (
        clk           => clk,
        aresetn       => reset_n,
        data_in       => data_in_odd_i,
        write_enable  => write_enable,
        read_enable   => read_enable,
        read_address  => read_address_odd,
        write_address => write_address_odd,
        data_out      => data_out_odd_i);

-- generate P_BAND write PROCESSES writes on clock cycle after 
    process(clk, clk_en, din, valid, reset_n)
      variable a_factor_01_i : std_logic_vector(PIXEL_DATA_WIDTH-1 downto 0);
      variable a_factor_02_i : std_logic_vector(PIXEL_DATA_WIDTH-1 downto 0);
      variable b_factor_01_i : std_logic_vector(PIXEL_DATA_WIDTH-1 downto 0);
      variable b_factor_02_i : std_logic_vector(PIXEL_DATA_WIDTH-1 downto 0);
      variable v_address     : integer range 0 to B_RAM_SIZE -1;
    begin

      if rising_edge(clk) and clk_en = '1' then
        if reset_n = '0' or valid = '0' then
          a_factor_01_i       := (others => '0');
          a_factor_02_i       := (others => '0');
          b_factor_01_i       := (others => '0');
          b_factor_02_i       := (others => '0');
          write_done_on_row   <= (others => '0');
          v_address           := 0;
          write_enable        <= '0';
          read_enable         <= '1';
          flag_has_read_first <= '0';
          flag_first_pixel    <= '1';

        elsif valid = '1' and to_integer(unsigned(write_done_on_row)) < NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM then
          if flag_has_read_first = '0' then
            -- need to read the first element before doing any writes
            v_address              := r_address_counter_even_i;
            read_address_even_temp <= v_address;
            read_address_odd_temp  <= v_address +1;
            v_address              := v_address +1;
            flag_has_read_first    <= '1';
            write_enable           <= '1';
          else
            v_address               := r_address_counter_even_i;
            write_address_even_temp <= v_address;
            read_address_even_temp  <= v_address+2;
            write_address_odd_temp  <= v_address+1;
            read_address_odd_temp   <= v_address+3;
            v_address               := v_address +2;
            --r_address_counter_even <= r_address_counter_even +2;
            write_done_on_row       <= std_logic_vector(to_unsigned(to_integer(unsigned(write_done_on_row)) + 1, write_done_on_row'length));
          end if;
          if (to_integer(unsigned(write_done_on_row)) <= NUMBER_OF_WRITES_PER_ROW-1 and flag_first_pixel = '0') then
            write_enable <= '1';
            read_enable  <= '1';

            --input din is horizontal vector. A/B_factor 01 is the transposed
            --vertical element factor of the product din.' * din. A/B_factor_02 is
            --the horizontal element.
            a_factor_01_i := din(P_BANDS*PIXEL_DATA_WIDTH - ((P_BANDS- i)*PIXEL_DATA_WIDTH) + PIXEL_DATA_WIDTH-1 downto P_BANDS*PIXEL_DATA_WIDTH- ((P_BANDS- i)*PIXEL_DATA_WIDTH));
            -- "Horizontal" element
            b_factor_02_i := din(P_BANDS*PIXEL_DATA_WIDTH - (P_BANDS- to_integer(unsigned(write_done_on_row)))*PIXEL_DATA_WIDTH +NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM*PIXEL_DATA_WIDTH-1 + to_integer(unsigned(write_done_on_row))*PIXEL_DATA_WIDTH downto P_BANDS*PIXEL_DATA_WIDTH- (P_BANDS- to_integer(unsigned(write_done_on_row)))*PIXEL_DATA_WIDTH+to_integer(unsigned(write_done_on_row))*PIXEL_DATA_WIDTH +PIXEL_DATA_WIDTH);

            input_even_i   <= std_logic_vector(to_signed(to_integer(signed(a_factor_01_i))*to_integer(signed(a_factor_02_i)), input_even_i'length));
            input_odd_i    <= std_logic_vector(to_signed(to_integer(signed(b_factor_01_i))*to_integer(signed(b_factor_02_i)), input_odd_i'length));
            data_in_even_i <= std_logic_vector(to_signed(to_integer(signed(input_even_i))+ to_integer(signed(data_out_even_i)), data_in_even_i'length));
            data_in_odd_i  <= std_logic_vector(to_signed(to_integer(signed(input_odd_i)) + to_integer(signed(data_out_odd_i)), data_in_odd_i'length));

          elsif to_integer(unsigned(write_done_on_row)) = 0 and flag_first_pixel = '1' then
            -- special case for the first pixel written, where
            -- the data contained in the BRAM is ot
            -- initialized to something known.
            --input din is horizontal vector. A/B_factor 01 is the transposed
            --vertical element factor of the product din.' * din. A/B_factor_02 is
            --the horizontal element.
            a_factor_01_i := din(P_BANDS*PIXEL_DATA_WIDTH - ((P_BANDS- i)*PIXEL_DATA_WIDTH) + PIXEL_DATA_WIDTH-1 downto P_BANDS*PIXEL_DATA_WIDTH- ((P_BANDS- i)*PIXEL_DATA_WIDTH));
            -- "Horizontal" element
            b_factor_02_i := din(P_BANDS*PIXEL_DATA_WIDTH - (P_BANDS- to_integer(unsigned(write_done_on_row)))*PIXEL_DATA_WIDTH +NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM*PIXEL_DATA_WIDTH-1 + to_integer(unsigned(write_done_on_row))*PIXEL_DATA_WIDTH downto P_BANDS*PIXEL_DATA_WIDTH- (P_BANDS- to_integer(unsigned(write_done_on_row)))*PIXEL_DATA_WIDTH+to_integer(unsigned(write_done_on_row))*PIXEL_DATA_WIDTH +PIXEL_DATA_WIDTH);

            input_even_i   <= std_logic_vector(to_signed(to_integer(signed(a_factor_01_i))*to_integer(signed(a_factor_02_i)), input_even_i'length));
            input_odd_i    <= std_logic_vector(to_signed(to_integer(signed(b_factor_01_i))*to_integer(signed(b_factor_02_i)), input_odd_i'length));
            data_in_even_i <= input_even_i;
            data_in_odd_i  <= input_odd_i;
          end if;

        elsif to_integer(unsigned(write_done_on_row)) >= NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM then
          -- Assuming consequent pixels are hold valid, starting working on
          -- next pixel next cycle;
          write_done_on_row <= std_logic_vector(to_unsigned(0, write_done_on_row'length));
          --r_address_counter_even <= 0;
          v_address         := 0;
          flag_first_pixel  <= '0';
        end if;
        r_address_counter_even_i <= v_address;
      end if;
    end process;
    read_address_even  <= read_address_even_temp;
    write_address_even <= write_address_even_temp;
    read_address_odd   <= read_address_odd_temp;
    write_address_odd  <= write_address_odd_temp;

    dout(P_BANDS*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM-(P_BANDS-i)*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM + PIXEL_DATA_WIDTH*2-1 downto P_BANDS*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM - (P_BANDS-i)*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM)                                                        <= data_out_even_i;
    dout(P_BANDS*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM-(P_BANDS-i)*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM + PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM-1 downto P_BANDS*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM - (P_BANDS-i)*PIXEL_DATA_WIDTH*2*NUMBER_OF_WRITES_PER_CYCLE_PER_BRAM+PIXEL_DATA_WIDTH*2) <= data_out_odd_i;
  end generate;

  -- process to drive address inputs
  process(clk, clk_en)

  begin
  end process;


  writes_done_on_row <= write_done_on_row;

end Behavioral;
