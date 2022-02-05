library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

entity scale_clock is
    generic (
        fpga_clk : integer := 100000000;  -- (hz) 100 Mhz
        pwm_clk : integer := 1; -- experiment should be in 255000 hz
        pwm_res : integer := 8 --8bits
          );
        
  port (
    --inputs
    i_clk : in  std_logic; --100MhZ
    i_rst : in  std_logic;

    --outputs
    clock  : out std_logic); --1khz*255 
end scale_clock;

architecture Behavioral of scale_clock is

  --constants
  constant clock_counter : integer := fpga_clk / (pwm_clk* (2**(pwm_res)-1));
  --constant clock_counter : integer := 255;
 
 --signals
  signal prescaler_counter : integer range 0 to clock_counter;
  signal clk_temp_sig : std_logic:= '0';
  signal temp_max : integer; --get rid of this as well
begin

  temp_max <= clock_counter; -- we want this to be  ??? so the clock to be 255kHz
  gen_clk : process (i_clk, i_rst)
  begin  -- process gen_clk
    if (i_rst = '1') then
      clk_temp_sig <= '0';
      prescaler_counter <= 0;
    elsif rising_edge(i_clk) then   -- rising clock edge
      if (prescaler_counter = clock_counter ) then     -- checking the counter
        prescaler_counter <= 0;
        clk_temp_sig <= not(clk_temp_sig);
      else
        prescaler_counter <= prescaler_counter + 1;
      end if;
    end if;
  end process gen_clk;

clock <= clk_temp_sig;

end Behavioral;
