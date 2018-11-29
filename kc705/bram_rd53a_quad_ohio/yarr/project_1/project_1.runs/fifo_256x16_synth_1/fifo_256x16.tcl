# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k325tffg900-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.cache/wt [current_project]
set_property parent.project_path /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:kc705:part0:1.3 [current_project]
read_ip -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16.xci
set_property is_locked true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top fifo_256x16 -part xc7k325tffg900-2 -mode out_of_context

rename_ref -prefix_all fifo_256x16_

write_checkpoint -force -noxdef fifo_256x16.dcp

catch { report_utilization -file fifo_256x16_utilization_synth.rpt -pb fifo_256x16_utilization_synth.pb }

if { [catch {
  file copy -force /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.runs/fifo_256x16_synth_1/fifo_256x16.dcp /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.ip_user_files/ip/fifo_256x16]} {
  catch { 
    file copy -force /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_stub.v /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.ip_user_files/ip/fifo_256x16
  }
}

if {[file isdir /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.ip_user_files/ip/fifo_256x16]} {
  catch { 
    file copy -force /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_stub.vhdl /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.ip_user_files/ip/fifo_256x16
  }
}