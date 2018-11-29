-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
-- Date        : Sun Oct 14 04:49:17 2018
-- Host        : kekatlaspc9 running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/pcie_7x_0/pcie_7x_0_stub.vhdl
-- Design      : pcie_7x_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcie_7x_0 is
  Port ( 
    pci_exp_txp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pci_exp_txn : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pci_exp_rxp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pci_exp_rxn : in STD_LOGIC_VECTOR ( 3 downto 0 );
    user_clk_out : out STD_LOGIC;
    user_reset_out : out STD_LOGIC;
    user_lnk_up : out STD_LOGIC;
    user_app_rdy : out STD_LOGIC;
    tx_buf_av : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_cfg_req : out STD_LOGIC;
    tx_err_drop : out STD_LOGIC;
    s_axis_tx_tready : out STD_LOGIC;
    s_axis_tx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tx_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tx_tlast : in STD_LOGIC;
    s_axis_tx_tvalid : in STD_LOGIC;
    s_axis_tx_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_rx_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_rx_tlast : out STD_LOGIC;
    m_axis_rx_tvalid : out STD_LOGIC;
    m_axis_rx_tready : in STD_LOGIC;
    m_axis_rx_tuser : out STD_LOGIC_VECTOR ( 21 downto 0 );
    cfg_status : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_command : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_dstatus : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_dcommand : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_lstatus : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_lcommand : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_dcommand2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_pcie_link_state : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_pmcsr_pme_en : out STD_LOGIC;
    cfg_pmcsr_powerstate : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_pmcsr_pme_status : out STD_LOGIC;
    cfg_received_func_lvl_rst : out STD_LOGIC;
    cfg_interrupt : in STD_LOGIC;
    cfg_interrupt_rdy : out STD_LOGIC;
    cfg_interrupt_assert : in STD_LOGIC;
    cfg_interrupt_di : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_interrupt_do : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_interrupt_mmenable : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_interrupt_msienable : out STD_LOGIC;
    cfg_interrupt_msixenable : out STD_LOGIC;
    cfg_interrupt_msixfm : out STD_LOGIC;
    cfg_interrupt_stat : in STD_LOGIC;
    cfg_pciecap_interrupt_msgnum : in STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_to_turnoff : out STD_LOGIC;
    cfg_bus_number : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_device_number : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_function_number : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_msg_received : out STD_LOGIC;
    cfg_msg_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_bridge_serr_en : out STD_LOGIC;
    cfg_slot_control_electromech_il_ctl_pulse : out STD_LOGIC;
    cfg_root_control_syserr_corr_err_en : out STD_LOGIC;
    cfg_root_control_syserr_non_fatal_err_en : out STD_LOGIC;
    cfg_root_control_syserr_fatal_err_en : out STD_LOGIC;
    cfg_root_control_pme_int_en : out STD_LOGIC;
    cfg_aer_rooterr_corr_err_reporting_en : out STD_LOGIC;
    cfg_aer_rooterr_non_fatal_err_reporting_en : out STD_LOGIC;
    cfg_aer_rooterr_fatal_err_reporting_en : out STD_LOGIC;
    cfg_aer_rooterr_corr_err_received : out STD_LOGIC;
    cfg_aer_rooterr_non_fatal_err_received : out STD_LOGIC;
    cfg_aer_rooterr_fatal_err_received : out STD_LOGIC;
    cfg_msg_received_err_cor : out STD_LOGIC;
    cfg_msg_received_err_non_fatal : out STD_LOGIC;
    cfg_msg_received_err_fatal : out STD_LOGIC;
    cfg_msg_received_pm_as_nak : out STD_LOGIC;
    cfg_msg_received_pm_pme : out STD_LOGIC;
    cfg_msg_received_pme_to_ack : out STD_LOGIC;
    cfg_msg_received_assert_int_a : out STD_LOGIC;
    cfg_msg_received_assert_int_b : out STD_LOGIC;
    cfg_msg_received_assert_int_c : out STD_LOGIC;
    cfg_msg_received_assert_int_d : out STD_LOGIC;
    cfg_msg_received_deassert_int_a : out STD_LOGIC;
    cfg_msg_received_deassert_int_b : out STD_LOGIC;
    cfg_msg_received_deassert_int_c : out STD_LOGIC;
    cfg_msg_received_deassert_int_d : out STD_LOGIC;
    cfg_msg_received_setslotpowerlimit : out STD_LOGIC;
    cfg_vc_tcvc_map : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sys_clk : in STD_LOGIC;
    sys_rst_n : in STD_LOGIC
  );

