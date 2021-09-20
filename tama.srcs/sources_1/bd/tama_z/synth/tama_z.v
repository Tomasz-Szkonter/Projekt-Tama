//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jun 23 04:26:23 2020
//Host        : Maro running 64-bit major release  (build 9200)
//Command     : generate_target tama_z.bd
//Design      : tama_z
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "tama_z,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tama_z,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "tama_z.hwdef" *) 
module tama_z
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

  wire Net;
  wire Net1;
  wire [9:0]PBlazeZH_0_ADDRESS;
  wire [7:0]PBlazeZH_0_OUT_PORT;
  wire [7:0]PBlazeZH_0_PORT_ID;
  wire PBlazeZH_0_WRITE_STROBE;
  wire [1:0]czujniki_0_czujniki;
  wire dekoder_0_doplyw;
  wire [1:0]dekoder_0_ilosc_otworow;
  wire [2:0]dekoder_0_kontrolka;
  wire dekoder_0_wlacznik_otworow;
  wire [1:0]ilosc_otworow_0_1;
  wire [7:0]multiplexer_0_dane;
  wire otwory_0_otwor1;
  wire otwory_0_otwor2;
  wire otwory_0_otwor3;
  wire [17:0]pamiec_pro_0_instruction;
  wire pelny_0_1;
  wire polowa_0_1;
  wire stan_krytyczny_0_1;
  wire [1:0]tryby_0_1;

  assign Net = clk;
  assign Net1 = reset;
  assign doplyw_0 = dekoder_0_doplyw;
  assign ilosc_otworow_0_1 = ilosc_otworow_0[1:0];
  assign kontrolka_0[2:0] = dekoder_0_kontrolka;
  assign otwor1_0 = otwory_0_otwor1;
  assign otwor2_0 = otwory_0_otwor2;
  assign otwor3_0 = otwory_0_otwor3;
  assign pelny_0_1 = pelny_0;
  assign polowa_0_1 = polowa_0;
  assign stan_krytyczny_0_1 = stan_krytyczny_0;
  assign tryby_0_1 = tryby_0[1:0];
  tama_z_PBlazeZH_0_0 PBlazeZH_0
       (.ADDRESS(PBlazeZH_0_ADDRESS),
        .CLK(Net),
        .INSTRUCTION(pamiec_pro_0_instruction),
        .INTERRUPT(1'b0),
        .IN_PORT(multiplexer_0_dane),
        .OUT_PORT(PBlazeZH_0_OUT_PORT),
        .PORT_ID(PBlazeZH_0_PORT_ID),
        .RESET(Net1),
        .WRITE_STROBE(PBlazeZH_0_WRITE_STROBE));
  tama_z_czujniki_0_0 czujniki_0
       (.czujniki(czujniki_0_czujniki),
        .pelny(pelny_0_1),
        .polowa(polowa_0_1),
        .reset(Net1),
        .stan_krytyczny(stan_krytyczny_0_1));
  tama_z_dekoder_0_0 dekoder_0
       (.clk(Net),
        .dane(PBlazeZH_0_OUT_PORT),
        .doplyw(dekoder_0_doplyw),
        .ilosc_otworow(dekoder_0_ilosc_otworow),
        .kontrolka(dekoder_0_kontrolka),
        .porty(PBlazeZH_0_PORT_ID),
        .reset(Net1),
        .wlacznik_otworow(dekoder_0_wlacznik_otworow),
        .write_strobe(PBlazeZH_0_WRITE_STROBE));
  tama_z_multiplexer_0_0 multiplexer_0
       (.clk(Net),
        .czujnik(czujniki_0_czujniki),
        .dane(multiplexer_0_dane),
        .ilosc_otworow(ilosc_otworow_0_1),
        .porty(PBlazeZH_0_PORT_ID),
        .reset(Net1),
        .tryby(tryby_0_1));
  tama_z_otwory_0_0 otwory_0
       (.ilosc(dekoder_0_ilosc_otworow),
        .otwor1(otwory_0_otwor1),
        .otwor2(otwory_0_otwor2),
        .otwor3(otwory_0_otwor3),
        .reset(Net1),
        .wlacznik(dekoder_0_wlacznik_otworow));
  tama_z_pamiec_pro_0_0 pamiec_pro_0
       (.address(PBlazeZH_0_ADDRESS),
        .clk(Net),
        .instruction(pamiec_pro_0_instruction));
endmodule
