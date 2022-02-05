library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity pwmTB is
end pwmTB;

architecture sim of pwmTB is

    constant clk_hz : integer := 255000;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal pwm_out : std_logic := '1';

    signal duty_cycle : integer := 0;
    signal pwm_count : integer := 0;

begin

     clk <= not clk after clk_period / 2;
    
    DUT1 : entity work.luminance port map (
        clk => clk,
        pwm_count => pwm_count,
        duty_cycle => duty_cycle        
    );

    DUT2 : entity work.pwm port map (
        clk => clk,
        duty_cycle => duty_cycle,
        pwm_count => pwm_count,
        pwm_out => pwm_out       
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