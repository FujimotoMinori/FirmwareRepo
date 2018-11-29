// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Sun Oct 14 05:10:43 2018
// Host        : kekatlaspc9 running 64-bit CentOS Linux release 7.4.1708 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/atlasj/work/XpressK7_RD53A/YARR_ocha/debug/Yarr-fw/ip-cores/kintex7/fifo_32x512/fifo_32x512_stub.v
// Design      : fifo_32x512
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_1,Vivado 2016.2" *)
module fifo_32x512(rst, wr_clk, rd_clk, din, wr_en, rd_en, prog_full_thresh_assert, prog_full_thresh_negate, dout, full, empty, valid, prog_full)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[31:0],wr_en,rd_en,prog_full_thresh_assert[9:0],prog_full_thresh_negate[9:0],dout[31:0],full,empty,valid,prog_full" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [31:0]din;
  input wr_en;
  input rd_en;
  input [9:0]prog_full_thresh_assert;
  input [9:0]prog_full_thresh_negate;
  output [31:0]dout;
  output full;
  output empty;
  output valid;
  output prog_full;
endmodule
