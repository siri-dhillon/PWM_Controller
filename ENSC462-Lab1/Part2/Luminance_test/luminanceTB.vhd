library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity luminanceTB is
end luminanceTB;

architecture sim of luminanceTB is

    constant clk_hz : integer := 255000;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    -- signal rst : std_logic := '1';

    --output
    signal duty_cycle : integer := 0;

    -- for pwm_count signal 
    signal pwm_count_sig : integer := 0 ; 

begin

    clk <= not clk after clk_period / 2;

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
    

    DUT : entity work.luminance port map (
        clk => clk,
        pwm_count => pwm_count_sig,
        duty_cycle => duty_cycle       
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 10000000;
        assert false
            report "Replace this with your test cases"
            severity failure;

        finish;
    end process;

end architecture;