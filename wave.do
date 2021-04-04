onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /IF_Testbench/IF/clk
add wave -noupdate /IF_Testbench/IF/reset
add wave -noupdate -radix hexadecimal /IF_Testbench/IF/pc_branch
add wave -noupdate /IF_Testbench/IF/select
add wave -noupdate -radix hexadecimal /IF_Testbench/IF/instruction
add wave -noupdate -radix hexadecimal /IF_Testbench/IF/pc_current
add wave -noupdate -radix hexadecimal /IF_Testbench/IF/pc_next
add wave -noupdate -radix hexadecimal /IF_Testbench/IF/pc_4
add wave -noupdate /IF_Testbench/clk
add wave -noupdate /IF_Testbench/reset
add wave -noupdate -radix hexadecimal /IF_Testbench/instruction
add wave -noupdate -radix hexadecimal /IF_Testbench/branches
add wave -noupdate -radix hexadecimal /IF_Testbench/branch
add wave -noupdate /IF_Testbench/select
add wave -noupdate -radix hexadecimal /IF_Testbench/concat
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 249
configure wave -valuecolwidth 158
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
WaveRestoreZoom {0 ps} {26 ps}
