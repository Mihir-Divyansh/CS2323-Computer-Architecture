// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue Sep 23 02:14:57 2025
// Host        : maestro running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/mihir/iith/sem5/carch/lab3/submission/viv/fpu.gen/sources_1/bd/design_1/ip/design_1_fpu_inf_0_0/design_1_fpu_inf_0_0_sim_netlist.v
// Design      : design_1_fpu_inf_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_fpu_inf_0_0,fpu_inf,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "fpu_inf,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_fpu_inf_0_0
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    slv0,
    slv1,
    slv2,
    mst3,
    mst_wren,
    mst4,
    mst5,
    mst6,
    mst7,
    mst8);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 9, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [5:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [5:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input s00_axi_rready;
  output [31:0]slv0;
  output [31:0]slv1;
  output [31:0]slv2;
  input [31:0]mst3;
  input mst_wren;
  input [31:0]mst4;
  input [31:0]mst5;
  input [31:0]mst6;
  input [31:0]mst7;
  input [31:0]mst8;

  wire \<const0> ;
  wire [31:0]mst3;
  wire [31:0]mst4;
  wire [31:0]mst5;
  wire [31:0]mst6;
  wire [31:0]mst7;
  wire [31:0]mst8;
  wire mst_wren;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]slv0;
  wire [31:0]slv1;
  wire [31:0]slv2;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_fpu_inf_0_0_fpu_inf inst
       (.axi_arready_reg(s00_axi_arready),
        .axi_awready_reg(s00_axi_awready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .mst3(mst3),
        .mst4(mst4),
        .mst5(mst5),
        .mst6(mst6),
        .mst7(mst7),
        .mst8(mst8),
        .mst_wren(mst_wren),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .slv0(slv0),
        .slv1(slv1),
        .slv2(slv2));
endmodule

(* ORIG_REF_NAME = "fpu_inf" *) 
module design_1_fpu_inf_0_0_fpu_inf
   (axi_awready_reg,
    axi_arready_reg,
    axi_rvalid_reg,
    slv0,
    slv1,
    slv2,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_aclk,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    mst_wren,
    s00_axi_wstrb,
    mst3,
    mst4,
    mst5,
    mst6,
    mst7,
    mst8,
    s00_axi_aresetn,
    s00_axi_bready);
  output axi_awready_reg;
  output axi_arready_reg;
  output axi_rvalid_reg;
  output [31:0]slv0;
  output [31:0]slv1;
  output [31:0]slv2;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_aclk;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [3:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_araddr;
  input mst_wren;
  input [3:0]s00_axi_wstrb;
  input [31:0]mst3;
  input [31:0]mst4;
  input [31:0]mst5;
  input [31:0]mst6;
  input [31:0]mst7;
  input [31:0]mst8;
  input s00_axi_aresetn;
  input s00_axi_bready;

  wire axi_arready_reg;
  wire axi_awready_reg;
  wire axi_rvalid_reg;
  wire [31:0]mst3;
  wire [31:0]mst4;
  wire [31:0]mst5;
  wire [31:0]mst6;
  wire [31:0]mst7;
  wire [31:0]mst8;
  wire mst_wren;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]slv0;
  wire [31:0]slv1;
  wire [31:0]slv2;

  design_1_fpu_inf_0_0_fpu_inf_slave_lite_v1_0_S00_AXI fpu_inf_slave_lite_v1_0_S00_AXI_inst
       (.axi_arready_reg_0(axi_arready_reg),
        .axi_awready_reg_0(axi_awready_reg),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .mst3(mst3),
        .mst4(mst4),
        .mst5(mst5),
        .mst6(mst6),
        .mst7(mst7),
        .mst8(mst8),
        .mst_wren(mst_wren),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .slv0(slv0),
        .slv1(slv1),
        .slv2(slv2));
endmodule

(* ORIG_REF_NAME = "fpu_inf_slave_lite_v1_0_S00_AXI" *) 
module design_1_fpu_inf_0_0_fpu_inf_slave_lite_v1_0_S00_AXI
   (axi_awready_reg_0,
    axi_arready_reg_0,
    axi_rvalid_reg_0,
    slv0,
    slv1,
    slv2,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_aclk,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    mst_wren,
    s00_axi_wstrb,
    mst3,
    mst4,
    mst5,
    mst6,
    mst7,
    mst8,
    s00_axi_aresetn,
    s00_axi_bready);
  output axi_awready_reg_0;
  output axi_arready_reg_0;
  output axi_rvalid_reg_0;
  output [31:0]slv0;
  output [31:0]slv1;
  output [31:0]slv2;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_aclk;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [3:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_araddr;
  input mst_wren;
  input [3:0]s00_axi_wstrb;
  input [31:0]mst3;
  input [31:0]mst4;
  input [31:0]mst5;
  input [31:0]mst6;
  input [31:0]mst7;
  input [31:0]mst8;
  input s00_axi_aresetn;
  input s00_axi_bready;

  wire \FSM_sequential_state_read[0]_i_1_n_0 ;
  wire \FSM_sequential_state_read[1]_i_1_n_0 ;
  wire \FSM_sequential_state_write[0]_i_1_n_0 ;
  wire \FSM_sequential_state_write[1]_i_1_n_0 ;
  wire \axi_araddr[5]_i_1_n_0 ;
  wire axi_arready_i_1_n_0;
  wire axi_arready_reg_0;
  wire \axi_awaddr[5]_i_1_n_0 ;
  wire \axi_awaddr_reg_n_0_[2] ;
  wire \axi_awaddr_reg_n_0_[3] ;
  wire \axi_awaddr_reg_n_0_[4] ;
  wire \axi_awaddr_reg_n_0_[5] ;
  wire axi_awready_i_1_n_0;
  wire axi_awready_i_2_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_bvalid_i_2_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready_i_1_n_0;
  wire [31:0]mst3;
  wire [31:0]mst4;
  wire [31:0]mst5;
  wire [31:0]mst6;
  wire [31:0]mst7;
  wire [31:0]mst8;
  wire mst_wren;
  wire [31:7]p_1_in;
  wire [31:0]p_2_in;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire \s00_axi_rdata[0]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[0]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[10]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[11]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[12]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[13]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[14]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[15]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[16]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[17]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[18]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[19]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[1]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[20]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[21]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[22]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[23]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[24]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[25]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[26]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[27]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[28]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[29]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[2]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[30]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[31]_INST_0_i_3_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[3]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[4]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[5]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[6]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[7]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[8]_INST_0_i_2_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_1_n_0 ;
  wire \s00_axi_rdata[9]_INST_0_i_2_n_0 ;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [3:0]sel0;
  wire [31:0]slv0;
  wire [31:0]slv1;
  wire [31:0]slv2;
  wire \slv_reg0[31]_i_2_n_0 ;
  wire \slv_reg0[31]_i_3_n_0 ;
  wire \slv_reg0[31]_i_4_n_0 ;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[31]_i_2_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[31]_i_2_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire \slv_reg3[15]_i_1_n_0 ;
  wire \slv_reg3[23]_i_1_n_0 ;
  wire \slv_reg3[31]_i_1_n_0 ;
  wire \slv_reg3[7]_i_1_n_0 ;
  wire [31:0]slv_reg4;
  wire \slv_reg4[0]_i_1_n_0 ;
  wire \slv_reg4[10]_i_1_n_0 ;
  wire \slv_reg4[11]_i_1_n_0 ;
  wire \slv_reg4[12]_i_1_n_0 ;
  wire \slv_reg4[13]_i_1_n_0 ;
  wire \slv_reg4[14]_i_1_n_0 ;
  wire \slv_reg4[15]_i_1_n_0 ;
  wire \slv_reg4[15]_i_2_n_0 ;
  wire \slv_reg4[16]_i_1_n_0 ;
  wire \slv_reg4[17]_i_1_n_0 ;
  wire \slv_reg4[18]_i_1_n_0 ;
  wire \slv_reg4[19]_i_1_n_0 ;
  wire \slv_reg4[1]_i_1_n_0 ;
  wire \slv_reg4[20]_i_1_n_0 ;
  wire \slv_reg4[21]_i_1_n_0 ;
  wire \slv_reg4[22]_i_1_n_0 ;
  wire \slv_reg4[23]_i_1_n_0 ;
  wire \slv_reg4[23]_i_2_n_0 ;
  wire \slv_reg4[24]_i_1_n_0 ;
  wire \slv_reg4[25]_i_1_n_0 ;
  wire \slv_reg4[26]_i_1_n_0 ;
  wire \slv_reg4[27]_i_1_n_0 ;
  wire \slv_reg4[28]_i_1_n_0 ;
  wire \slv_reg4[29]_i_1_n_0 ;
  wire \slv_reg4[2]_i_1_n_0 ;
  wire \slv_reg4[30]_i_1_n_0 ;
  wire \slv_reg4[31]_i_1_n_0 ;
  wire \slv_reg4[31]_i_2_n_0 ;
  wire \slv_reg4[31]_i_3_n_0 ;
  wire \slv_reg4[3]_i_1_n_0 ;
  wire \slv_reg4[4]_i_1_n_0 ;
  wire \slv_reg4[5]_i_1_n_0 ;
  wire \slv_reg4[6]_i_1_n_0 ;
  wire \slv_reg4[7]_i_1_n_0 ;
  wire \slv_reg4[7]_i_2_n_0 ;
  wire \slv_reg4[8]_i_1_n_0 ;
  wire \slv_reg4[9]_i_1_n_0 ;
  wire [31:0]slv_reg5;
  wire \slv_reg5[0]_i_1_n_0 ;
  wire \slv_reg5[10]_i_1_n_0 ;
  wire \slv_reg5[11]_i_1_n_0 ;
  wire \slv_reg5[12]_i_1_n_0 ;
  wire \slv_reg5[13]_i_1_n_0 ;
  wire \slv_reg5[14]_i_1_n_0 ;
  wire \slv_reg5[15]_i_1_n_0 ;
  wire \slv_reg5[15]_i_2_n_0 ;
  wire \slv_reg5[16]_i_1_n_0 ;
  wire \slv_reg5[17]_i_1_n_0 ;
  wire \slv_reg5[18]_i_1_n_0 ;
  wire \slv_reg5[19]_i_1_n_0 ;
  wire \slv_reg5[1]_i_1_n_0 ;
  wire \slv_reg5[20]_i_1_n_0 ;
  wire \slv_reg5[21]_i_1_n_0 ;
  wire \slv_reg5[22]_i_1_n_0 ;
  wire \slv_reg5[23]_i_1_n_0 ;
  wire \slv_reg5[23]_i_2_n_0 ;
  wire \slv_reg5[24]_i_1_n_0 ;
  wire \slv_reg5[25]_i_1_n_0 ;
  wire \slv_reg5[26]_i_1_n_0 ;
  wire \slv_reg5[27]_i_1_n_0 ;
  wire \slv_reg5[28]_i_1_n_0 ;
  wire \slv_reg5[29]_i_1_n_0 ;
  wire \slv_reg5[2]_i_1_n_0 ;
  wire \slv_reg5[30]_i_1_n_0 ;
  wire \slv_reg5[31]_i_1_n_0 ;
  wire \slv_reg5[31]_i_2_n_0 ;
  wire \slv_reg5[3]_i_1_n_0 ;
  wire \slv_reg5[4]_i_1_n_0 ;
  wire \slv_reg5[5]_i_1_n_0 ;
  wire \slv_reg5[6]_i_1_n_0 ;
  wire \slv_reg5[7]_i_1_n_0 ;
  wire \slv_reg5[7]_i_2_n_0 ;
  wire \slv_reg5[8]_i_1_n_0 ;
  wire \slv_reg5[9]_i_1_n_0 ;
  wire [31:0]slv_reg6;
  wire \slv_reg6[0]_i_1_n_0 ;
  wire \slv_reg6[10]_i_1_n_0 ;
  wire \slv_reg6[11]_i_1_n_0 ;
  wire \slv_reg6[12]_i_1_n_0 ;
  wire \slv_reg6[13]_i_1_n_0 ;
  wire \slv_reg6[14]_i_1_n_0 ;
  wire \slv_reg6[15]_i_1_n_0 ;
  wire \slv_reg6[15]_i_2_n_0 ;
  wire \slv_reg6[16]_i_1_n_0 ;
  wire \slv_reg6[17]_i_1_n_0 ;
  wire \slv_reg6[18]_i_1_n_0 ;
  wire \slv_reg6[19]_i_1_n_0 ;
  wire \slv_reg6[1]_i_1_n_0 ;
  wire \slv_reg6[20]_i_1_n_0 ;
  wire \slv_reg6[21]_i_1_n_0 ;
  wire \slv_reg6[22]_i_1_n_0 ;
  wire \slv_reg6[23]_i_1_n_0 ;
  wire \slv_reg6[23]_i_2_n_0 ;
  wire \slv_reg6[24]_i_1_n_0 ;
  wire \slv_reg6[25]_i_1_n_0 ;
  wire \slv_reg6[26]_i_1_n_0 ;
  wire \slv_reg6[27]_i_1_n_0 ;
  wire \slv_reg6[28]_i_1_n_0 ;
  wire \slv_reg6[29]_i_1_n_0 ;
  wire \slv_reg6[2]_i_1_n_0 ;
  wire \slv_reg6[30]_i_1_n_0 ;
  wire \slv_reg6[31]_i_1_n_0 ;
  wire \slv_reg6[31]_i_2_n_0 ;
  wire \slv_reg6[31]_i_3_n_0 ;
  wire \slv_reg6[31]_i_4_n_0 ;
  wire \slv_reg6[3]_i_1_n_0 ;
  wire \slv_reg6[4]_i_1_n_0 ;
  wire \slv_reg6[5]_i_1_n_0 ;
  wire \slv_reg6[6]_i_1_n_0 ;
  wire \slv_reg6[7]_i_1_n_0 ;
  wire \slv_reg6[7]_i_2_n_0 ;
  wire \slv_reg6[8]_i_1_n_0 ;
  wire \slv_reg6[9]_i_1_n_0 ;
  wire [31:0]slv_reg7;
  wire \slv_reg7[0]_i_1_n_0 ;
  wire \slv_reg7[10]_i_1_n_0 ;
  wire \slv_reg7[11]_i_1_n_0 ;
  wire \slv_reg7[12]_i_1_n_0 ;
  wire \slv_reg7[13]_i_1_n_0 ;
  wire \slv_reg7[14]_i_1_n_0 ;
  wire \slv_reg7[15]_i_1_n_0 ;
  wire \slv_reg7[15]_i_2_n_0 ;
  wire \slv_reg7[16]_i_1_n_0 ;
  wire \slv_reg7[17]_i_1_n_0 ;
  wire \slv_reg7[18]_i_1_n_0 ;
  wire \slv_reg7[19]_i_1_n_0 ;
  wire \slv_reg7[1]_i_1_n_0 ;
  wire \slv_reg7[20]_i_1_n_0 ;
  wire \slv_reg7[21]_i_1_n_0 ;
  wire \slv_reg7[22]_i_1_n_0 ;
  wire \slv_reg7[23]_i_1_n_0 ;
  wire \slv_reg7[23]_i_2_n_0 ;
  wire \slv_reg7[24]_i_1_n_0 ;
  wire \slv_reg7[25]_i_1_n_0 ;
  wire \slv_reg7[26]_i_1_n_0 ;
  wire \slv_reg7[27]_i_1_n_0 ;
  wire \slv_reg7[28]_i_1_n_0 ;
  wire \slv_reg7[29]_i_1_n_0 ;
  wire \slv_reg7[2]_i_1_n_0 ;
  wire \slv_reg7[30]_i_1_n_0 ;
  wire \slv_reg7[31]_i_1_n_0 ;
  wire \slv_reg7[31]_i_2_n_0 ;
  wire \slv_reg7[31]_i_3_n_0 ;
  wire \slv_reg7[3]_i_1_n_0 ;
  wire \slv_reg7[4]_i_1_n_0 ;
  wire \slv_reg7[5]_i_1_n_0 ;
  wire \slv_reg7[6]_i_1_n_0 ;
  wire \slv_reg7[7]_i_1_n_0 ;
  wire \slv_reg7[7]_i_2_n_0 ;
  wire \slv_reg7[8]_i_1_n_0 ;
  wire \slv_reg7[9]_i_1_n_0 ;
  wire [31:0]slv_reg8;
  wire \slv_reg8[0]_i_1_n_0 ;
  wire \slv_reg8[10]_i_1_n_0 ;
  wire \slv_reg8[11]_i_1_n_0 ;
  wire \slv_reg8[12]_i_1_n_0 ;
  wire \slv_reg8[13]_i_1_n_0 ;
  wire \slv_reg8[14]_i_1_n_0 ;
  wire \slv_reg8[15]_i_1_n_0 ;
  wire \slv_reg8[15]_i_2_n_0 ;
  wire \slv_reg8[16]_i_1_n_0 ;
  wire \slv_reg8[17]_i_1_n_0 ;
  wire \slv_reg8[18]_i_1_n_0 ;
  wire \slv_reg8[19]_i_1_n_0 ;
  wire \slv_reg8[1]_i_1_n_0 ;
  wire \slv_reg8[20]_i_1_n_0 ;
  wire \slv_reg8[21]_i_1_n_0 ;
  wire \slv_reg8[22]_i_1_n_0 ;
  wire \slv_reg8[23]_i_1_n_0 ;
  wire \slv_reg8[23]_i_2_n_0 ;
  wire \slv_reg8[24]_i_1_n_0 ;
  wire \slv_reg8[25]_i_1_n_0 ;
  wire \slv_reg8[26]_i_1_n_0 ;
  wire \slv_reg8[27]_i_1_n_0 ;
  wire \slv_reg8[28]_i_1_n_0 ;
  wire \slv_reg8[29]_i_1_n_0 ;
  wire \slv_reg8[2]_i_1_n_0 ;
  wire \slv_reg8[30]_i_1_n_0 ;
  wire \slv_reg8[31]_i_1_n_0 ;
  wire \slv_reg8[31]_i_2_n_0 ;
  wire \slv_reg8[3]_i_1_n_0 ;
  wire \slv_reg8[4]_i_1_n_0 ;
  wire \slv_reg8[5]_i_1_n_0 ;
  wire \slv_reg8[6]_i_1_n_0 ;
  wire \slv_reg8[7]_i_1_n_0 ;
  wire \slv_reg8[7]_i_2_n_0 ;
  wire \slv_reg8[8]_i_1_n_0 ;
  wire \slv_reg8[9]_i_1_n_0 ;
  wire [1:0]state_read;
  wire [1:0]state_write;

  LUT6 #(
    .INIT(64'hFFFFF0007777FFFF)) 
    \FSM_sequential_state_read[0]_i_1 
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(s00_axi_rready),
        .I3(axi_rvalid_reg_0),
        .I4(state_read[0]),
        .I5(state_read[1]),
        .O(\FSM_sequential_state_read[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0FFF88880000)) 
    \FSM_sequential_state_read[1]_i_1 
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rready),
        .I3(axi_rvalid_reg_0),
        .I4(state_read[0]),
        .I5(state_read[1]),
        .O(\FSM_sequential_state_read[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_read[0]_i_1_n_0 ),
        .Q(state_read[0]),
        .R(axi_awready_i_1_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .Q(state_read[1]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFBFAAFF)) 
    \FSM_sequential_state_write[0]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(axi_awready_reg_0),
        .I3(state_write[1]),
        .I4(state_write[0]),
        .O(\FSM_sequential_state_write[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF405500)) 
    \FSM_sequential_state_write[1]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(state_write[1]),
        .I4(state_write[0]),
        .O(\FSM_sequential_state_write[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_write[0]_i_1_n_0 ),
        .Q(state_write[0]),
        .R(axi_awready_i_1_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_write[1]_i_1_n_0 ),
        .Q(state_write[1]),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'h00008000)) 
    \axi_araddr[5]_i_1 
       (.I0(s00_axi_aresetn),
        .I1(axi_arready_reg_0),
        .I2(s00_axi_arvalid),
        .I3(state_read[0]),
        .I4(state_read[1]),
        .O(\axi_araddr[5]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[0]),
        .Q(sel0[0]),
        .R(1'b0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[1]),
        .Q(sel0[1]),
        .R(1'b0));
  FDRE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[2]),
        .Q(sel0[2]),
        .R(1'b0));
  FDRE \axi_araddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\axi_araddr[5]_i_1_n_0 ),
        .D(s00_axi_araddr[3]),
        .Q(sel0[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hC4C4C4C4FFCFCFCF)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(state_read[1]),
        .I3(s00_axi_rready),
        .I4(axi_rvalid_reg_0),
        .I5(state_read[0]),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(axi_arready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    \axi_awaddr[5]_i_1 
       (.I0(state_write[1]),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(state_write[0]),
        .O(\axi_awaddr[5]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\axi_awaddr[5]_i_1_n_0 ),
        .D(s00_axi_awaddr[0]),
        .Q(\axi_awaddr_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\axi_awaddr[5]_i_1_n_0 ),
        .D(s00_axi_awaddr[1]),
        .Q(\axi_awaddr_reg_n_0_[3] ),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\axi_awaddr[5]_i_1_n_0 ),
        .D(s00_axi_awaddr[2]),
        .Q(\axi_awaddr_reg_n_0_[4] ),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\axi_awaddr[5]_i_1_n_0 ),
        .D(s00_axi_awaddr[3]),
        .Q(\axi_awaddr_reg_n_0_[5] ),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAAA2FFAF)) 
    axi_awready_i_2
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .I2(state_write[1]),
        .I3(s00_axi_wvalid),
        .I4(state_write[0]),
        .O(axi_awready_i_2_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_i_2_n_0),
        .Q(axi_awready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hDD8CEEEE8C8C4C4C)) 
    axi_bvalid_i_1
       (.I0(state_write[1]),
        .I1(s00_axi_bvalid),
        .I2(s00_axi_bready),
        .I3(axi_bvalid_i_2_n_0),
        .I4(state_write[0]),
        .I5(s00_axi_wvalid),
        .O(axi_bvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    axi_bvalid_i_2
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .O(axi_bvalid_i_2_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0FFFFFF00800080)) 
    axi_rvalid_i_1
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(state_read[0]),
        .I3(state_read[1]),
        .I4(s00_axi_rready),
        .I5(axi_rvalid_reg_0),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'hF1)) 
    axi_wready_i_1
       (.I0(state_write[0]),
        .I1(state_write[1]),
        .I2(s00_axi_wready),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(s00_axi_wready),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[0]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[0]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[0]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[0]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_INST_0_i_1 
       (.I0(slv_reg7[0]),
        .I1(slv_reg6[0]),
        .I2(sel0[1]),
        .I3(slv_reg5[0]),
        .I4(sel0[0]),
        .I5(slv_reg4[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_INST_0_i_2 
       (.I0(slv_reg3[0]),
        .I1(slv2[0]),
        .I2(sel0[1]),
        .I3(slv1[0]),
        .I4(sel0[0]),
        .I5(slv0[0]),
        .O(\s00_axi_rdata[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[10]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[10]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[10]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[10]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_INST_0_i_1 
       (.I0(slv_reg7[10]),
        .I1(slv_reg6[10]),
        .I2(sel0[1]),
        .I3(slv_reg5[10]),
        .I4(sel0[0]),
        .I5(slv_reg4[10]),
        .O(\s00_axi_rdata[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_INST_0_i_2 
       (.I0(slv_reg3[10]),
        .I1(slv2[10]),
        .I2(sel0[1]),
        .I3(slv1[10]),
        .I4(sel0[0]),
        .I5(slv0[10]),
        .O(\s00_axi_rdata[10]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[11]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[11]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[11]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[11]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_INST_0_i_1 
       (.I0(slv_reg7[11]),
        .I1(slv_reg6[11]),
        .I2(sel0[1]),
        .I3(slv_reg5[11]),
        .I4(sel0[0]),
        .I5(slv_reg4[11]),
        .O(\s00_axi_rdata[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_INST_0_i_2 
       (.I0(slv_reg3[11]),
        .I1(slv2[11]),
        .I2(sel0[1]),
        .I3(slv1[11]),
        .I4(sel0[0]),
        .I5(slv0[11]),
        .O(\s00_axi_rdata[11]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[12]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[12]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[12]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[12]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_INST_0_i_1 
       (.I0(slv_reg7[12]),
        .I1(slv_reg6[12]),
        .I2(sel0[1]),
        .I3(slv_reg5[12]),
        .I4(sel0[0]),
        .I5(slv_reg4[12]),
        .O(\s00_axi_rdata[12]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_INST_0_i_2 
       (.I0(slv_reg3[12]),
        .I1(slv2[12]),
        .I2(sel0[1]),
        .I3(slv1[12]),
        .I4(sel0[0]),
        .I5(slv0[12]),
        .O(\s00_axi_rdata[12]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[13]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[13]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[13]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[13]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_INST_0_i_1 
       (.I0(slv_reg7[13]),
        .I1(slv_reg6[13]),
        .I2(sel0[1]),
        .I3(slv_reg5[13]),
        .I4(sel0[0]),
        .I5(slv_reg4[13]),
        .O(\s00_axi_rdata[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_INST_0_i_2 
       (.I0(slv_reg3[13]),
        .I1(slv2[13]),
        .I2(sel0[1]),
        .I3(slv1[13]),
        .I4(sel0[0]),
        .I5(slv0[13]),
        .O(\s00_axi_rdata[13]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[14]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[14]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[14]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[14]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_INST_0_i_1 
       (.I0(slv_reg7[14]),
        .I1(slv_reg6[14]),
        .I2(sel0[1]),
        .I3(slv_reg5[14]),
        .I4(sel0[0]),
        .I5(slv_reg4[14]),
        .O(\s00_axi_rdata[14]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_INST_0_i_2 
       (.I0(slv_reg3[14]),
        .I1(slv2[14]),
        .I2(sel0[1]),
        .I3(slv1[14]),
        .I4(sel0[0]),
        .I5(slv0[14]),
        .O(\s00_axi_rdata[14]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[15]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[15]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[15]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[15]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_INST_0_i_1 
       (.I0(slv_reg7[15]),
        .I1(slv_reg6[15]),
        .I2(sel0[1]),
        .I3(slv_reg5[15]),
        .I4(sel0[0]),
        .I5(slv_reg4[15]),
        .O(\s00_axi_rdata[15]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_INST_0_i_2 
       (.I0(slv_reg3[15]),
        .I1(slv2[15]),
        .I2(sel0[1]),
        .I3(slv1[15]),
        .I4(sel0[0]),
        .I5(slv0[15]),
        .O(\s00_axi_rdata[15]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[16]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[16]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[16]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[16]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_INST_0_i_1 
       (.I0(slv_reg7[16]),
        .I1(slv_reg6[16]),
        .I2(sel0[1]),
        .I3(slv_reg5[16]),
        .I4(sel0[0]),
        .I5(slv_reg4[16]),
        .O(\s00_axi_rdata[16]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_INST_0_i_2 
       (.I0(slv_reg3[16]),
        .I1(slv2[16]),
        .I2(sel0[1]),
        .I3(slv1[16]),
        .I4(sel0[0]),
        .I5(slv0[16]),
        .O(\s00_axi_rdata[16]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[17]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[17]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[17]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[17]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_INST_0_i_1 
       (.I0(slv_reg7[17]),
        .I1(slv_reg6[17]),
        .I2(sel0[1]),
        .I3(slv_reg5[17]),
        .I4(sel0[0]),
        .I5(slv_reg4[17]),
        .O(\s00_axi_rdata[17]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_INST_0_i_2 
       (.I0(slv_reg3[17]),
        .I1(slv2[17]),
        .I2(sel0[1]),
        .I3(slv1[17]),
        .I4(sel0[0]),
        .I5(slv0[17]),
        .O(\s00_axi_rdata[17]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[18]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[18]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[18]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[18]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_INST_0_i_1 
       (.I0(slv_reg7[18]),
        .I1(slv_reg6[18]),
        .I2(sel0[1]),
        .I3(slv_reg5[18]),
        .I4(sel0[0]),
        .I5(slv_reg4[18]),
        .O(\s00_axi_rdata[18]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_INST_0_i_2 
       (.I0(slv_reg3[18]),
        .I1(slv2[18]),
        .I2(sel0[1]),
        .I3(slv1[18]),
        .I4(sel0[0]),
        .I5(slv0[18]),
        .O(\s00_axi_rdata[18]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[19]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[19]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[19]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[19]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_INST_0_i_1 
       (.I0(slv_reg7[19]),
        .I1(slv_reg6[19]),
        .I2(sel0[1]),
        .I3(slv_reg5[19]),
        .I4(sel0[0]),
        .I5(slv_reg4[19]),
        .O(\s00_axi_rdata[19]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_INST_0_i_2 
       (.I0(slv_reg3[19]),
        .I1(slv2[19]),
        .I2(sel0[1]),
        .I3(slv1[19]),
        .I4(sel0[0]),
        .I5(slv0[19]),
        .O(\s00_axi_rdata[19]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[1]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[1]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[1]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[1]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_INST_0_i_1 
       (.I0(slv_reg7[1]),
        .I1(slv_reg6[1]),
        .I2(sel0[1]),
        .I3(slv_reg5[1]),
        .I4(sel0[0]),
        .I5(slv_reg4[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_INST_0_i_2 
       (.I0(slv_reg3[1]),
        .I1(slv2[1]),
        .I2(sel0[1]),
        .I3(slv1[1]),
        .I4(sel0[0]),
        .I5(slv0[1]),
        .O(\s00_axi_rdata[1]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[20]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[20]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[20]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[20]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_INST_0_i_1 
       (.I0(slv_reg7[20]),
        .I1(slv_reg6[20]),
        .I2(sel0[1]),
        .I3(slv_reg5[20]),
        .I4(sel0[0]),
        .I5(slv_reg4[20]),
        .O(\s00_axi_rdata[20]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_INST_0_i_2 
       (.I0(slv_reg3[20]),
        .I1(slv2[20]),
        .I2(sel0[1]),
        .I3(slv1[20]),
        .I4(sel0[0]),
        .I5(slv0[20]),
        .O(\s00_axi_rdata[20]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[21]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[21]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[21]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[21]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_INST_0_i_1 
       (.I0(slv_reg7[21]),
        .I1(slv_reg6[21]),
        .I2(sel0[1]),
        .I3(slv_reg5[21]),
        .I4(sel0[0]),
        .I5(slv_reg4[21]),
        .O(\s00_axi_rdata[21]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_INST_0_i_2 
       (.I0(slv_reg3[21]),
        .I1(slv2[21]),
        .I2(sel0[1]),
        .I3(slv1[21]),
        .I4(sel0[0]),
        .I5(slv0[21]),
        .O(\s00_axi_rdata[21]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[22]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[22]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[22]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[22]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_INST_0_i_1 
       (.I0(slv_reg7[22]),
        .I1(slv_reg6[22]),
        .I2(sel0[1]),
        .I3(slv_reg5[22]),
        .I4(sel0[0]),
        .I5(slv_reg4[22]),
        .O(\s00_axi_rdata[22]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_INST_0_i_2 
       (.I0(slv_reg3[22]),
        .I1(slv2[22]),
        .I2(sel0[1]),
        .I3(slv1[22]),
        .I4(sel0[0]),
        .I5(slv0[22]),
        .O(\s00_axi_rdata[22]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[23]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[23]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[23]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[23]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_INST_0_i_1 
       (.I0(slv_reg7[23]),
        .I1(slv_reg6[23]),
        .I2(sel0[1]),
        .I3(slv_reg5[23]),
        .I4(sel0[0]),
        .I5(slv_reg4[23]),
        .O(\s00_axi_rdata[23]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_INST_0_i_2 
       (.I0(slv_reg3[23]),
        .I1(slv2[23]),
        .I2(sel0[1]),
        .I3(slv1[23]),
        .I4(sel0[0]),
        .I5(slv0[23]),
        .O(\s00_axi_rdata[23]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[24]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[24]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[24]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[24]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_INST_0_i_1 
       (.I0(slv_reg7[24]),
        .I1(slv_reg6[24]),
        .I2(sel0[1]),
        .I3(slv_reg5[24]),
        .I4(sel0[0]),
        .I5(slv_reg4[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_INST_0_i_2 
       (.I0(slv_reg3[24]),
        .I1(slv2[24]),
        .I2(sel0[1]),
        .I3(slv1[24]),
        .I4(sel0[0]),
        .I5(slv0[24]),
        .O(\s00_axi_rdata[24]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[25]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[25]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[25]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[25]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_INST_0_i_1 
       (.I0(slv_reg7[25]),
        .I1(slv_reg6[25]),
        .I2(sel0[1]),
        .I3(slv_reg5[25]),
        .I4(sel0[0]),
        .I5(slv_reg4[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_INST_0_i_2 
       (.I0(slv_reg3[25]),
        .I1(slv2[25]),
        .I2(sel0[1]),
        .I3(slv1[25]),
        .I4(sel0[0]),
        .I5(slv0[25]),
        .O(\s00_axi_rdata[25]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[26]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[26]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[26]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[26]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_INST_0_i_1 
       (.I0(slv_reg7[26]),
        .I1(slv_reg6[26]),
        .I2(sel0[1]),
        .I3(slv_reg5[26]),
        .I4(sel0[0]),
        .I5(slv_reg4[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_INST_0_i_2 
       (.I0(slv_reg3[26]),
        .I1(slv2[26]),
        .I2(sel0[1]),
        .I3(slv1[26]),
        .I4(sel0[0]),
        .I5(slv0[26]),
        .O(\s00_axi_rdata[26]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[27]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[27]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[27]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[27]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_INST_0_i_1 
       (.I0(slv_reg7[27]),
        .I1(slv_reg6[27]),
        .I2(sel0[1]),
        .I3(slv_reg5[27]),
        .I4(sel0[0]),
        .I5(slv_reg4[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_INST_0_i_2 
       (.I0(slv_reg3[27]),
        .I1(slv2[27]),
        .I2(sel0[1]),
        .I3(slv1[27]),
        .I4(sel0[0]),
        .I5(slv0[27]),
        .O(\s00_axi_rdata[27]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[28]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[28]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[28]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[28]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_INST_0_i_1 
       (.I0(slv_reg7[28]),
        .I1(slv_reg6[28]),
        .I2(sel0[1]),
        .I3(slv_reg5[28]),
        .I4(sel0[0]),
        .I5(slv_reg4[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_INST_0_i_2 
       (.I0(slv_reg3[28]),
        .I1(slv2[28]),
        .I2(sel0[1]),
        .I3(slv1[28]),
        .I4(sel0[0]),
        .I5(slv0[28]),
        .O(\s00_axi_rdata[28]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[29]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[29]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[29]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[29]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_INST_0_i_1 
       (.I0(slv_reg7[29]),
        .I1(slv_reg6[29]),
        .I2(sel0[1]),
        .I3(slv_reg5[29]),
        .I4(sel0[0]),
        .I5(slv_reg4[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_INST_0_i_2 
       (.I0(slv_reg3[29]),
        .I1(slv2[29]),
        .I2(sel0[1]),
        .I3(slv1[29]),
        .I4(sel0[0]),
        .I5(slv0[29]),
        .O(\s00_axi_rdata[29]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[2]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[2]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[2]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[2]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_INST_0_i_1 
       (.I0(slv_reg7[2]),
        .I1(slv_reg6[2]),
        .I2(sel0[1]),
        .I3(slv_reg5[2]),
        .I4(sel0[0]),
        .I5(slv_reg4[2]),
        .O(\s00_axi_rdata[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_INST_0_i_2 
       (.I0(slv_reg3[2]),
        .I1(slv2[2]),
        .I2(sel0[1]),
        .I3(slv1[2]),
        .I4(sel0[0]),
        .I5(slv0[2]),
        .O(\s00_axi_rdata[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[30]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[30]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[30]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[30]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_INST_0_i_1 
       (.I0(slv_reg7[30]),
        .I1(slv_reg6[30]),
        .I2(sel0[1]),
        .I3(slv_reg5[30]),
        .I4(sel0[0]),
        .I5(slv_reg4[30]),
        .O(\s00_axi_rdata[30]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_INST_0_i_2 
       (.I0(slv_reg3[30]),
        .I1(slv2[30]),
        .I2(sel0[1]),
        .I3(slv1[30]),
        .I4(sel0[0]),
        .I5(slv0[30]),
        .O(\s00_axi_rdata[30]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[31]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[31]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[31]_INST_0_i_2_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[31]_INST_0_i_3_n_0 ),
        .O(s00_axi_rdata[31]));
  LUT3 #(
    .INIT(8'h01)) 
    \s00_axi_rdata[31]_INST_0_i_1 
       (.I0(sel0[1]),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .O(\s00_axi_rdata[31]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_INST_0_i_2 
       (.I0(slv_reg7[31]),
        .I1(slv_reg6[31]),
        .I2(sel0[1]),
        .I3(slv_reg5[31]),
        .I4(sel0[0]),
        .I5(slv_reg4[31]),
        .O(\s00_axi_rdata[31]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_INST_0_i_3 
       (.I0(slv_reg3[31]),
        .I1(slv2[31]),
        .I2(sel0[1]),
        .I3(slv1[31]),
        .I4(sel0[0]),
        .I5(slv0[31]),
        .O(\s00_axi_rdata[31]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[3]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[3]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[3]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[3]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_INST_0_i_1 
       (.I0(slv_reg7[3]),
        .I1(slv_reg6[3]),
        .I2(sel0[1]),
        .I3(slv_reg5[3]),
        .I4(sel0[0]),
        .I5(slv_reg4[3]),
        .O(\s00_axi_rdata[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_INST_0_i_2 
       (.I0(slv_reg3[3]),
        .I1(slv2[3]),
        .I2(sel0[1]),
        .I3(slv1[3]),
        .I4(sel0[0]),
        .I5(slv0[3]),
        .O(\s00_axi_rdata[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[4]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[4]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[4]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[4]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_INST_0_i_1 
       (.I0(slv_reg7[4]),
        .I1(slv_reg6[4]),
        .I2(sel0[1]),
        .I3(slv_reg5[4]),
        .I4(sel0[0]),
        .I5(slv_reg4[4]),
        .O(\s00_axi_rdata[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_INST_0_i_2 
       (.I0(slv_reg3[4]),
        .I1(slv2[4]),
        .I2(sel0[1]),
        .I3(slv1[4]),
        .I4(sel0[0]),
        .I5(slv0[4]),
        .O(\s00_axi_rdata[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[5]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[5]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[5]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[5]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_INST_0_i_1 
       (.I0(slv_reg7[5]),
        .I1(slv_reg6[5]),
        .I2(sel0[1]),
        .I3(slv_reg5[5]),
        .I4(sel0[0]),
        .I5(slv_reg4[5]),
        .O(\s00_axi_rdata[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_INST_0_i_2 
       (.I0(slv_reg3[5]),
        .I1(slv2[5]),
        .I2(sel0[1]),
        .I3(slv1[5]),
        .I4(sel0[0]),
        .I5(slv0[5]),
        .O(\s00_axi_rdata[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[6]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[6]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[6]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[6]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_INST_0_i_1 
       (.I0(slv_reg7[6]),
        .I1(slv_reg6[6]),
        .I2(sel0[1]),
        .I3(slv_reg5[6]),
        .I4(sel0[0]),
        .I5(slv_reg4[6]),
        .O(\s00_axi_rdata[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_INST_0_i_2 
       (.I0(slv_reg3[6]),
        .I1(slv2[6]),
        .I2(sel0[1]),
        .I3(slv1[6]),
        .I4(sel0[0]),
        .I5(slv0[6]),
        .O(\s00_axi_rdata[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[7]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[7]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[7]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[7]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_INST_0_i_1 
       (.I0(slv_reg7[7]),
        .I1(slv_reg6[7]),
        .I2(sel0[1]),
        .I3(slv_reg5[7]),
        .I4(sel0[0]),
        .I5(slv_reg4[7]),
        .O(\s00_axi_rdata[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_INST_0_i_2 
       (.I0(slv_reg3[7]),
        .I1(slv2[7]),
        .I2(sel0[1]),
        .I3(slv1[7]),
        .I4(sel0[0]),
        .I5(slv0[7]),
        .O(\s00_axi_rdata[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[8]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[8]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[8]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[8]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_INST_0_i_1 
       (.I0(slv_reg7[8]),
        .I1(slv_reg6[8]),
        .I2(sel0[1]),
        .I3(slv_reg5[8]),
        .I4(sel0[0]),
        .I5(slv_reg4[8]),
        .O(\s00_axi_rdata[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_INST_0_i_2 
       (.I0(slv_reg3[8]),
        .I1(slv2[8]),
        .I2(sel0[1]),
        .I3(slv1[8]),
        .I4(sel0[0]),
        .I5(slv0[8]),
        .O(\s00_axi_rdata[8]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F808F8F8F808080)) 
    \s00_axi_rdata[9]_INST_0 
       (.I0(\s00_axi_rdata[31]_INST_0_i_1_n_0 ),
        .I1(slv_reg8[9]),
        .I2(sel0[3]),
        .I3(\s00_axi_rdata[9]_INST_0_i_1_n_0 ),
        .I4(sel0[2]),
        .I5(\s00_axi_rdata[9]_INST_0_i_2_n_0 ),
        .O(s00_axi_rdata[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_INST_0_i_1 
       (.I0(slv_reg7[9]),
        .I1(slv_reg6[9]),
        .I2(sel0[1]),
        .I3(slv_reg5[9]),
        .I4(sel0[0]),
        .I5(slv_reg4[9]),
        .O(\s00_axi_rdata[9]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_INST_0_i_2 
       (.I0(slv_reg3[9]),
        .I1(slv2[9]),
        .I2(sel0[1]),
        .I3(slv1[9]),
        .I4(sel0[0]),
        .I5(slv0[9]),
        .O(\s00_axi_rdata[9]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h01000000)) 
    \slv_reg0[15]_i_1 
       (.I0(\slv_reg0[31]_i_2_n_0 ),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(s00_axi_wstrb[1]),
        .I4(s00_axi_wvalid),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \slv_reg0[23]_i_1 
       (.I0(\slv_reg0[31]_i_2_n_0 ),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(s00_axi_wstrb[2]),
        .I4(s00_axi_wvalid),
        .O(p_1_in[23]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \slv_reg0[31]_i_1 
       (.I0(\slv_reg0[31]_i_2_n_0 ),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(s00_axi_wstrb[3]),
        .I4(s00_axi_wvalid),
        .O(p_1_in[31]));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \slv_reg0[31]_i_2 
       (.I0(\axi_awaddr_reg_n_0_[4] ),
        .I1(s00_axi_awaddr[2]),
        .I2(\axi_awaddr_reg_n_0_[3] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[1]),
        .O(\slv_reg0[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_3 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .O(\slv_reg0[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg0[31]_i_4 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[5] ),
        .O(\slv_reg0[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h01000000)) 
    \slv_reg0[7]_i_1 
       (.I0(\slv_reg0[31]_i_2_n_0 ),
        .I1(\slv_reg0[31]_i_3_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(s00_axi_wstrb[0]),
        .I4(s00_axi_wvalid),
        .O(p_1_in[7]));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    \slv_reg1[15]_i_1 
       (.I0(\slv_reg1[31]_i_2_n_0 ),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wstrb[1]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \slv_reg1[23]_i_1 
       (.I0(\slv_reg1[31]_i_2_n_0 ),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wstrb[2]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \slv_reg1[31]_i_1 
       (.I0(\slv_reg1[31]_i_2_n_0 ),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wstrb[3]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hCCAFFFAF)) 
    \slv_reg1[31]_i_2 
       (.I0(\axi_awaddr_reg_n_0_[5] ),
        .I1(s00_axi_awaddr[3]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .O(\slv_reg1[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \slv_reg1[7]_i_1 
       (.I0(\slv_reg1[31]_i_2_n_0 ),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wstrb[0]),
        .I3(\slv_reg0[31]_i_2_n_0 ),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv1[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv1[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv1[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv1[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv1[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv1[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv1[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv1[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv1[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv1[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv1[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv1[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv1[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv1[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv1[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv1[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv1[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv1[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv1[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv1[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv1[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv1[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv1[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv1[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv1[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv1[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv1[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv1[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv1[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv1[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv1[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv1[9]),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000400)) 
    \slv_reg2[15]_i_1 
       (.I0(\slv_reg0[31]_i_4_n_0 ),
        .I1(s00_axi_wstrb[1]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg2[31]_i_2_n_0 ),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000400)) 
    \slv_reg2[23]_i_1 
       (.I0(\slv_reg0[31]_i_4_n_0 ),
        .I1(s00_axi_wstrb[2]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg2[31]_i_2_n_0 ),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000400)) 
    \slv_reg2[31]_i_1 
       (.I0(\slv_reg0[31]_i_4_n_0 ),
        .I1(s00_axi_wstrb[3]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg2[31]_i_2_n_0 ),
        .O(\slv_reg2[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hCCAFFFAF)) 
    \slv_reg2[31]_i_2 
       (.I0(\axi_awaddr_reg_n_0_[4] ),
        .I1(s00_axi_awaddr[2]),
        .I2(\axi_awaddr_reg_n_0_[3] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[1]),
        .O(\slv_reg2[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000400)) 
    \slv_reg2[7]_i_1 
       (.I0(\slv_reg0[31]_i_4_n_0 ),
        .I1(s00_axi_wstrb[0]),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg2[31]_i_2_n_0 ),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv2[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[0]_i_1 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_wvalid),
        .I2(mst3[0]),
        .O(p_2_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[10]_i_1 
       (.I0(s00_axi_wdata[10]),
        .I1(s00_axi_wvalid),
        .I2(mst3[10]),
        .O(p_2_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[11]_i_1 
       (.I0(s00_axi_wdata[11]),
        .I1(s00_axi_wvalid),
        .I2(mst3[11]),
        .O(p_2_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[12]_i_1 
       (.I0(s00_axi_wdata[12]),
        .I1(s00_axi_wvalid),
        .I2(mst3[12]),
        .O(p_2_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[13]_i_1 
       (.I0(s00_axi_wdata[13]),
        .I1(s00_axi_wvalid),
        .I2(mst3[13]),
        .O(p_2_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[14]_i_1 
       (.I0(s00_axi_wdata[14]),
        .I1(s00_axi_wvalid),
        .I2(mst3[14]),
        .O(p_2_in[14]));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg3[15]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg2[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[15]_i_2 
       (.I0(s00_axi_wdata[15]),
        .I1(s00_axi_wvalid),
        .I2(mst3[15]),
        .O(p_2_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[16]_i_1 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_wvalid),
        .I2(mst3[16]),
        .O(p_2_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[17]_i_1 
       (.I0(s00_axi_wdata[17]),
        .I1(s00_axi_wvalid),
        .I2(mst3[17]),
        .O(p_2_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[18]_i_1 
       (.I0(s00_axi_wdata[18]),
        .I1(s00_axi_wvalid),
        .I2(mst3[18]),
        .O(p_2_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[19]_i_1 
       (.I0(s00_axi_wdata[19]),
        .I1(s00_axi_wvalid),
        .I2(mst3[19]),
        .O(p_2_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[1]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_wvalid),
        .I2(mst3[1]),
        .O(p_2_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[20]_i_1 
       (.I0(s00_axi_wdata[20]),
        .I1(s00_axi_wvalid),
        .I2(mst3[20]),
        .O(p_2_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[21]_i_1 
       (.I0(s00_axi_wdata[21]),
        .I1(s00_axi_wvalid),
        .I2(mst3[21]),
        .O(p_2_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[22]_i_1 
       (.I0(s00_axi_wdata[22]),
        .I1(s00_axi_wvalid),
        .I2(mst3[22]),
        .O(p_2_in[22]));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg3[23]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg2[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[23]_i_2 
       (.I0(s00_axi_wdata[23]),
        .I1(s00_axi_wvalid),
        .I2(mst3[23]),
        .O(p_2_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[24]_i_1 
       (.I0(s00_axi_wdata[24]),
        .I1(s00_axi_wvalid),
        .I2(mst3[24]),
        .O(p_2_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[25]_i_1 
       (.I0(s00_axi_wdata[25]),
        .I1(s00_axi_wvalid),
        .I2(mst3[25]),
        .O(p_2_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[26]_i_1 
       (.I0(s00_axi_wdata[26]),
        .I1(s00_axi_wvalid),
        .I2(mst3[26]),
        .O(p_2_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[27]_i_1 
       (.I0(s00_axi_wdata[27]),
        .I1(s00_axi_wvalid),
        .I2(mst3[27]),
        .O(p_2_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[28]_i_1 
       (.I0(s00_axi_wdata[28]),
        .I1(s00_axi_wvalid),
        .I2(mst3[28]),
        .O(p_2_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[29]_i_1 
       (.I0(s00_axi_wdata[29]),
        .I1(s00_axi_wvalid),
        .I2(mst3[29]),
        .O(p_2_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[2]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(s00_axi_wvalid),
        .I2(mst3[2]),
        .O(p_2_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[30]_i_1 
       (.I0(s00_axi_wdata[30]),
        .I1(s00_axi_wvalid),
        .I2(mst3[30]),
        .O(p_2_in[30]));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \slv_reg3[31]_i_1 
       (.I0(\slv_reg2[31]_i_2_n_0 ),
        .I1(s00_axi_wstrb[3]),
        .I2(\slv_reg1[31]_i_2_n_0 ),
        .I3(s00_axi_wvalid),
        .I4(mst_wren),
        .O(\slv_reg3[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[31]_i_2 
       (.I0(s00_axi_wdata[31]),
        .I1(s00_axi_wvalid),
        .I2(mst3[31]),
        .O(p_2_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[3]_i_1 
       (.I0(s00_axi_wdata[3]),
        .I1(s00_axi_wvalid),
        .I2(mst3[3]),
        .O(p_2_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[4]_i_1 
       (.I0(s00_axi_wdata[4]),
        .I1(s00_axi_wvalid),
        .I2(mst3[4]),
        .O(p_2_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[5]_i_1 
       (.I0(s00_axi_wdata[5]),
        .I1(s00_axi_wvalid),
        .I2(mst3[5]),
        .O(p_2_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[6]_i_1 
       (.I0(s00_axi_wdata[6]),
        .I1(s00_axi_wvalid),
        .I2(mst3[6]),
        .O(p_2_in[6]));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg3[7]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg2[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[7]_i_2 
       (.I0(s00_axi_wdata[7]),
        .I1(s00_axi_wvalid),
        .I2(mst3[7]),
        .O(p_2_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[8]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(s00_axi_wvalid),
        .I2(mst3[8]),
        .O(p_2_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg3[9]_i_1 
       (.I0(s00_axi_wdata[9]),
        .I1(s00_axi_wvalid),
        .I2(mst3[9]),
        .O(p_2_in[9]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(p_2_in[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(p_2_in[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(p_2_in[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(p_2_in[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[0]_i_1 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_wvalid),
        .I2(mst4[0]),
        .O(\slv_reg4[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[10]_i_1 
       (.I0(s00_axi_wdata[10]),
        .I1(s00_axi_wvalid),
        .I2(mst4[10]),
        .O(\slv_reg4[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[11]_i_1 
       (.I0(s00_axi_wdata[11]),
        .I1(s00_axi_wvalid),
        .I2(mst4[11]),
        .O(\slv_reg4[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[12]_i_1 
       (.I0(s00_axi_wdata[12]),
        .I1(s00_axi_wvalid),
        .I2(mst4[12]),
        .O(\slv_reg4[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[13]_i_1 
       (.I0(s00_axi_wdata[13]),
        .I1(s00_axi_wvalid),
        .I2(mst4[13]),
        .O(\slv_reg4[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[14]_i_1 
       (.I0(s00_axi_wdata[14]),
        .I1(s00_axi_wvalid),
        .I2(mst4[14]),
        .O(\slv_reg4[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22222222222E2222)) 
    \slv_reg4[15]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wvalid),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg4[31]_i_3_n_0 ),
        .I4(s00_axi_wstrb[1]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg4[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[15]_i_2 
       (.I0(s00_axi_wdata[15]),
        .I1(s00_axi_wvalid),
        .I2(mst4[15]),
        .O(\slv_reg4[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[16]_i_1 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_wvalid),
        .I2(mst4[16]),
        .O(\slv_reg4[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[17]_i_1 
       (.I0(s00_axi_wdata[17]),
        .I1(s00_axi_wvalid),
        .I2(mst4[17]),
        .O(\slv_reg4[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[18]_i_1 
       (.I0(s00_axi_wdata[18]),
        .I1(s00_axi_wvalid),
        .I2(mst4[18]),
        .O(\slv_reg4[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[19]_i_1 
       (.I0(s00_axi_wdata[19]),
        .I1(s00_axi_wvalid),
        .I2(mst4[19]),
        .O(\slv_reg4[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[1]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_wvalid),
        .I2(mst4[1]),
        .O(\slv_reg4[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[20]_i_1 
       (.I0(s00_axi_wdata[20]),
        .I1(s00_axi_wvalid),
        .I2(mst4[20]),
        .O(\slv_reg4[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[21]_i_1 
       (.I0(s00_axi_wdata[21]),
        .I1(s00_axi_wvalid),
        .I2(mst4[21]),
        .O(\slv_reg4[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[22]_i_1 
       (.I0(s00_axi_wdata[22]),
        .I1(s00_axi_wvalid),
        .I2(mst4[22]),
        .O(\slv_reg4[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22222222222E2222)) 
    \slv_reg4[23]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wvalid),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg4[31]_i_3_n_0 ),
        .I4(s00_axi_wstrb[2]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg4[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[23]_i_2 
       (.I0(s00_axi_wdata[23]),
        .I1(s00_axi_wvalid),
        .I2(mst4[23]),
        .O(\slv_reg4[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[24]_i_1 
       (.I0(s00_axi_wdata[24]),
        .I1(s00_axi_wvalid),
        .I2(mst4[24]),
        .O(\slv_reg4[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[25]_i_1 
       (.I0(s00_axi_wdata[25]),
        .I1(s00_axi_wvalid),
        .I2(mst4[25]),
        .O(\slv_reg4[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[26]_i_1 
       (.I0(s00_axi_wdata[26]),
        .I1(s00_axi_wvalid),
        .I2(mst4[26]),
        .O(\slv_reg4[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[27]_i_1 
       (.I0(s00_axi_wdata[27]),
        .I1(s00_axi_wvalid),
        .I2(mst4[27]),
        .O(\slv_reg4[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[28]_i_1 
       (.I0(s00_axi_wdata[28]),
        .I1(s00_axi_wvalid),
        .I2(mst4[28]),
        .O(\slv_reg4[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[29]_i_1 
       (.I0(s00_axi_wdata[29]),
        .I1(s00_axi_wvalid),
        .I2(mst4[29]),
        .O(\slv_reg4[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[2]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(s00_axi_wvalid),
        .I2(mst4[2]),
        .O(\slv_reg4[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[30]_i_1 
       (.I0(s00_axi_wdata[30]),
        .I1(s00_axi_wvalid),
        .I2(mst4[30]),
        .O(\slv_reg4[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22222222222E2222)) 
    \slv_reg4[31]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wvalid),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg4[31]_i_3_n_0 ),
        .I4(s00_axi_wstrb[3]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg4[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[31]_i_2 
       (.I0(s00_axi_wdata[31]),
        .I1(s00_axi_wvalid),
        .I2(mst4[31]),
        .O(\slv_reg4[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hCCAFFFAF)) 
    \slv_reg4[31]_i_3 
       (.I0(\axi_awaddr_reg_n_0_[3] ),
        .I1(s00_axi_awaddr[1]),
        .I2(\axi_awaddr_reg_n_0_[4] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[2]),
        .O(\slv_reg4[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[3]_i_1 
       (.I0(s00_axi_wdata[3]),
        .I1(s00_axi_wvalid),
        .I2(mst4[3]),
        .O(\slv_reg4[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[4]_i_1 
       (.I0(s00_axi_wdata[4]),
        .I1(s00_axi_wvalid),
        .I2(mst4[4]),
        .O(\slv_reg4[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[5]_i_1 
       (.I0(s00_axi_wdata[5]),
        .I1(s00_axi_wvalid),
        .I2(mst4[5]),
        .O(\slv_reg4[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[6]_i_1 
       (.I0(s00_axi_wdata[6]),
        .I1(s00_axi_wvalid),
        .I2(mst4[6]),
        .O(\slv_reg4[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22222222222E2222)) 
    \slv_reg4[7]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wvalid),
        .I2(\slv_reg0[31]_i_3_n_0 ),
        .I3(\slv_reg4[31]_i_3_n_0 ),
        .I4(s00_axi_wstrb[0]),
        .I5(\slv_reg0[31]_i_4_n_0 ),
        .O(\slv_reg4[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[7]_i_2 
       (.I0(s00_axi_wdata[7]),
        .I1(s00_axi_wvalid),
        .I2(mst4[7]),
        .O(\slv_reg4[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[8]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(s00_axi_wvalid),
        .I2(mst4[8]),
        .O(\slv_reg4[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg4[9]_i_1 
       (.I0(s00_axi_wdata[9]),
        .I1(s00_axi_wvalid),
        .I2(mst4[9]),
        .O(\slv_reg4[9]_i_1_n_0 ));
  FDRE \slv_reg4_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[0]_i_1_n_0 ),
        .Q(slv_reg4[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[10]_i_1_n_0 ),
        .Q(slv_reg4[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[11]_i_1_n_0 ),
        .Q(slv_reg4[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[12]_i_1_n_0 ),
        .Q(slv_reg4[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[13]_i_1_n_0 ),
        .Q(slv_reg4[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[14]_i_1_n_0 ),
        .Q(slv_reg4[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[15]_i_2_n_0 ),
        .Q(slv_reg4[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[16]_i_1_n_0 ),
        .Q(slv_reg4[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[17]_i_1_n_0 ),
        .Q(slv_reg4[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[18]_i_1_n_0 ),
        .Q(slv_reg4[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[19]_i_1_n_0 ),
        .Q(slv_reg4[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[1]_i_1_n_0 ),
        .Q(slv_reg4[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[20]_i_1_n_0 ),
        .Q(slv_reg4[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[21]_i_1_n_0 ),
        .Q(slv_reg4[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[22]_i_1_n_0 ),
        .Q(slv_reg4[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[23]_i_1_n_0 ),
        .D(\slv_reg4[23]_i_2_n_0 ),
        .Q(slv_reg4[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[24]_i_1_n_0 ),
        .Q(slv_reg4[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[25]_i_1_n_0 ),
        .Q(slv_reg4[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[26]_i_1_n_0 ),
        .Q(slv_reg4[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[27]_i_1_n_0 ),
        .Q(slv_reg4[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[28]_i_1_n_0 ),
        .Q(slv_reg4[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[29]_i_1_n_0 ),
        .Q(slv_reg4[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[2]_i_1_n_0 ),
        .Q(slv_reg4[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[30]_i_1_n_0 ),
        .Q(slv_reg4[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[31]_i_1_n_0 ),
        .D(\slv_reg4[31]_i_2_n_0 ),
        .Q(slv_reg4[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[3]_i_1_n_0 ),
        .Q(slv_reg4[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[4]_i_1_n_0 ),
        .Q(slv_reg4[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[5]_i_1_n_0 ),
        .Q(slv_reg4[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[6]_i_1_n_0 ),
        .Q(slv_reg4[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[7]_i_1_n_0 ),
        .D(\slv_reg4[7]_i_2_n_0 ),
        .Q(slv_reg4[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[8]_i_1_n_0 ),
        .Q(slv_reg4[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg4_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg4[15]_i_1_n_0 ),
        .D(\slv_reg4[9]_i_1_n_0 ),
        .Q(slv_reg4[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[0]_i_1 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_wvalid),
        .I2(mst5[0]),
        .O(\slv_reg5[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[10]_i_1 
       (.I0(s00_axi_wdata[10]),
        .I1(s00_axi_wvalid),
        .I2(mst5[10]),
        .O(\slv_reg5[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[11]_i_1 
       (.I0(s00_axi_wdata[11]),
        .I1(s00_axi_wvalid),
        .I2(mst5[11]),
        .O(\slv_reg5[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[12]_i_1 
       (.I0(s00_axi_wdata[12]),
        .I1(s00_axi_wvalid),
        .I2(mst5[12]),
        .O(\slv_reg5[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[13]_i_1 
       (.I0(s00_axi_wdata[13]),
        .I1(s00_axi_wvalid),
        .I2(mst5[13]),
        .O(\slv_reg5[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[14]_i_1 
       (.I0(s00_axi_wdata[14]),
        .I1(s00_axi_wvalid),
        .I2(mst5[14]),
        .O(\slv_reg5[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg5[15]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg4[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg5[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[15]_i_2 
       (.I0(s00_axi_wdata[15]),
        .I1(s00_axi_wvalid),
        .I2(mst5[15]),
        .O(\slv_reg5[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[16]_i_1 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_wvalid),
        .I2(mst5[16]),
        .O(\slv_reg5[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[17]_i_1 
       (.I0(s00_axi_wdata[17]),
        .I1(s00_axi_wvalid),
        .I2(mst5[17]),
        .O(\slv_reg5[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[18]_i_1 
       (.I0(s00_axi_wdata[18]),
        .I1(s00_axi_wvalid),
        .I2(mst5[18]),
        .O(\slv_reg5[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[19]_i_1 
       (.I0(s00_axi_wdata[19]),
        .I1(s00_axi_wvalid),
        .I2(mst5[19]),
        .O(\slv_reg5[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[1]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_wvalid),
        .I2(mst5[1]),
        .O(\slv_reg5[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[20]_i_1 
       (.I0(s00_axi_wdata[20]),
        .I1(s00_axi_wvalid),
        .I2(mst5[20]),
        .O(\slv_reg5[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[21]_i_1 
       (.I0(s00_axi_wdata[21]),
        .I1(s00_axi_wvalid),
        .I2(mst5[21]),
        .O(\slv_reg5[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[22]_i_1 
       (.I0(s00_axi_wdata[22]),
        .I1(s00_axi_wvalid),
        .I2(mst5[22]),
        .O(\slv_reg5[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg5[23]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg4[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg5[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[23]_i_2 
       (.I0(s00_axi_wdata[23]),
        .I1(s00_axi_wvalid),
        .I2(mst5[23]),
        .O(\slv_reg5[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[24]_i_1 
       (.I0(s00_axi_wdata[24]),
        .I1(s00_axi_wvalid),
        .I2(mst5[24]),
        .O(\slv_reg5[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[25]_i_1 
       (.I0(s00_axi_wdata[25]),
        .I1(s00_axi_wvalid),
        .I2(mst5[25]),
        .O(\slv_reg5[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[26]_i_1 
       (.I0(s00_axi_wdata[26]),
        .I1(s00_axi_wvalid),
        .I2(mst5[26]),
        .O(\slv_reg5[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[27]_i_1 
       (.I0(s00_axi_wdata[27]),
        .I1(s00_axi_wvalid),
        .I2(mst5[27]),
        .O(\slv_reg5[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[28]_i_1 
       (.I0(s00_axi_wdata[28]),
        .I1(s00_axi_wvalid),
        .I2(mst5[28]),
        .O(\slv_reg5[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[29]_i_1 
       (.I0(s00_axi_wdata[29]),
        .I1(s00_axi_wvalid),
        .I2(mst5[29]),
        .O(\slv_reg5[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[2]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(s00_axi_wvalid),
        .I2(mst5[2]),
        .O(\slv_reg5[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[30]_i_1 
       (.I0(s00_axi_wdata[30]),
        .I1(s00_axi_wvalid),
        .I2(mst5[30]),
        .O(\slv_reg5[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg5[31]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg4[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg5[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[31]_i_2 
       (.I0(s00_axi_wdata[31]),
        .I1(s00_axi_wvalid),
        .I2(mst5[31]),
        .O(\slv_reg5[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[3]_i_1 
       (.I0(s00_axi_wdata[3]),
        .I1(s00_axi_wvalid),
        .I2(mst5[3]),
        .O(\slv_reg5[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[4]_i_1 
       (.I0(s00_axi_wdata[4]),
        .I1(s00_axi_wvalid),
        .I2(mst5[4]),
        .O(\slv_reg5[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[5]_i_1 
       (.I0(s00_axi_wdata[5]),
        .I1(s00_axi_wvalid),
        .I2(mst5[5]),
        .O(\slv_reg5[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[6]_i_1 
       (.I0(s00_axi_wdata[6]),
        .I1(s00_axi_wvalid),
        .I2(mst5[6]),
        .O(\slv_reg5[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg5[7]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg4[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg5[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[7]_i_2 
       (.I0(s00_axi_wdata[7]),
        .I1(s00_axi_wvalid),
        .I2(mst5[7]),
        .O(\slv_reg5[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[8]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(s00_axi_wvalid),
        .I2(mst5[8]),
        .O(\slv_reg5[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg5[9]_i_1 
       (.I0(s00_axi_wdata[9]),
        .I1(s00_axi_wvalid),
        .I2(mst5[9]),
        .O(\slv_reg5[9]_i_1_n_0 ));
  FDRE \slv_reg5_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[0]_i_1_n_0 ),
        .Q(slv_reg5[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[10]_i_1_n_0 ),
        .Q(slv_reg5[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[11]_i_1_n_0 ),
        .Q(slv_reg5[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[12]_i_1_n_0 ),
        .Q(slv_reg5[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[13]_i_1_n_0 ),
        .Q(slv_reg5[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[14]_i_1_n_0 ),
        .Q(slv_reg5[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[15]_i_2_n_0 ),
        .Q(slv_reg5[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[16]_i_1_n_0 ),
        .Q(slv_reg5[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[17]_i_1_n_0 ),
        .Q(slv_reg5[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[18]_i_1_n_0 ),
        .Q(slv_reg5[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[19]_i_1_n_0 ),
        .Q(slv_reg5[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[1]_i_1_n_0 ),
        .Q(slv_reg5[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[20]_i_1_n_0 ),
        .Q(slv_reg5[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[21]_i_1_n_0 ),
        .Q(slv_reg5[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[22]_i_1_n_0 ),
        .Q(slv_reg5[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[23]_i_1_n_0 ),
        .D(\slv_reg5[23]_i_2_n_0 ),
        .Q(slv_reg5[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[24]_i_1_n_0 ),
        .Q(slv_reg5[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[25]_i_1_n_0 ),
        .Q(slv_reg5[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[26]_i_1_n_0 ),
        .Q(slv_reg5[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[27]_i_1_n_0 ),
        .Q(slv_reg5[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[28]_i_1_n_0 ),
        .Q(slv_reg5[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[29]_i_1_n_0 ),
        .Q(slv_reg5[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[2]_i_1_n_0 ),
        .Q(slv_reg5[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[30]_i_1_n_0 ),
        .Q(slv_reg5[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[31]_i_1_n_0 ),
        .D(\slv_reg5[31]_i_2_n_0 ),
        .Q(slv_reg5[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[3]_i_1_n_0 ),
        .Q(slv_reg5[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[4]_i_1_n_0 ),
        .Q(slv_reg5[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[5]_i_1_n_0 ),
        .Q(slv_reg5[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[6]_i_1_n_0 ),
        .Q(slv_reg5[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[7]_i_1_n_0 ),
        .D(\slv_reg5[7]_i_2_n_0 ),
        .Q(slv_reg5[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[8]_i_1_n_0 ),
        .Q(slv_reg5[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg5_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg5[15]_i_1_n_0 ),
        .D(\slv_reg5[9]_i_1_n_0 ),
        .Q(slv_reg5[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[0]_i_1 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_wvalid),
        .I2(mst6[0]),
        .O(\slv_reg6[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[10]_i_1 
       (.I0(s00_axi_wdata[10]),
        .I1(s00_axi_wvalid),
        .I2(mst6[10]),
        .O(\slv_reg6[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[11]_i_1 
       (.I0(s00_axi_wdata[11]),
        .I1(s00_axi_wvalid),
        .I2(mst6[11]),
        .O(\slv_reg6[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[12]_i_1 
       (.I0(s00_axi_wdata[12]),
        .I1(s00_axi_wvalid),
        .I2(mst6[12]),
        .O(\slv_reg6[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[13]_i_1 
       (.I0(s00_axi_wdata[13]),
        .I1(s00_axi_wvalid),
        .I2(mst6[13]),
        .O(\slv_reg6[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[14]_i_1 
       (.I0(s00_axi_wdata[14]),
        .I1(s00_axi_wvalid),
        .I2(mst6[14]),
        .O(\slv_reg6[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0ACA0A0A)) 
    \slv_reg6[15]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wstrb[1]),
        .I2(s00_axi_wvalid),
        .I3(\slv_reg6[31]_i_3_n_0 ),
        .I4(\slv_reg6[31]_i_4_n_0 ),
        .O(\slv_reg6[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[15]_i_2 
       (.I0(s00_axi_wdata[15]),
        .I1(s00_axi_wvalid),
        .I2(mst6[15]),
        .O(\slv_reg6[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[16]_i_1 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_wvalid),
        .I2(mst6[16]),
        .O(\slv_reg6[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[17]_i_1 
       (.I0(s00_axi_wdata[17]),
        .I1(s00_axi_wvalid),
        .I2(mst6[17]),
        .O(\slv_reg6[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[18]_i_1 
       (.I0(s00_axi_wdata[18]),
        .I1(s00_axi_wvalid),
        .I2(mst6[18]),
        .O(\slv_reg6[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[19]_i_1 
       (.I0(s00_axi_wdata[19]),
        .I1(s00_axi_wvalid),
        .I2(mst6[19]),
        .O(\slv_reg6[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[1]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_wvalid),
        .I2(mst6[1]),
        .O(\slv_reg6[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[20]_i_1 
       (.I0(s00_axi_wdata[20]),
        .I1(s00_axi_wvalid),
        .I2(mst6[20]),
        .O(\slv_reg6[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[21]_i_1 
       (.I0(s00_axi_wdata[21]),
        .I1(s00_axi_wvalid),
        .I2(mst6[21]),
        .O(\slv_reg6[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[22]_i_1 
       (.I0(s00_axi_wdata[22]),
        .I1(s00_axi_wvalid),
        .I2(mst6[22]),
        .O(\slv_reg6[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0ACA0A0A)) 
    \slv_reg6[23]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wstrb[2]),
        .I2(s00_axi_wvalid),
        .I3(\slv_reg6[31]_i_3_n_0 ),
        .I4(\slv_reg6[31]_i_4_n_0 ),
        .O(\slv_reg6[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[23]_i_2 
       (.I0(s00_axi_wdata[23]),
        .I1(s00_axi_wvalid),
        .I2(mst6[23]),
        .O(\slv_reg6[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[24]_i_1 
       (.I0(s00_axi_wdata[24]),
        .I1(s00_axi_wvalid),
        .I2(mst6[24]),
        .O(\slv_reg6[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[25]_i_1 
       (.I0(s00_axi_wdata[25]),
        .I1(s00_axi_wvalid),
        .I2(mst6[25]),
        .O(\slv_reg6[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[26]_i_1 
       (.I0(s00_axi_wdata[26]),
        .I1(s00_axi_wvalid),
        .I2(mst6[26]),
        .O(\slv_reg6[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[27]_i_1 
       (.I0(s00_axi_wdata[27]),
        .I1(s00_axi_wvalid),
        .I2(mst6[27]),
        .O(\slv_reg6[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[28]_i_1 
       (.I0(s00_axi_wdata[28]),
        .I1(s00_axi_wvalid),
        .I2(mst6[28]),
        .O(\slv_reg6[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[29]_i_1 
       (.I0(s00_axi_wdata[29]),
        .I1(s00_axi_wvalid),
        .I2(mst6[29]),
        .O(\slv_reg6[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[2]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(s00_axi_wvalid),
        .I2(mst6[2]),
        .O(\slv_reg6[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[30]_i_1 
       (.I0(s00_axi_wdata[30]),
        .I1(s00_axi_wvalid),
        .I2(mst6[30]),
        .O(\slv_reg6[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0ACA0A0A)) 
    \slv_reg6[31]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wstrb[3]),
        .I2(s00_axi_wvalid),
        .I3(\slv_reg6[31]_i_3_n_0 ),
        .I4(\slv_reg6[31]_i_4_n_0 ),
        .O(\slv_reg6[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[31]_i_2 
       (.I0(s00_axi_wdata[31]),
        .I1(s00_axi_wvalid),
        .I2(mst6[31]),
        .O(\slv_reg6[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hCCAFFFAF)) 
    \slv_reg6[31]_i_3 
       (.I0(\axi_awaddr_reg_n_0_[5] ),
        .I1(s00_axi_awaddr[3]),
        .I2(\axi_awaddr_reg_n_0_[4] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[2]),
        .O(\slv_reg6[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h000ACC0A)) 
    \slv_reg6[31]_i_4 
       (.I0(\axi_awaddr_reg_n_0_[3] ),
        .I1(s00_axi_awaddr[1]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .O(\slv_reg6[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[3]_i_1 
       (.I0(s00_axi_wdata[3]),
        .I1(s00_axi_wvalid),
        .I2(mst6[3]),
        .O(\slv_reg6[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[4]_i_1 
       (.I0(s00_axi_wdata[4]),
        .I1(s00_axi_wvalid),
        .I2(mst6[4]),
        .O(\slv_reg6[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[5]_i_1 
       (.I0(s00_axi_wdata[5]),
        .I1(s00_axi_wvalid),
        .I2(mst6[5]),
        .O(\slv_reg6[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[6]_i_1 
       (.I0(s00_axi_wdata[6]),
        .I1(s00_axi_wvalid),
        .I2(mst6[6]),
        .O(\slv_reg6[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0ACA0A0A)) 
    \slv_reg6[7]_i_1 
       (.I0(mst_wren),
        .I1(s00_axi_wstrb[0]),
        .I2(s00_axi_wvalid),
        .I3(\slv_reg6[31]_i_3_n_0 ),
        .I4(\slv_reg6[31]_i_4_n_0 ),
        .O(\slv_reg6[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[7]_i_2 
       (.I0(s00_axi_wdata[7]),
        .I1(s00_axi_wvalid),
        .I2(mst6[7]),
        .O(\slv_reg6[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[8]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(s00_axi_wvalid),
        .I2(mst6[8]),
        .O(\slv_reg6[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg6[9]_i_1 
       (.I0(s00_axi_wdata[9]),
        .I1(s00_axi_wvalid),
        .I2(mst6[9]),
        .O(\slv_reg6[9]_i_1_n_0 ));
  FDRE \slv_reg6_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[0]_i_1_n_0 ),
        .Q(slv_reg6[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[10]_i_1_n_0 ),
        .Q(slv_reg6[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[11]_i_1_n_0 ),
        .Q(slv_reg6[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[12]_i_1_n_0 ),
        .Q(slv_reg6[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[13]_i_1_n_0 ),
        .Q(slv_reg6[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[14]_i_1_n_0 ),
        .Q(slv_reg6[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[15]_i_2_n_0 ),
        .Q(slv_reg6[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[16]_i_1_n_0 ),
        .Q(slv_reg6[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[17]_i_1_n_0 ),
        .Q(slv_reg6[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[18]_i_1_n_0 ),
        .Q(slv_reg6[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[19]_i_1_n_0 ),
        .Q(slv_reg6[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[1]_i_1_n_0 ),
        .Q(slv_reg6[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[20]_i_1_n_0 ),
        .Q(slv_reg6[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[21]_i_1_n_0 ),
        .Q(slv_reg6[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[22]_i_1_n_0 ),
        .Q(slv_reg6[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[23]_i_1_n_0 ),
        .D(\slv_reg6[23]_i_2_n_0 ),
        .Q(slv_reg6[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[24]_i_1_n_0 ),
        .Q(slv_reg6[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[25]_i_1_n_0 ),
        .Q(slv_reg6[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[26]_i_1_n_0 ),
        .Q(slv_reg6[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[27]_i_1_n_0 ),
        .Q(slv_reg6[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[28]_i_1_n_0 ),
        .Q(slv_reg6[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[29]_i_1_n_0 ),
        .Q(slv_reg6[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[2]_i_1_n_0 ),
        .Q(slv_reg6[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[30]_i_1_n_0 ),
        .Q(slv_reg6[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[31]_i_1_n_0 ),
        .D(\slv_reg6[31]_i_2_n_0 ),
        .Q(slv_reg6[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[3]_i_1_n_0 ),
        .Q(slv_reg6[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[4]_i_1_n_0 ),
        .Q(slv_reg6[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[5]_i_1_n_0 ),
        .Q(slv_reg6[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[6]_i_1_n_0 ),
        .Q(slv_reg6[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[7]_i_1_n_0 ),
        .D(\slv_reg6[7]_i_2_n_0 ),
        .Q(slv_reg6[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[8]_i_1_n_0 ),
        .Q(slv_reg6[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg6_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg6[15]_i_1_n_0 ),
        .D(\slv_reg6[9]_i_1_n_0 ),
        .Q(slv_reg6[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[0]_i_1 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_wvalid),
        .I2(mst7[0]),
        .O(\slv_reg7[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[10]_i_1 
       (.I0(s00_axi_wdata[10]),
        .I1(s00_axi_wvalid),
        .I2(mst7[10]),
        .O(\slv_reg7[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[11]_i_1 
       (.I0(s00_axi_wdata[11]),
        .I1(s00_axi_wvalid),
        .I2(mst7[11]),
        .O(\slv_reg7[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[12]_i_1 
       (.I0(s00_axi_wdata[12]),
        .I1(s00_axi_wvalid),
        .I2(mst7[12]),
        .O(\slv_reg7[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[13]_i_1 
       (.I0(s00_axi_wdata[13]),
        .I1(s00_axi_wvalid),
        .I2(mst7[13]),
        .O(\slv_reg7[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[14]_i_1 
       (.I0(s00_axi_wdata[14]),
        .I1(s00_axi_wvalid),
        .I2(mst7[14]),
        .O(\slv_reg7[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg7[15]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg7[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg6[31]_i_3_n_0 ),
        .O(\slv_reg7[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[15]_i_2 
       (.I0(s00_axi_wdata[15]),
        .I1(s00_axi_wvalid),
        .I2(mst7[15]),
        .O(\slv_reg7[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[16]_i_1 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_wvalid),
        .I2(mst7[16]),
        .O(\slv_reg7[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[17]_i_1 
       (.I0(s00_axi_wdata[17]),
        .I1(s00_axi_wvalid),
        .I2(mst7[17]),
        .O(\slv_reg7[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[18]_i_1 
       (.I0(s00_axi_wdata[18]),
        .I1(s00_axi_wvalid),
        .I2(mst7[18]),
        .O(\slv_reg7[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[19]_i_1 
       (.I0(s00_axi_wdata[19]),
        .I1(s00_axi_wvalid),
        .I2(mst7[19]),
        .O(\slv_reg7[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[1]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_wvalid),
        .I2(mst7[1]),
        .O(\slv_reg7[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[20]_i_1 
       (.I0(s00_axi_wdata[20]),
        .I1(s00_axi_wvalid),
        .I2(mst7[20]),
        .O(\slv_reg7[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[21]_i_1 
       (.I0(s00_axi_wdata[21]),
        .I1(s00_axi_wvalid),
        .I2(mst7[21]),
        .O(\slv_reg7[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[22]_i_1 
       (.I0(s00_axi_wdata[22]),
        .I1(s00_axi_wvalid),
        .I2(mst7[22]),
        .O(\slv_reg7[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg7[23]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg7[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg6[31]_i_3_n_0 ),
        .O(\slv_reg7[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[23]_i_2 
       (.I0(s00_axi_wdata[23]),
        .I1(s00_axi_wvalid),
        .I2(mst7[23]),
        .O(\slv_reg7[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[24]_i_1 
       (.I0(s00_axi_wdata[24]),
        .I1(s00_axi_wvalid),
        .I2(mst7[24]),
        .O(\slv_reg7[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[25]_i_1 
       (.I0(s00_axi_wdata[25]),
        .I1(s00_axi_wvalid),
        .I2(mst7[25]),
        .O(\slv_reg7[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[26]_i_1 
       (.I0(s00_axi_wdata[26]),
        .I1(s00_axi_wvalid),
        .I2(mst7[26]),
        .O(\slv_reg7[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[27]_i_1 
       (.I0(s00_axi_wdata[27]),
        .I1(s00_axi_wvalid),
        .I2(mst7[27]),
        .O(\slv_reg7[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[28]_i_1 
       (.I0(s00_axi_wdata[28]),
        .I1(s00_axi_wvalid),
        .I2(mst7[28]),
        .O(\slv_reg7[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[29]_i_1 
       (.I0(s00_axi_wdata[29]),
        .I1(s00_axi_wvalid),
        .I2(mst7[29]),
        .O(\slv_reg7[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[2]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(s00_axi_wvalid),
        .I2(mst7[2]),
        .O(\slv_reg7[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[30]_i_1 
       (.I0(s00_axi_wdata[30]),
        .I1(s00_axi_wvalid),
        .I2(mst7[30]),
        .O(\slv_reg7[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg7[31]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg7[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg6[31]_i_3_n_0 ),
        .O(\slv_reg7[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[31]_i_2 
       (.I0(s00_axi_wdata[31]),
        .I1(s00_axi_wvalid),
        .I2(mst7[31]),
        .O(\slv_reg7[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h335FFF5F)) 
    \slv_reg7[31]_i_3 
       (.I0(\axi_awaddr_reg_n_0_[3] ),
        .I1(s00_axi_awaddr[1]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .O(\slv_reg7[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[3]_i_1 
       (.I0(s00_axi_wdata[3]),
        .I1(s00_axi_wvalid),
        .I2(mst7[3]),
        .O(\slv_reg7[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[4]_i_1 
       (.I0(s00_axi_wdata[4]),
        .I1(s00_axi_wvalid),
        .I2(mst7[4]),
        .O(\slv_reg7[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[5]_i_1 
       (.I0(s00_axi_wdata[5]),
        .I1(s00_axi_wvalid),
        .I2(mst7[5]),
        .O(\slv_reg7[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[6]_i_1 
       (.I0(s00_axi_wdata[6]),
        .I1(s00_axi_wvalid),
        .I2(mst7[6]),
        .O(\slv_reg7[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \slv_reg7[7]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg7[31]_i_3_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(\slv_reg6[31]_i_3_n_0 ),
        .O(\slv_reg7[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[7]_i_2 
       (.I0(s00_axi_wdata[7]),
        .I1(s00_axi_wvalid),
        .I2(mst7[7]),
        .O(\slv_reg7[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[8]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(s00_axi_wvalid),
        .I2(mst7[8]),
        .O(\slv_reg7[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg7[9]_i_1 
       (.I0(s00_axi_wdata[9]),
        .I1(s00_axi_wvalid),
        .I2(mst7[9]),
        .O(\slv_reg7[9]_i_1_n_0 ));
  FDRE \slv_reg7_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[0]_i_1_n_0 ),
        .Q(slv_reg7[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[10]_i_1_n_0 ),
        .Q(slv_reg7[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[11]_i_1_n_0 ),
        .Q(slv_reg7[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[12]_i_1_n_0 ),
        .Q(slv_reg7[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[13]_i_1_n_0 ),
        .Q(slv_reg7[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[14]_i_1_n_0 ),
        .Q(slv_reg7[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[15]_i_2_n_0 ),
        .Q(slv_reg7[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[16]_i_1_n_0 ),
        .Q(slv_reg7[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[17]_i_1_n_0 ),
        .Q(slv_reg7[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[18]_i_1_n_0 ),
        .Q(slv_reg7[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[19]_i_1_n_0 ),
        .Q(slv_reg7[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[1]_i_1_n_0 ),
        .Q(slv_reg7[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[20]_i_1_n_0 ),
        .Q(slv_reg7[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[21]_i_1_n_0 ),
        .Q(slv_reg7[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[22]_i_1_n_0 ),
        .Q(slv_reg7[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(\slv_reg7[23]_i_2_n_0 ),
        .Q(slv_reg7[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[24]_i_1_n_0 ),
        .Q(slv_reg7[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[25]_i_1_n_0 ),
        .Q(slv_reg7[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[26]_i_1_n_0 ),
        .Q(slv_reg7[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[27]_i_1_n_0 ),
        .Q(slv_reg7[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[28]_i_1_n_0 ),
        .Q(slv_reg7[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[29]_i_1_n_0 ),
        .Q(slv_reg7[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[2]_i_1_n_0 ),
        .Q(slv_reg7[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[30]_i_1_n_0 ),
        .Q(slv_reg7[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(\slv_reg7[31]_i_2_n_0 ),
        .Q(slv_reg7[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[3]_i_1_n_0 ),
        .Q(slv_reg7[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[4]_i_1_n_0 ),
        .Q(slv_reg7[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[5]_i_1_n_0 ),
        .Q(slv_reg7[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[6]_i_1_n_0 ),
        .Q(slv_reg7[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(\slv_reg7[7]_i_2_n_0 ),
        .Q(slv_reg7[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[8]_i_1_n_0 ),
        .Q(slv_reg7[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg7_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(\slv_reg7[9]_i_1_n_0 ),
        .Q(slv_reg7[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[0]_i_1 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_wvalid),
        .I2(mst8[0]),
        .O(\slv_reg8[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[10]_i_1 
       (.I0(s00_axi_wdata[10]),
        .I1(s00_axi_wvalid),
        .I2(mst8[10]),
        .O(\slv_reg8[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[11]_i_1 
       (.I0(s00_axi_wdata[11]),
        .I1(s00_axi_wvalid),
        .I2(mst8[11]),
        .O(\slv_reg8[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[12]_i_1 
       (.I0(s00_axi_wdata[12]),
        .I1(s00_axi_wvalid),
        .I2(mst8[12]),
        .O(\slv_reg8[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[13]_i_1 
       (.I0(s00_axi_wdata[13]),
        .I1(s00_axi_wvalid),
        .I2(mst8[13]),
        .O(\slv_reg8[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[14]_i_1 
       (.I0(s00_axi_wdata[14]),
        .I1(s00_axi_wvalid),
        .I2(mst8[14]),
        .O(\slv_reg8[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0030AAAA0000AAAA)) 
    \slv_reg8[15]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_3_n_0 ),
        .I4(s00_axi_wvalid),
        .I5(s00_axi_wstrb[1]),
        .O(\slv_reg8[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[15]_i_2 
       (.I0(s00_axi_wdata[15]),
        .I1(s00_axi_wvalid),
        .I2(mst8[15]),
        .O(\slv_reg8[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[16]_i_1 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_wvalid),
        .I2(mst8[16]),
        .O(\slv_reg8[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[17]_i_1 
       (.I0(s00_axi_wdata[17]),
        .I1(s00_axi_wvalid),
        .I2(mst8[17]),
        .O(\slv_reg8[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[18]_i_1 
       (.I0(s00_axi_wdata[18]),
        .I1(s00_axi_wvalid),
        .I2(mst8[18]),
        .O(\slv_reg8[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[19]_i_1 
       (.I0(s00_axi_wdata[19]),
        .I1(s00_axi_wvalid),
        .I2(mst8[19]),
        .O(\slv_reg8[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[1]_i_1 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_wvalid),
        .I2(mst8[1]),
        .O(\slv_reg8[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[20]_i_1 
       (.I0(s00_axi_wdata[20]),
        .I1(s00_axi_wvalid),
        .I2(mst8[20]),
        .O(\slv_reg8[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[21]_i_1 
       (.I0(s00_axi_wdata[21]),
        .I1(s00_axi_wvalid),
        .I2(mst8[21]),
        .O(\slv_reg8[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[22]_i_1 
       (.I0(s00_axi_wdata[22]),
        .I1(s00_axi_wvalid),
        .I2(mst8[22]),
        .O(\slv_reg8[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0030AAAA0000AAAA)) 
    \slv_reg8[23]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_3_n_0 ),
        .I4(s00_axi_wvalid),
        .I5(s00_axi_wstrb[2]),
        .O(\slv_reg8[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[23]_i_2 
       (.I0(s00_axi_wdata[23]),
        .I1(s00_axi_wvalid),
        .I2(mst8[23]),
        .O(\slv_reg8[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[24]_i_1 
       (.I0(s00_axi_wdata[24]),
        .I1(s00_axi_wvalid),
        .I2(mst8[24]),
        .O(\slv_reg8[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[25]_i_1 
       (.I0(s00_axi_wdata[25]),
        .I1(s00_axi_wvalid),
        .I2(mst8[25]),
        .O(\slv_reg8[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[26]_i_1 
       (.I0(s00_axi_wdata[26]),
        .I1(s00_axi_wvalid),
        .I2(mst8[26]),
        .O(\slv_reg8[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[27]_i_1 
       (.I0(s00_axi_wdata[27]),
        .I1(s00_axi_wvalid),
        .I2(mst8[27]),
        .O(\slv_reg8[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[28]_i_1 
       (.I0(s00_axi_wdata[28]),
        .I1(s00_axi_wvalid),
        .I2(mst8[28]),
        .O(\slv_reg8[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[29]_i_1 
       (.I0(s00_axi_wdata[29]),
        .I1(s00_axi_wvalid),
        .I2(mst8[29]),
        .O(\slv_reg8[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[2]_i_1 
       (.I0(s00_axi_wdata[2]),
        .I1(s00_axi_wvalid),
        .I2(mst8[2]),
        .O(\slv_reg8[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[30]_i_1 
       (.I0(s00_axi_wdata[30]),
        .I1(s00_axi_wvalid),
        .I2(mst8[30]),
        .O(\slv_reg8[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0030AAAA0000AAAA)) 
    \slv_reg8[31]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_3_n_0 ),
        .I4(s00_axi_wvalid),
        .I5(s00_axi_wstrb[3]),
        .O(\slv_reg8[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[31]_i_2 
       (.I0(s00_axi_wdata[31]),
        .I1(s00_axi_wvalid),
        .I2(mst8[31]),
        .O(\slv_reg8[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[3]_i_1 
       (.I0(s00_axi_wdata[3]),
        .I1(s00_axi_wvalid),
        .I2(mst8[3]),
        .O(\slv_reg8[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[4]_i_1 
       (.I0(s00_axi_wdata[4]),
        .I1(s00_axi_wvalid),
        .I2(mst8[4]),
        .O(\slv_reg8[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[5]_i_1 
       (.I0(s00_axi_wdata[5]),
        .I1(s00_axi_wvalid),
        .I2(mst8[5]),
        .O(\slv_reg8[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[6]_i_1 
       (.I0(s00_axi_wdata[6]),
        .I1(s00_axi_wvalid),
        .I2(mst8[6]),
        .O(\slv_reg8[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0030AAAA0000AAAA)) 
    \slv_reg8[7]_i_1 
       (.I0(mst_wren),
        .I1(\slv_reg0[31]_i_2_n_0 ),
        .I2(\slv_reg0[31]_i_4_n_0 ),
        .I3(\slv_reg0[31]_i_3_n_0 ),
        .I4(s00_axi_wvalid),
        .I5(s00_axi_wstrb[0]),
        .O(\slv_reg8[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[7]_i_2 
       (.I0(s00_axi_wdata[7]),
        .I1(s00_axi_wvalid),
        .I2(mst8[7]),
        .O(\slv_reg8[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[8]_i_1 
       (.I0(s00_axi_wdata[8]),
        .I1(s00_axi_wvalid),
        .I2(mst8[8]),
        .O(\slv_reg8[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg8[9]_i_1 
       (.I0(s00_axi_wdata[9]),
        .I1(s00_axi_wvalid),
        .I2(mst8[9]),
        .O(\slv_reg8[9]_i_1_n_0 ));
  FDRE \slv_reg8_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[0]_i_1_n_0 ),
        .Q(slv_reg8[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[10]_i_1_n_0 ),
        .Q(slv_reg8[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[11]_i_1_n_0 ),
        .Q(slv_reg8[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[12]_i_1_n_0 ),
        .Q(slv_reg8[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[13]_i_1_n_0 ),
        .Q(slv_reg8[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[14]_i_1_n_0 ),
        .Q(slv_reg8[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[15]_i_2_n_0 ),
        .Q(slv_reg8[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[16]_i_1_n_0 ),
        .Q(slv_reg8[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[17]_i_1_n_0 ),
        .Q(slv_reg8[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[18]_i_1_n_0 ),
        .Q(slv_reg8[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[19]_i_1_n_0 ),
        .Q(slv_reg8[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[1]_i_1_n_0 ),
        .Q(slv_reg8[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[20]_i_1_n_0 ),
        .Q(slv_reg8[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[21]_i_1_n_0 ),
        .Q(slv_reg8[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[22]_i_1_n_0 ),
        .Q(slv_reg8[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[23]_i_1_n_0 ),
        .D(\slv_reg8[23]_i_2_n_0 ),
        .Q(slv_reg8[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[24]_i_1_n_0 ),
        .Q(slv_reg8[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[25]_i_1_n_0 ),
        .Q(slv_reg8[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[26]_i_1_n_0 ),
        .Q(slv_reg8[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[27]_i_1_n_0 ),
        .Q(slv_reg8[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[28]_i_1_n_0 ),
        .Q(slv_reg8[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[29]_i_1_n_0 ),
        .Q(slv_reg8[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[2]_i_1_n_0 ),
        .Q(slv_reg8[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[30]_i_1_n_0 ),
        .Q(slv_reg8[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[31]_i_1_n_0 ),
        .D(\slv_reg8[31]_i_2_n_0 ),
        .Q(slv_reg8[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[3]_i_1_n_0 ),
        .Q(slv_reg8[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[4]_i_1_n_0 ),
        .Q(slv_reg8[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[5]_i_1_n_0 ),
        .Q(slv_reg8[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[6]_i_1_n_0 ),
        .Q(slv_reg8[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7]_i_1_n_0 ),
        .D(\slv_reg8[7]_i_2_n_0 ),
        .Q(slv_reg8[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[8]_i_1_n_0 ),
        .Q(slv_reg8[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg8_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[15]_i_1_n_0 ),
        .D(\slv_reg8[9]_i_1_n_0 ),
        .Q(slv_reg8[9]),
        .R(axi_awready_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
