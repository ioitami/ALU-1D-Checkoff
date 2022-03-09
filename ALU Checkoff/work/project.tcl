set projDir "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/vivado"
set projName "ALU Checkoff"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/au_top_0.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/alu_tester_1.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/alufn_inputter_2.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/alu_check_ans_3.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/alu_errorcase_4.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/button_conditioner_5.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/edge_detector_6.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/reset_conditioner_7.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/alu_8.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/pipeline_9.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/adder_10.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/boolean_11.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/shifter_12.v" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/verilog/compare_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "G:/Program\ Files\ G\ Drive/AlchitryLabs/library/components/au.xdc" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/constraint/io.xdc" "D:/SUTD/50.002\ CompStruc/Week\ 8\ ALU\ sendhelp/ALU\ Checkoff/work/constraint/alchitry.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
