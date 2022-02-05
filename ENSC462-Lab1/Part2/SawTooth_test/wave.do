onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sawtoothtb/clk
add wave -noupdate /sawtoothtb/rst
add wave -noupdate /sawtoothtb/pwm_out
add wave -noupdate /sawtoothtb/duty_cycle
add wave -noupdate /sawtoothtb/pwm_count
add wave -noupdate -expand /sawtoothtb/led_out
add wave -noupdate /sawtoothtb/clock
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100000019280 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {100000019050 ps} {100000020050 ps}
