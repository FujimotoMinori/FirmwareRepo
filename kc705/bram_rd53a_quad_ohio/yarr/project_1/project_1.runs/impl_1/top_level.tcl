proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7k325tffg900-2
  set_property board_part xilinx.com:kc705:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.cache/wt [current_project]
  set_property parent.project_path /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.xpr [current_project]
  set_property ip_repo_paths /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.cache/ip [current_project]
  set_property ip_output_repo /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/bram_rd53a_quad_ohio/yarr/project_1/project_1.runs/synth_1/top_level.dcp
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_axis/ila_axis.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_axis/ila_axis.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/pcie_7x_0.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/pcie_7x_0.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_ddr/ila_ddr.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_ddr/ila_ddr.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_wsh_pipe/ila_wsh_pipe.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_wsh_pipe/ila_wsh_pipe.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_rx_dma_wb/ila_rx_dma_wb.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_rx_dma_wb/ila_rx_dma_wb.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen.dcp]
  add_files -quiet /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0.dcp]
  read_xdc -mode out_of_context -ref ila_axis -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_axis/ila_axis_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_axis/ila_axis_ooc.xdc]
  read_xdc -ref ila_axis -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_axis/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_axis/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref fifo_256x16 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16_ooc.xdc]
  read_xdc -ref fifo_256x16 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16/fifo_256x16.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16/fifo_256x16.xdc]
  read_xdc -mode out_of_context -ref pcie_7x_0 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/synth/pcie_7x_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/synth/pcie_7x_0_ooc.xdc]
  read_xdc -ref pcie_7x_0 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/source/pcie_7x_0-PCIE_X0Y0.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/source/pcie_7x_0-PCIE_X0Y0.xdc]
  read_xdc -mode out_of_context -ref ila_ddr -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_ddr/ila_ddr_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_ddr/ila_ddr_ooc.xdc]
  read_xdc -ref ila_ddr -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_ddr/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_ddr/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref fifo_32x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512_ooc.xdc]
  read_xdc -ref fifo_32x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512/fifo_32x512.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512/fifo_32x512.xdc]
  read_xdc -mode out_of_context -ref rx_bridge_ctrl_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo_ooc.xdc]
  read_xdc -ref rx_bridge_ctrl_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo.xdc]
  read_xdc -mode out_of_context -ref fifo_605x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32_ooc.xdc]
  read_xdc -ref fifo_605x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32/fifo_605x32.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32/fifo_605x32.xdc]
  read_xdc -mode out_of_context -ref ila_wsh_pipe -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_wsh_pipe/ila_wsh_pipe_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_wsh_pipe/ila_wsh_pipe_ooc.xdc]
  read_xdc -ref ila_wsh_pipe -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_wsh_pipe/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_wsh_pipe/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref fifo_64x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512_ooc.xdc]
  read_xdc -ref fifo_64x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512/fifo_64x512.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512/fifo_64x512.xdc]
  read_xdc -mode out_of_context -ref axis_data_fifo_1 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1_ooc.xdc]
  read_xdc -ref axis_data_fifo_1 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1/axis_data_fifo_1.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1/axis_data_fifo_1.xdc]
  read_xdc -mode out_of_context -ref fifo_8x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32_ooc.xdc]
  read_xdc -ref fifo_8x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32/fifo_8x32.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32/fifo_8x32.xdc]
  read_xdc -mode out_of_context -ref fifo_29x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32_ooc.xdc]
  read_xdc -ref fifo_29x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32/fifo_29x32.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32/fifo_29x32.xdc]
  read_xdc -mode out_of_context -ref rx_channel_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo_ooc.xdc]
  read_xdc -ref rx_channel_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo/rx_channel_fifo.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo/rx_channel_fifo.xdc]
  read_xdc -mode out_of_context -ref ila_rx_dma_wb -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_rx_dma_wb/ila_rx_dma_wb_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_rx_dma_wb/ila_rx_dma_wb_ooc.xdc]
  read_xdc -ref ila_rx_dma_wb -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_rx_dma_wb/ila_v6_1/constraints/ila.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/ila_rx_dma_wb/ila_v6_1/constraints/ila.xdc]
  read_xdc -mode out_of_context -ref l2p_fifo64 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64_ooc.xdc]
  read_xdc -ref l2p_fifo64 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64/l2p_fifo64.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64/l2p_fifo64.xdc]
  read_xdc -mode out_of_context -ref tx_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo_ooc.xdc]
  read_xdc -ref tx_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo/tx_fifo.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo/tx_fifo.xdc]
  read_xdc -mode out_of_context -ref fifo_96x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512_ooc.xdc]
  read_xdc -ref fifo_96x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512/fifo_96x512.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512/fifo_96x512.xdc]
  read_xdc -mode out_of_context -ref rx_bridge_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo_ooc.xdc]
  read_xdc -ref rx_bridge_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo/rx_bridge_fifo.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo/rx_bridge_fifo.xdc]
  read_xdc -mode out_of_context -ref clk_gen -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_gen -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen_board.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen_board.xdc]
  read_xdc -ref clk_gen -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen.xdc]
  read_xdc -mode out_of_context -ref axis_data_fifo_0 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0_ooc.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0_ooc.xdc]
  read_xdc -ref axis_data_fifo_0 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0/axis_data_fifo_0.xdc
  set_property processing_order EARLY [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0/axis_data_fifo_0.xdc]
  read_xdc /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/constrs_kc705.xdc
  read_xdc /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/constrs_kc705_timing.xdc
  read_xdc /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/kc705-fmc-quad-dp-ohio-dbyarr.xdc
  read_xdc /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/syn/kc705/constrs_kc705_ila.xdc
  read_xdc -ref fifo_256x16 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16/fifo_256x16_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_256x16/fifo_256x16/fifo_256x16_clocks.xdc]
  read_xdc -ref fifo_32x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512/fifo_32x512_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512/fifo_32x512_clocks.xdc]
  read_xdc -ref rx_bridge_ctrl_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo/rx_bridge_ctrl_fifo_clocks.xdc]
  read_xdc -ref fifo_605x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32/fifo_605x32_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_605x32/fifo_605x32/fifo_605x32_clocks.xdc]
  read_xdc -ref fifo_64x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512/fifo_64x512_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_64x512/fifo_64x512/fifo_64x512_clocks.xdc]
  read_xdc -ref axis_data_fifo_1 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1/axis_data_fifo_1_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_1/axis_data_fifo_1/axis_data_fifo_1_clocks.xdc]
  read_xdc -ref fifo_8x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32/fifo_8x32_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_8x32/fifo_8x32/fifo_8x32_clocks.xdc]
  read_xdc -ref fifo_29x32 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32/fifo_29x32_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_29x32/fifo_29x32/fifo_29x32_clocks.xdc]
  read_xdc -ref rx_channel_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo/rx_channel_fifo_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_channel_fifo/rx_channel_fifo/rx_channel_fifo_clocks.xdc]
  read_xdc -ref l2p_fifo64 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64/l2p_fifo64_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64/l2p_fifo64_clocks.xdc]
  read_xdc -ref tx_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo/tx_fifo_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/tx_fifo/tx_fifo/tx_fifo_clocks.xdc]
  read_xdc -ref fifo_96x512 -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512/fifo_96x512_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_96x512_1/fifo_96x512/fifo_96x512_clocks.xdc]
  read_xdc -ref rx_bridge_fifo -cells U0 /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo/rx_bridge_fifo_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo/rx_bridge_fifo_clocks.xdc]
  read_xdc -ref axis_data_fifo_0 -cells inst /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0/axis_data_fifo_0_clocks.xdc
  set_property processing_order LATE [get_files /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/axis_data_fifo_0/axis_data_fifo_0/axis_data_fifo_0_clocks.xdc]
  link_design -top top_level -part xc7k325tffg900-2
  write_hwdef -file top_level.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force top_level_opt.dcp
  report_drc -file top_level_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force top_level_placed.dcp
  report_io -file top_level_io_placed.rpt
  report_utilization -file top_level_utilization_placed.rpt -pb top_level_utilization_placed.pb
  report_control_sets -verbose -file top_level_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force top_level_routed.dcp
  report_drc -file top_level_drc_routed.rpt -pb top_level_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file top_level_timing_summary_routed.rpt -rpx top_level_timing_summary_routed.rpx
  report_power -file top_level_power_routed.rpt -pb top_level_power_summary_routed.pb -rpx top_level_power_routed.rpx
  report_route_status -file top_level_route_status.rpt -pb top_level_route_status.pb
  report_clock_utilization -file top_level_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force top_level.mmi }
  write_bitstream -force top_level.bit 
  catch { write_sysdef -hwdef top_level.hwdef -bitfile top_level.bit -meminfo top_level.mmi -file top_level.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

