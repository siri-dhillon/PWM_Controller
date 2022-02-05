library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity luminance is
    generic (
        pwm_res : integer := 8 --8bits
          );
    port (
        clk : in std_logic; --clock from prescaler
        pwm_count : in integer;
        duty_cycle : out integer
    );
end luminance;

architecture rtl of luminance is

    signal dc_temp : integer range 0 to 255; 
  begin
  
    gen_DC : process (clk, pwm_count)
    begin  -- process gen_DC
      if rising_edge(clk) then   -- rising clock edge
        if dc_temp = ((2**pwm_res)-1) then
            dc_temp <= 0; 
        elsif pwm_count = 0 then
            dc_temp <= dc_temp + 1; 
        end if;
      end if;
    end process gen_DC;

    duty_cycle <= dc_temp; -- duty cycle set 

end architecture;