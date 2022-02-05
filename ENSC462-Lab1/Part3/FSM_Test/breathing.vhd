library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity breathing is
    port (
        clk : in std_logic;
        rst : in std_logic;
        led_out :  out std_logic_vector(7 downto 0)
    );
end breathing;

architecture rtl of breathing is 
signal prescaler_clk_out : std_logic;
signal pwm_count : integer :=0;
signal duty_cycle : integer :=0;
signal pwm_count_sig : integer := 0 ; 
signal pwm_out_signal : std_logic;

begin

DUT1 : entity work.scale_clock port map (
        i_clk => clk,
        i_rst => rst,
        clock => prescaler_clk_out
    );

DUT2 : entity work.fsm port map (
    clk => prescaler_clk_out,
    addr => pwm_count_sig,
    --rst => rst,
    duty_cycle => duty_cycle       
);

DUT3 : entity work.pwm port map (
        clk => prescaler_clk_out,
        duty_cycle => duty_cycle,
        pwm_count => pwm_count_sig,
        pwm_out => pwm_out_signal
    );

led_out(7) <= pwm_out_signal;
led_out(6) <= pwm_out_signal;
led_out(5) <= pwm_out_signal;
led_out(4) <= pwm_out_signal;
led_out(3) <= pwm_out_signal;
led_out(2) <= pwm_out_signal;
led_out(1) <= pwm_out_signal;
led_out(0) <= pwm_out_signal;


end architecture;