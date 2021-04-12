onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ID_and_RF_TB/clk
add wave -noupdate /ID_and_RF_TB/pc
add wave -noupdate /ID_and_RF_TB/read_data_1
add wave -noupdate /ID_and_RF_TB/read_data_2
add wave -noupdate /ID_and_RF_TB/extended
add wave -noupdate /ID_and_RF_TB/Func
add wave -noupdate /ID_and_RF_TB/ALU_Src
add wave -noupdate /ID_and_RF_TB/Mem_Write
add wave -noupdate /ID_and_RF_TB/Mem_to_Reg
add wave -noupdate /ID_and_RF_TB/Mem_Read
add wave -noupdate /ID_and_RF_TB/Branch
add wave -noupdate /ID_and_RF_TB/ALU_Op
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 60
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
WaveRestoreZoom {0 ps} {25640 ps}