end pcie_7x_0;

architecture stub of pcie_7x_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pci_exp_txp[3:0],pci_exp_txn[3:0],pci_exp_rxp[3:0],pci_exp_rxn[3:0],user_clk_out,user_reset_out,user_lnk_up,user_app_rdy,tx_buf_av[5:0],tx_cfg_req,tx_err_drop,s_axis_tx_tready,s_axis_tx_tdata[63:0],s_axis_tx_tkeep[7:0],s_axis_tx_tlast,s_axis_tx_tvalid,s_axis_tx_tuser[3:0],m_axis_rx_tdata[63:0],m_axis_rx_tkeep[7:0],m_axis_rx_tlast,m_axis_rx_tvalid,m_axis_rx_tready,m_axis_rx_tuser[21:0],cfg_status[15:0],cfg_command[15:0],cfg_dstatus[15:0],cfg_dcommand[15:0],cfg_lstatus[15:0],cfg_lcommand[15:0],cfg_dcommand2[15:0],cfg_pcie_link_state[2:0],cfg_pmcsr_pme_en,cfg_pmcsr_powerstate[1:0],cfg_pmcsr_pme_status,cfg_received_func_lvl_rst,cfg_interrupt,cfg_interrupt_rdy,cfg_interrupt_assert,cfg_interrupt_di[7:0],cfg_interrupt_do[7:0],cfg_interrupt_mmenable[2:0],cfg_interrupt_msienable,cfg_interrupt_msixenable,cfg_interrupt_msixfm,cfg_interrupt_stat,cfg_pciecap_interrupt_msgnum[4:0],cfg_to_turnoff,cfg_bus_number[7:0],cfg_device_number[4:0],cfg_function_number[2:0],cfg_msg_received,cfg_msg_data[15:0],cfg_bridge_serr_en,cfg_slot_control_electromech_il_ctl_pulse,cfg_root_control_syserr_corr_err_en,cfg_root_control_syserr_non_fatal_err_en,cfg_root_control_syserr_fatal_err_en,cfg_root_control_pme_int_en,cfg_aer_rooterr_corr_err_reporting_en,cfg_aer_rooterr_non_fatal_err_reporting_en,cfg_aer_rooterr_fatal_err_reporting_en,cfg_aer_rooterr_corr_err_received,cfg_aer_rooterr_non_fatal_err_received,cfg_aer_rooterr_fatal_err_received,cfg_msg_received_err_cor,cfg_msg_received_err_non_fatal,cfg_msg_received_err_fatal,cfg_msg_received_pm_as_nak,cfg_msg_received_pm_pme,cfg_msg_received_pme_to_ack,cfg_msg_received_assert_int_a,cfg_msg_received_assert_int_b,cfg_msg_received_assert_int_c,cfg_msg_received_assert_int_d,cfg_msg_received_deassert_int_a,cfg_msg_received_deassert_int_b,cfg_msg_received_deassert_int_c,cfg_msg_received_deassert_int_d,cfg_msg_received_setslotpowerlimit,cfg_vc_tcvc_map[6:0],sys_clk,sys_rst_n";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pcie_7x_0_pcie2_top,Vivado 2016.2";
begin
end;
