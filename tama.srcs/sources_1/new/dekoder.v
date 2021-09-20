`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 00:37:01
// Design Name: 
// Module Name: dekoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dekoder(
input reset, clk, write_strobe,
input [7:0] porty,
input [7:0] dane,
output reg wlacznik_otworow, doplyw,
output reg [2:0] kontrolka,
output reg [1:0] ilosc_otworow
    );
    always @(posedge clk)begin
    if(reset) begin
    wlacznik_otworow<=1'b0;
    doplyw<=1'b0;
    kontrolka<=3'b000;
    ilosc_otworow<=2'b0;
    end else if(write_strobe && porty==1) wlacznik_otworow<=dane;
    else if(write_strobe && porty==2) doplyw<=dane;
    else if(write_strobe && porty==3) ilosc_otworow<=dane;
    else if(write_strobe && porty==4) kontrolka<=dane;
    end
endmodule
