#Fixed polarity
#la25_p
#la25_n
set_property PACKAGE_PIN AC26 [get_ports {ext_trig_i_p[2]}] 
set_property PACKAGE_PIN AD26 [get_ports {ext_trig_i_n[2]}] 
#la29_p
#la29_n
set_property PACKAGE_PIN AE28 [get_ports {ext_trig_i_p[1]}] 
set_property PACKAGE_PIN AF28 [get_ports {ext_trig_i_n[1]}] 
#la22_p
#la22_n
set_property PACKAGE_PIN AJ27 [get_ports {ext_trig_i_p[3]}] 
set_property PACKAGE_PIN AK28 [get_ports {ext_trig_i_n[3]}] 
#la21_p
#la21_n
set_property PACKAGE_PIN AG27 [get_ports {ext_trig_i_p[0]}] 
set_property PACKAGE_PIN AG28 [get_ports {ext_trig_i_n[0]}] 

#Wrong polarity in comment
#la32_n
#la32_p
set_property PACKAGE_PIN Y30 [get_ports {fe_data_p[1]}]
set_property PACKAGE_PIN AA30 [get_ports {fe_data_n[1]}]
#la30_n
#la30_p
set_property PACKAGE_PIN AB29 [get_ports {fe_data_p[2]}]
set_property PACKAGE_PIN AB30 [get_ports {fe_data_n[2]}]
#la28_n
#la28_p
set_property PACKAGE_PIN AE30 [get_ports {fe_data_p[3]}]
set_property PACKAGE_PIN AF30 [get_ports {fe_data_n[3]}]
#la26_n
#la26_p
#set_property PACKAGE_PIN J13 [get_ports {fe_clk_p[3]}]
#set_property PACKAGE_PIN H13 [get_ports {fe_clk_n[3]}]
#la00_cc_n
#la00_cc_p
set_property PACKAGE_PIN AD23 [get_ports {eudet_rst_p}]
set_property PACKAGE_PIN AE24 [get_ports {eudet_rst_n}]
#la01_cc_n
#la01_cc_p
#set_property PACKAGE_PIN P23 [get_ports {fe_cmd_p[0]}]
#set_property PACKAGE_PIN N23 [get_ports {fe_cmd_n[0]}]
#la02_n
#la02_p
set_property PACKAGE_PIN AF20 [get_ports {eudet_clk_p}]
set_property PACKAGE_PIN AF21 [get_ports {eudet_clk_n}]
#la03_n
#la03_p
set_property PACKAGE_PIN AG20 [get_ports {eudet_trig_p}]
set_property PACKAGE_PIN AH20 [get_ports {eudet_trig_n}]
#la04_n
#la04_p
#set_property PACKAGE_PIN AH21 [get_ports {fe_data_p[3]}]
#set_property PACKAGE_PIN AJ21 [get_ports {fe_data_n[3]}]
#la06_n
#la06_p
#set_property PACKAGE_PIN AK20 [get_ports {fe_data_p[2]}]
#set_property PACKAGE_PIN Y21 [get_ports {fe_data_n[2]}]
#la33_n
#la33_p
set_property PACKAGE_PIN AC29 [get_ports {fe_cmd_p[0]}]
set_property PACKAGE_PIN AC30 [get_ports {fe_cmd_n[0]}]
#la05_n
#la05_p
set_property PACKAGE_PIN M24 [get_ports {latch_o}]
set_property PACKAGE_PIN L24 [get_ports {sdi_i}]




#la31_n
#la31_p
set_property PACKAGE_PIN AD29 [get_ports {fe_data_p[0]}]
set_property PACKAGE_PIN AE29 [get_ports {fe_data_n[0]}]
#la27_n
#la27_p
set_property PACKAGE_PIN B15 [get_ports {fe_clk_p[0]}]
set_property PACKAGE_PIN AJ29 [get_ports {fe_clk_n[0]}]
#la07_n
#la07_p
#set_property PACKAGE_PIN AG25 [get_ports {fe_cmd_p[7]}]
#set_property PACKAGE_PIN AH25 [get_ports {fe_cmd_n[7]}]

