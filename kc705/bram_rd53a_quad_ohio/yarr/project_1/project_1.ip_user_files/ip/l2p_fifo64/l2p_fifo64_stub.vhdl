-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
-- Date        : Sun Oct 14 05:54:53 2018
-- Host        : kekatlaspc9 running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/l2p_fifo64/l2p_fifo64_stub.vhdl
-- Design      : l2p_fifo64
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity l2p_fifo64 is
  Port ( 
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    prog_full : out STD_LOGIC
  );

end l2p_fifo64;

architecture stub of l2p_fifo64 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "rst,wr_clk,rd_clk,din[63:0],wr_en,rd_en,prog_full_thresh_assert[9:0],prog_full_thresh_negate[9:0],dout[63:0],full,empty,valid,prog_full";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_1_1,Vivado 2016.2";
begin
end;