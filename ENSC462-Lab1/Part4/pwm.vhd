library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm is
    generic (
        pwm_res : integer := 8 --8bits
          );
    port (
        clk : in std_logic; --clock from prescaler
        duty_cycle : in integer; --clock from prescaler
        pwm_count : out integer;
        pwm_out : out std_logic
        
    );
end pwm;

architecture rtl of pwm is

    signal pwm_count_sig : integer := 0; 
    signal pwm_out_sig : integer := 0;  
  begin

    gen_pwm_count : process (clk)
    begin  -- process gen_DC
      if rising_edge(clk) then   -- rising clock edge
        if pwm_count_sig = 255 then
            pwm_count_sig <= 0;
        else 
            pwm_count_sig <= pwm_count_sig + 1;
      end if;
      end if;
    end process;
  
    pwm_count <= pwm_count_sig; 

    gen_pwm_out : process (clk, duty_cycle) 
    begin  -- process gen_DC
      if rising_edge(clk) then   -- rising clock edge
        if pwm_count_sig < duty_cycle then 
            pwm_out <= '1'; 
        else 
            pwm_out <= '0';
        end if;
      end if;
    end process;

end architecture;