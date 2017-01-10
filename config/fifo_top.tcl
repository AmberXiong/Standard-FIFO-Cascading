# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xcku040-ffva1156-2-e

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/pyxiong/FPGA_Project/FIFO_StateMachine_2/FIFO_StateMachine_2.cache/wt [current_project]
set_property parent.project_path /home/pyxiong/FPGA_Project/FIFO_StateMachine_2/FIFO_StateMachine_2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:kcu105:part0:1.1 [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_ip /home/pyxiong/FPGA_Project/FIFO_TEST/FIFO_TEST.srcs/sources_1/ip/fifo_36_512/fifo_36_512.xci
set_property used_in_implementation false [get_files -all /home/pyxiong/FPGA_Project/FIFO_TEST/FIFO_TEST.srcs/sources_1/ip/fifo_36_512/fifo_36_512.dcp]
set_property used_in_implementation false [get_files -all /home/pyxiong/FPGA_Project/FIFO_TEST/FIFO_TEST.srcs/sources_1/ip/fifo_36_512/fifo_36_512/fifo_36_512_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/pyxiong/FPGA_Project/FIFO_TEST/FIFO_TEST.srcs/sources_1/ip/fifo_36_512/fifo_36_512/fifo_36_512.xdc]
set_property used_in_implementation false [get_files -all /home/pyxiong/FPGA_Project/FIFO_TEST/FIFO_TEST.srcs/sources_1/ip/fifo_36_512/fifo_36_512_ooc.xdc]
set_property is_locked true [get_files /home/pyxiong/FPGA_Project/FIFO_TEST/FIFO_TEST.srcs/sources_1/ip/fifo_36_512/fifo_36_512.xci]

read_verilog -library xil_defaultlib {
  /home/pyxiong/FPGA_Project/FIFO_StateMachine_2/FIFO_StateMachine_2.srcs/sources_1/new/seperate_statemachine.v
  /home/pyxiong/FPGA_Project/FIFO_StateMachine_2/FIFO_StateMachine_2.srcs/sources_1/new/fifo_top.v
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top fifo_top -part xcku040-ffva1156-2-e
write_checkpoint -noxdef fifo_top.dcp
catch { report_utilization -file fifo_top_utilization_synth.rpt -pb fifo_top_utilization_synth.pb }
