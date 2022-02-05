onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pwmtb/clk
add wave -noupdate /pwmtb/rst
add wave -noupdate /pwmtb/pwm_out
add wave -noupdate /pwmtb/duty_cycle
add wave -noupdate /pwmtb/pwm_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39215679999183 ps} 0}
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
WaveRestoreZoom {39215679999050 ps} {39215680000050 ps}
