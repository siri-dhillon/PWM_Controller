onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fsmtb/clk
add wave -noupdate /fsmtb/rst
add wave -noupdate /fsmtb/pwm_out
add wave -noupdate -format Analog-Step -height 74 -max 254.99999999999997 /fsmtb/duty_cycle
add wave -noupdate /fsmtb/pwm_count
add wave -noupdate /fsmtb/clock
add wave -noupdate /fsmtb/DUT2/addr_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {129304619643 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {129300617885 ps} {130923330751 ps}
