# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k325tffg900-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/pixeldaq/FirmwareRepo/kc705/bram_rd53a_quad_ohio/project_2/project_2.cache/wt [current_project]
set_property parent.project_path /home/pixeldaq/FirmwareRepo/kc705/bram_rd53a_quad_ohio/project_2/project_2.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:kc705:part0:1.3 [current_project]
read_mem /home/pixeldaq/rtl/kintex7/rx-core/decode_8b10b/dec.mif
read_vhdl -library xil_defaultlib /home/pixeldaq/FirmwareRepo/kc705/bram_yarr_kc705.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705.xdc
set_property used_in_implementation false [get_files /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705.xdc]

read_xdc /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705_timing.xdc
set_property used_in_implementation false [get_files /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705_timing.xdc]

read_xdc /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705_ila.xdc
set_property used_in_implementation false [get_files /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705_ila.xdc]

read_xdc /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705_ohio_exttrig.xdc
set_property used_in_implementation false [get_files /home/pixeldaq/FirmwareRepo/kc705/constrs_kc705_ohio_exttrig.xdc]


synth_design -top top_level -part xc7k325tffg900-2


write_checkpoint -force -noxdef top_level.dcp

catch { report_utilization -file top_level_utilization_synth.rpt -pb top_level_utilization_synth.pb }
