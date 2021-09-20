`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 00:38:45
// Design Name: 
// Module Name: otwory
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


module otwory(
input reset, wlacznik,
input [1:0] ilosc,
output reg otwor1, otwor2, otwor3
    );
    always @(*)begin
    if(reset)begin
    otwor1<=1'b0;
    otwor2<=1'b0;
    otwor3<=1'b0;
    end else if(wlacznik)begin
    if(ilosc==3) begin
    otwor1<=1'b1;
    otwor2<=1'b1;
    otwor3<=1'b1;
    end else if(ilosc==2) begin
    otwor1<=1'b1;
    otwor2<=1'b1;
    otwor3<=1'b0;
    end else begin
    otwor1<=1'b1;
    otwor2<=1'b0;
    otwor3<=1'b0;
    end
    end else begin
    otwor1<=1'b0;
    otwor2<=1'b0;
    otwor3<=1'b0;
    end
    end
endmodule
