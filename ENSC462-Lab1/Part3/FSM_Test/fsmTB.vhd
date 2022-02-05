library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity fsmTB is
end fsmTB;

architecture sim of fsmTB is

    constant clk_hz : integer := 100000000;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal pwm_out : std_logic := '1';

    signal duty_cycle : integer := 0;
    signal pwm_count : integer := 0;

    signal clock : std_logic;

    --constants for generic
      constant pwm_clk : integer := 2000; -- experiment should be in 255000 hz
      constant pwm_res : integer := 8; --8bits

begin

     clk <= not clk after clk_period / 2;
    
    DUT1 : entity work.scale_clock 
     generic map(
       fpga_clk => clk_hz,
        pwm_clk => pwm_clk,
        pwm_res => pwm_res
     )
    port map(
        i_clk => clk,
        i_rst => rst,
        clock => clock
    );

    DUT2 : entity work.fsm port map (
        clk => clk,
        addr => pwm_count,
        --rst => rst,
        duty_cycle => duty_cycle       
    );


    DUT3 : entity work.pwm port map (
        clk => clk,
        duty_cycle => duty_cycle,
        pwm_count => pwm_count,
        pwm_out => pwm_out       
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 100000000;

        rst <= '1';

        assert false
            report "Replace this with your test cases"
            severity failure;

        finish;
    end process;

end architecture;