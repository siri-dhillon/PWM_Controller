library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity sawtoothTB is
end sawtoothTB;

architecture sim of sawtoothTB is

    constant clk_hz : integer := 100000000;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal pwm_out : std_logic := '1';

    signal duty_cycle : integer := 0;
    signal pwm_count : integer := 0;
	signal led_out : std_logic_vector(7 downto 0);

    signal clock : std_logic;

    --constants for generic
      constant pwm_clk : integer := 2000; -- experiment should be in 255000 hz
      constant pwm_res : integer := 8; --8bits

begin

     clk <= not clk after clk_period / 2;
    
    DUT3 : entity work.sawtooth port map (
        clk => clk,
        rst => rst,
        led_out => led_out       
    );

    SEQUENCER_PROC : process
    begin
	wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10000000;
        assert false
            report "Replace this with your test cases"
            severity failure;

        finish;
    end process;

end architecture;