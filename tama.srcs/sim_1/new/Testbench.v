`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 04:11:51
// Design Name: 
// Module Name: Testbench
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


module Testbench;
reg clk, pelny, polowa, stan_krytyczny, reset;
reg [1:0]tryby;
reg [1:0]ilosc_otworow;
wire doplyw, otwor1, otwor2, otwor3;
wire [2:0]kontrolka;

tama_z_wrapper t1(clk, doplyw, ilosc_otworow, kontrolka, otwor1, otwor2, otwor3, pelny, polowa, reset, stan_krytyczny, tryby);

initial begin
clk<=1'b0;
reset<=1'b1;
pelny<=1'b0;
polowa<=1'b0;
stan_krytyczny<=1'b0;
tryby<=2'b00;
ilosc_otworow<=2'b01;
end

always
#5 clk=~clk;
initial
begin
#100 reset<=1'b0;
#3000 ilosc_otworow<=2'b10;
#1000 ilosc_otworow<=2'b11;
#1000 ilosc_otworow<=2'b01;
#500 polowa<=1'b1;
#500 polowa<=1'b0;
#500 pelny<=1'b1;
#500 pelny<=1'b0;
#1000 stan_krytyczny<=1'b1;
#1000 stan_krytyczny<=1'b0;
#1000 tryby<=2'b01;
#1000 ilosc_otworow<=2'b10;
#1000 ilosc_otworow<=2'b11;
#1000 ilosc_otworow<=2'b01;
#1000 polowa<=1'b1;
#1000 polowa<=1'b0;
#1000 pelny<=1'b1;
#1000 pelny<=1'b0;
#1000 stan_krytyczny<=1'b1;
#1000 stan_krytyczny<=1'b0;
#1000 tryby<=2'b10;
#500 ilosc_otworow<=2'b10;
#500 ilosc_otworow<=2'b11;
#500 ilosc_otworow<=2'b01;
#500 pelny<=1'b1;
#500 pelny<=1'b0;
#500 polowa<=1'b1;
#500 polowa<=1'b0;
#500 stan_krytyczny<=1'b1;
#500 stan_krytyczny<=1'b0;
#500 tryby<=2'b01;

end
endmodule
