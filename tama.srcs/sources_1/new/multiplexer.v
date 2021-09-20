`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 00:36:09
// Design Name: 
// Module Name: multiplexer
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


module multiplexer(
input [1:0] czujnik, 
input reset, clk,
input [1:0] tryby,
input [1:0] ilosc_otworow,
input [7:0] porty,
output reg [7:0] dane
    );
    always @(posedge clk)begin
    if (reset) dane<=8'b00000000;
    else if(porty==1) dane<=czujnik;
    else if(porty==2) dane<=tryby;
    else if(porty==3) dane<=ilosc_otworow;
    end
    
endmodule
