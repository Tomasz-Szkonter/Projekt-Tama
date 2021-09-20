//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jun 23 04:26:24 2020
//Host        : Maro running 64-bit major release  (build 9200)
//Command     : generate_target tama_z_wrapper.bd
//Design      : tama_z_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module tama_z_wrapper
   (clk,
    doplyw_0,
    ilosc_otworow_0,
    kontrolka_0,
    otwor1_0,
    otwor2_0,
    otwor3_0,
    pelny_0,
    polowa_0,
    reset,
    stan_krytyczny_0,
    tryby_0);
  input clk;
  output doplyw_0;
  input [1:0]ilosc_otworow_0;
  output [2:0]kontrolka_0;
  output otwor1_0;
  output otwor2_0;
  output otwor3_0;
  input pelny_0;
  input polowa_0;
  input reset;
  input stan_krytyczny_0;
  input [1:0]tryby_0;

  wire clk;
  wire doplyw_0;
  wire [1:0]ilosc_otworow_0;
  wire [2:0]kontrolka_0;
  wire otwor1_0;
  wire otwor2_0;
  wire otwor3_0;
  wire pelny_0;
  wire polowa_0;
  wire reset;
  wire stan_krytyczny_0;
  wire [1:0]tryby_0;

  tama_z tama_z_i
       (.clk(clk),
        .doplyw_0(doplyw_0),
        .ilosc_otworow_0(ilosc_otworow_0),
        .kontrolka_0(kontrolka_0),
        .otwor1_0(otwor1_0),
        .otwor2_0(otwor2_0),
        .otwor3_0(otwor3_0),
        .pelny_0(pelny_0),
        .polowa_0(polowa_0),
        .reset(reset),
        .stan_krytyczny_0(stan_krytyczny_0),
        .tryby_0(tryby_0));
endmodule
