-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue Sep 23 02:16:00 2025
-- Host        : maestro running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/mihir/iith/sem5/carch/lab3/submission/viv/fpu.gen/sources_1/bd/design_1/ip/design_1_fputop_0_0/design_1_fputop_0_0_stub.vhdl
-- Design      : design_1_fputop_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_fputop_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    ins : in STD_LOGIC_VECTOR ( 23 downto 0 );
    dbus_low : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dbus_high : in STD_LOGIC_VECTOR ( 31 downto 0 );
    result_low : out STD_LOGIC_VECTOR ( 31 downto 0 );
    result_high : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bus1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wrdata_low : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wrdata_high : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_fputop_0_0 : entity is "design_1_fputop_0_0,fputop,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_fputop_0_0 : entity is "design_1_fputop_0_0,fputop,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fputop,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_fputop_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_fputop_0_0 : entity is "module_ref";
end design_1_fputop_0_0;

architecture stub of design_1_fputop_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,rst,ins[23:0],dbus_low[31:0],dbus_high[31:0],result_low[31:0],result_high[31:0],bus1[31:0],wrdata_low[31:0],wrdata_high[31:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_MODE of rst : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fputop,Vivado 2025.1";
begin
end;
