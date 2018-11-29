// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Sun Oct 14 06:02:30 2018
// Host        : kekatlaspc9 running 64-bit CentOS Linux release 7.4.1708 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/clk_gen/clk_gen_stub.v
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen(clk_250_in, clk_250, clk_160, clk_80, clk_40, clk_40_90, clk_640, clk_300, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_250_in,clk_250,clk_160,clk_80,clk_40,clk_40_90,clk_640,clk_300,reset,locked" */;
  input clk_250_in;
  output clk_250;
  output clk_160;
  output clk_80;
  output clk_40;
  output clk_40_90;
  output clk_640;
  output clk_300;
  input reset;
  output locked;
endmodule
