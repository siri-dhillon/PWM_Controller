library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

ENTITY prescalerTB IS
END prescalerTB;

architecture sim of prescalerTB is


    --constants
    constant clk_hz : integer := 100000000;
    constant clk_period : time := 1 sec / clk_hz; --- T = 1/f => T=1/100000000 => T = 10nsec

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal clock : std_logic;


begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.scale_clock port map(
    i_clk => clk, --right side signal created in this file
    i_rst => rst,
    clock => clock
);

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10000000;

        rst <= '1';

        assert false
            report "Replace this with your test cases"
            severity failure;

        finish;
    end process;

end architecture;
