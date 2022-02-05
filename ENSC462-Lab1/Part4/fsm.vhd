library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use IEEE.MATH_REAL.ALL;

entity fsm is
    generic (
        pwm_res : integer := 8 -- 8 bits
          );
    port (
        clk : in std_logic;     -- clock from prescaler
        addr : in integer;      -- from pwm_sine
        --rst: in std_logic;      -- looks like all components need a reset, and we need it for FSM
        duty_cycle : out integer
    );
end fsm;

architecture rtl of fsm is

    signal addr_temp : integer range 0 to (2**pwm_res-1);
    signal fsm_pwm_count : integer range 0 to (2**pwm_res-1);
    signal dc_temp : integer range 0 to (2**pwm_res-1);
    --signal exit_wait : std_logic;
    
    constant  MATH_PI :  real := 3.14;  

    --defining array type
    type rom_type is array (0 to (2**pwm_res)/2) of integer range 0 to (2**pwm_res - 1);

    -- FSM states declaration
    type t_State is (increment_state, decrement_state);
    signal State : t_State;

    --function for saving values in ROM 
    function create_rom return rom_type is 
        variable sine_value : real;
        variable angle : real;
        variable romVar: rom_type;
         begin
            for i in 0 to 127 loop
                 angle := (((real(i)*2.0)*MATH_PI)/(2.0**pwm_res)+((3.0*MATH_PI)/2.0)); 
                 sine_value := ((1.0 + (sin(angle)))*(2.0**(real(pwm_res)))-1.0)/2.0; 
                 romVar(i) := integer(sine_value); 
            end loop; return romVar; 
    end create_rom;
    
    --instantiate rom here because functions are sequential
    constant rom : rom_type := create_rom; -- is this supposed to be here??
    signal rom_temp : rom_type;

  begin

    --determines the values we return to duty cycle

	rom_temp <= rom;

    FSM_PROC : process(clk)
    begin
        if rising_edge(clk) then
                --default values        

                case State is
    
                    when increment_state =>    --left of sin(0)
                        addr_temp <= fsm_pwm_count; 
                        dc_temp <= rom(addr_temp);
     
                        if fsm_pwm_count = 127 then
                            state <= decrement_state;
			            end if;
                        
                    when decrement_state =>     --right of sin(0)
           		        addr_temp <= 255 - fsm_pwm_count;
                        dc_temp <= rom(addr_temp);
                        if fsm_pwm_count = ((2**pwm_res)-1) then
                            state <= increment_state;
			            end if;
                end case;
    
            end if;
    end process;

    gen_DC : process (clk, addr)
    begin  -- process gen_DC
      if rising_edge(clk) then   -- rising clock edge
        if fsm_pwm_count = ((2**pwm_res)-1) then
            fsm_pwm_count <= 0; 
        elsif addr = 0 then
            fsm_pwm_count <= fsm_pwm_count + 1; 
        end if;
      end if;
    end process gen_DC;

    duty_cycle <= dc_temp; -- duty cycle set 

    --duty_cycle <= rom(addr_temp);

end architecture;