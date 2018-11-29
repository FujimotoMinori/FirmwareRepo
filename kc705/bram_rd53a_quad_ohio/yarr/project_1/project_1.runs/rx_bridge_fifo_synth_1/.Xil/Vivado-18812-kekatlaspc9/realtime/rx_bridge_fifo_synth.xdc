set_property SRC_FILE_INFO {cfile:/home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo_ooc.xdc rfile:../../../../../../../../../../ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo_ooc.xdc id:1 order:EARLY scoped_inst:U0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo/rx_bridge_fifo.xdc rfile:../../../../../../../../../../ip-cores/kintex7/rx_bridge_fifo/rx_bridge_fifo/rx_bridge_fifo.xdc id:2 order:EARLY scoped_inst:U0} [current_design]
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells U0]
set_property src_info {type:SCOPED_XDC file:1 line:55 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
create_clock -period 10.000 -name rd_clk [get_ports rd_clk]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
create_clock -period 10.000 -name wr_clk [get_ports wr_clk]
set_property src_info {type:SCOPED_XDC file:2 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -through [get_ports rst] -to [get_pins [list U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/grstd1.grst_full.grst_f.rst_d1_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/grstd1.grst_full.grst_f.rst_d2_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/grstd1.grst_full.grst_f.rst_d3_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_asreg_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rst_rd_reg1_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rst_rd_reg2_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rst_wr_reg1_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rst_wr_reg2_reg/PRE U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_asreg_reg/PRE {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]/PRE} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]/PRE} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]/PRE} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]/PRE} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]/PRE} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_reg_reg[2]/PRE}]]
set_property src_info {type:SCOPED_XDC file:2 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_cells [list {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]} {U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.wr_rst_reg_reg[2]}]]