#la24_n
#la24_p
#set_property PACKAGE_PIN AG30 [get_ports {fe_data_p[0]}]
#set_property PACKAGE_PIN AH30 [get_ports {fe_data_n[0]}]
#la23_n
#la23_p
#set_property PACKAGE_PIN G17 [get_ports {fe_data_p[1]}]
#set_property PACKAGE_PIN F18 [get_ports {fe_data_n[1]}]
#la11_n
#la11_p
#set_property PACKAGE_PIN AE25 [get_ports {fe_data_p[2]}]
#set_property PACKAGE_PIN AF25 [get_ports {fe_data_n[2]}]
#la10_n
#la10_p
#set_property PACKAGE_PIN AJ24 [get_ports {fe_data_p[3]}]
#set_property PACKAGE_PIN V22 [get_ports {fe_data_n[3]}]
#la08_n
#la08_p
set_property PACKAGE_PIN AJ22 [get_ports {eudet_busy_p}]
set_property PACKAGE_PIN AJ23 [get_ports {eudet_busy_n}]
#la09_n
#la09_p
#set_property PACKAGE_PIN G22 [get_ports {fe_data_p[7]}]
#set_property PACKAGE_PIN F23 [get_ports {fe_data_n[7]}]
#la13_n
#la13_p
set_property PACKAGE_PIN T20 [get_ports {sda_o}]
set_property PACKAGE_PIN R20 [get_ports {scl_o}]

#la12_n
#set_property PACKAGE_PIN AB20 [get_ports {io[0]}]
#la14_n
#set_property PACKAGE_PIN T19 [get_ports {io[1]}]
#la16_n
#set_property PACKAGE_PIN AD22 [get_ports {io[2]}]

#set_property IOSTANDARD LVDS_25 [get_ports fe_cmd_*]
#set_property SLEW FAST [get_ports fe_cmd*]

#hb09_p 
#hb09_n
#set_property PACKAGE_PIN B14 [get_ports {ext_trig_i_p}]
#set_property PACKAGE_PIN A14 [get_ports {ext_trig_i_n}]

#ha03_p
#ha03_n
#set_property PACKAGE_PIN U17 [get_ports {ext_busy_o_p}]
#set_property PACKAGE_PIN T17 [get_ports {ext_busy_o_n}]

set_property PACKAGE_PIN N16 [get_ports {sda_io}]
set_property PACKAGE_PIN J14 [get_ports {scl_io}]

set_property IOSTANDARD LVDS_25 [get_ports fe_data_*]
set_property DIFF_TERM TRUE [get_ports fe_data_*]
set_property IBUF_LOW_PWR FALSE [get_ports fe_data_*]

set_property IOSTANDARD LVDS_25 [get_ports fe_clk_*]
set_property SLEW FAST [get_ports fe_clk*]

set_property IOSTANDARD LVDS_25 [get_ports eudet_*]
set_property IOSTANDARD LVDS_25 [get_ports ext_trig_*]
set_property DIFF_TERM TRUE [get_ports ext_trig_*]
set_property IOSTANDARD LVDS_25 [get_ports ext_busy_*]

set_property IOSTANDARD LVCMOS25 [get_ports {scl_o}]
set_property IOSTANDARD LVCMOS25 [get_ports {sda_o}]
set_property IOSTANDARD LVCMOS25 [get_ports {latch_o}]
set_property IOSTANDARD LVCMOS25 [get_ports {sdi_i}]

set_property IOSTANDARD LVCMOS25 [get_ports {sda_io}]
set_property IOSTANDARD LVCMOS25 [get_ports {scl_io}]

#  Rising Edge Source Synchronous Outputs 
#
#  Source synchronous output interfaces can be constrained either by the max data skew
#  relative to the generated clock or by the destination device setup/hold requirements.
#
#  Max Skew Case:
#  The skew requirements for FPGA are known from system level analysis.
#
# forwarded                _____________        
# clock        ___________|             |_________
#                         |                        
#                 bre_skew|are_skew          
#                 <------>|<------>        
#           ______        |        ____________    
# data      ______XXXXXXXXXXXXXXXXX____________XXXXX
#
# Example of creating generated clock at clock output port
# create_generated_clock -name <gen_clock_name> -multiply_by 1 -source [get_pins <source_pin>] [get_ports <output_clock_port>]
# gen_clock_name is the name of forwarded clock here. It should be used below for defining "fwclk".	

set fwclk       	clk_160_s;	# forwarded clock name (generated using create_generated_clock at output clock port)
set fwclk_period 	6.25;	# forwarded clock period
set bre_skew 		-0.050;			# skew requirement before rising edge
set are_skew 		0.050;			# skew requirement after rising edge
set output_ports 	fe_cmd_*;	# list of output ports

# Output Delay Constraints
set_output_delay -clock $fwclk -max [expr $fwclk_period - $are_skew] [get_ports $output_ports];
set_output_delay -clock $fwclk -min $bre_skew                        [get_ports $output_ports];

# Report Timing Template
# report_timing -to [get_ports $output_ports] -max_paths 20 -nworst 1 -delay_type min_max -name src_sync_pos_out -file src_sync_pos_out.txt;











