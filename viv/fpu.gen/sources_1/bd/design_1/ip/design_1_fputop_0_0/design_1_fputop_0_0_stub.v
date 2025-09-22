// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue Sep 23 02:16:00 2025
// Host        : maestro running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/mihir/iith/sem5/carch/lab3/submission/viv/fpu.gen/sources_1/bd/design_1/ip/design_1_fputop_0_0/design_1_fputop_0_0_stub.v
// Design      : design_1_fputop_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_fputop_0_0,fputop,{}" *) (* CORE_GENERATION_INFO = "design_1_fputop_0_0,fputop,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fputop,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fputop,Vivado 2025.1" *) 
module design_1_fputop_0_0(clk, rst, ins, dbus_low, dbus_high, result_low, 
  result_high, bus1, wrdata_low, wrdata_high)
/* synthesis syn_black_box black_box_pad_pin="rst,ins[23:0],dbus_low[31:0],dbus_high[31:0],result_low[31:0],result_high[31:0],bus1[31:0],wrdata_low[31:0],wrdata_high[31:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input rst;
  input [23:0]ins;
  input [31:0]dbus_low;
  input [31:0]dbus_high;
  output [31:0]result_low;
  output [31:0]result_high;
  output [31:0]bus1;
  output [31:0]wrdata_low;
  output [31:0]wrdata_high;
endmodule
