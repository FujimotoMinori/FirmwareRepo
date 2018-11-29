// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Sun Oct 14 04:49:17 2018
// Host        : kekatlaspc9 running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/pcie_7x_0_stub.v
// Design      : pcie_7x_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pcie_7x_0_pcie2_top,Vivado 2016.2" *)
module pcie_7x_0(pci_exp_txp, pci_exp_txn, pci_exp_rxp, pci_exp_rxn, user_clk_out, user_reset_out, user_lnk_up, user_app_rdy, tx_buf_av, tx_cfg_req, tx_err_drop, s_axis_tx_tready, s_axis_tx_tdata, s_axis_tx_tkeep, s_axis_tx_tlast, s_axis_tx_tvalid, s_axis_tx_tuser, m_axis_rx_tdata, m_axis_rx_tkeep, m_axis_rx_tlast, m_axis_rx_tvalid, m_axis_rx_tready, m_axis_rx_tuser, cfg_status, cfg_command, cfg_dstatus, cfg_dcommand, cfg_lstatus, cfg_lcommand, cfg_dcommand2, cfg_pcie_link_state, cfg_pmcsr_pme_en, cfg_pmcsr_powerstate, cfg_pmcsr_pme_status, cfg_received_func_lvl_rst, cfg_interrupt, cfg_interrupt_rdy, cfg_interrupt_assert, cfg_interrupt_di, cfg_interrupt_do, cfg_interrupt_mmenable, cfg_interrupt_msienable, cfg_interrupt_msixenable, cfg_interrupt_msixfm, cfg_interrupt_stat, cfg_pciecap_interrupt_msgnum, cfg_to_turnoff, cfg_bus_number, cfg_device_number, cfg_function_number, cfg_msg_received, cfg_msg_data, cfg_bridge_serr_en, cfg_slot_control_electromech_il_ctl_pulse, cfg_root_control_syserr_corr_err_en, cfg_root_control_syserr_non_fatal_err_en, cfg_root_control_syserr_fatal_err_en, cfg_root_control_pme_int_en, cfg_aer_rooterr_corr_err_reporting_en, cfg_aer_rooterr_non_fatal_err_reporting_en, cfg_aer_rooterr_fatal_err_reporting_en, cfg_aer_rooterr_corr_err_received, cfg_aer_rooterr_non_fatal_err_received, cfg_aer_rooterr_fatal_err_received, cfg_msg_received_err_cor, cfg_msg_received_err_non_fatal, cfg_msg_received_err_fatal, cfg_msg_received_pm_as_nak, cfg_msg_received_pm_pme, cfg_msg_received_pme_to_ack, cfg_msg_received_assert_int_a, cfg_msg_received_assert_int_b, cfg_msg_received_assert_int_c, cfg_msg_received_assert_int_d, cfg_msg_received_deassert_int_a, cfg_msg_received_deassert_int_b, cfg_msg_received_deassert_int_c, cfg_msg_received_deassert_int_d, cfg_msg_received_setslotpowerlimit, cfg_vc_tcvc_map, sys_clk, sys_rst_n)
/* synthesis syn_black_box black_box_pad_pin="pci_exp_txp[3:0],pci_exp_txn[3:0],pci_exp_rxp[3:0],pci_exp_rxn[3:0],user_clk_out,user_reset_out,user_lnk_up,user_app_rdy,tx_buf_av[5:0],tx_cfg_req,tx_err_drop,s_axis_tx_tready,s_axis_tx_tdata[63:0],s_axis_tx_tkeep[7:0],s_axis_tx_tlast,s_axis_tx_tvalid,s_axis_tx_tuser[3:0],m_axis_rx_tdata[63:0],m_axis_rx_tkeep[7:0],m_axis_rx_tlast,m_axis_rx_tvalid,m_axis_rx_tready,m_axis_rx_tuser[21:0],cfg_status[15:0],cfg_command[15:0],cfg_dstatus[15:0],cfg_dcommand[15:0],cfg_lstatus[15:0],cfg_lcommand[15:0],cfg_dcommand2[15:0],cfg_pcie_link_state[2:0],cfg_pmcsr_pme_en,cfg_pmcsr_powerstate[1:0],cfg_pmcsr_pme_status,cfg_received_func_lvl_rst,cfg_interrupt,cfg_interrupt_rdy,cfg_interrupt_assert,cfg_interrupt_di[7:0],cfg_interrupt_do[7:0],cfg_interrupt_mmenable[2:0],cfg_interrupt_msienable,cfg_interrupt_msixenable,cfg_interrupt_msixfm,cfg_interrupt_stat,cfg_pciecap_interrupt_msgnum[4:0],cfg_to_turnoff,cfg_bus_number[7:0],cfg_device_number[4:0],cfg_function_number[2:0],cfg_msg_received,cfg_msg_data[15:0],cfg_bridge_serr_en,cfg_slot_control_electromech_il_ctl_pulse,cfg_root_control_syserr_corr_err_en,cfg_root_control_syserr_non_fatal_err_en,cfg_root_control_syserr_fatal_err_en,cfg_root_control_pme_int_en,cfg_aer_rooterr_corr_err_reporting_en,cfg_aer_rooterr_non_fatal_err_reporting_en,cfg_aer_rooterr_fatal_err_reporting_en,cfg_aer_rooterr_corr_err_received,cfg_aer_rooterr_non_fatal_err_received,cfg_aer_rooterr_fatal_err_received,cfg_msg_received_err_cor,cfg_msg_received_err_non_fatal,cfg_msg_received_err_fatal,cfg_msg_received_pm_as_nak,cfg_msg_received_pm_pme,cfg_msg_received_pme_to_ack,cfg_msg_received_assert_int_a,cfg_msg_received_assert_int_b,cfg_msg_received_assert_int_c,cfg_msg_received_assert_int_d,cfg_msg_received_deassert_int_a,cfg_msg_received_deassert_int_b,cfg_msg_received_deassert_int_c,cfg_msg_received_deassert_int_d,cfg_msg_received_setslotpowerlimit,cfg_vc_tcvc_map[6:0],sys_clk,sys_rst_n" */;
  output [3:0]pci_exp_txp;
  output [3:0]pci_exp_txn;
  input [3:0]pci_exp_rxp;
  input [3:0]pci_exp_rxn;
  output user_clk_out;
  output user_reset_out;
  output user_lnk_up;
  output user_app_rdy;
  output [5:0]tx_buf_av;
  output tx_cfg_req;
  output tx_err_drop;
  output s_axis_tx_tready;
  input [63:0]s_axis_tx_tdata;
  input [7:0]s_axis_tx_tkeep;
  input s_axis_tx_tlast;
  input s_axis_tx_tvalid;
  input [3:0]s_axis_tx_tuser;
  output [63:0]m_axis_rx_tdata;
  output [7:0]m_axis_rx_tkeep;
  output m_axis_rx_tlast;
  output m_axis_rx_tvalid;
  input m_axis_rx_tready;
  output [21:0]m_axis_rx_tuser;
  output [15:0]cfg_status;
  output [15:0]cfg_command;
  output [15:0]cfg_dstatus;
  output [15:0]cfg_dcommand;
  output [15:0]cfg_lstatus;
  output [15:0]cfg_lcommand;
  output [15:0]cfg_dcommand2;
  output [2:0]cfg_pcie_link_state;
  output cfg_pmcsr_pme_en;
  output [1:0]cfg_pmcsr_powerstate;
  output cfg_pmcsr_pme_status;
  output cfg_received_func_lvl_rst;
  input cfg_interrupt;
  output cfg_interrupt_rdy;
  input cfg_interrupt_assert;
  input [7:0]cfg_interrupt_di;
  output [7:0]cfg_interrupt_do;
  output [2:0]cfg_interrupt_mmenable;
  output cfg_interrupt_msienable;
  output cfg_interrupt_msixenable;
  output cfg_interrupt_msixfm;
  input cfg_interrupt_stat;
  input [4:0]cfg_pciecap_interrupt_msgnum;
  output cfg_to_turnoff;
  output [7:0]cfg_bus_number;
  output [4:0]cfg_device_number;
  output [2:0]cfg_function_number;
  output cfg_msg_received;
  output [15:0]cfg_msg_data;
  output cfg_bridge_serr_en;
  output cfg_slot_control_electromech_il_ctl_pulse;
  output cfg_root_control_syserr_corr_err_en;
  output cfg_root_control_syserr_non_fatal_err_en;
  output cfg_root_control_syserr_fatal_err_en;
  output cfg_root_control_pme_int_en;
  output cfg_aer_rooterr_corr_err_reporting_en;
  output cfg_aer_rooterr_non_fatal_err_reporting_en;
  output cfg_aer_rooterr_fatal_err_reporting_en;
  output cfg_aer_rooterr_corr_err_received;
  output cfg_aer_rooterr_non_fatal_err_received;
  output cfg_aer_rooterr_fatal_err_received;
  output cfg_msg_received_err_cor;
  output cfg_msg_received_err_non_fatal;
  output cfg_msg_received_err_fatal;
  output cfg_msg_received_pm_as_nak;
  output cfg_msg_received_pm_pme;
  output cfg_msg_received_pme_to_ack;
  output cfg_msg_received_assert_int_a;
  output cfg_msg_received_assert_int_b;
  output cfg_msg_received_assert_int_c;
  output cfg_msg_received_assert_int_d;
  output cfg_msg_received_deassert_int_a;
  output cfg_msg_received_deassert_int_b;
  output cfg_msg_received_deassert_int_c;
  output cfg_msg_received_deassert_int_d;
  output cfg_msg_received_setslotpowerlimit;
  output [6:0]cfg_vc_tcvc_map;
  input sys_clk;
  input sys_rst_n;
endmodule
