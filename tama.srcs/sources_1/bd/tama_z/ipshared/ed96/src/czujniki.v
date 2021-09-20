`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2020 02:29:43
// Design Name: 
// Module Name: czujniki
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


module czujniki(
    input pelny,
    input polowa,
    input stan_krytyczny,
    input reset,
    output reg [1:0] czujniki
    );
    always @(*)begin
    if(reset) czujniki<=2'b00;
    else if(stan_krytyczny) czujniki<=2'b11;
    else if(polowa) czujniki<=2'b01;
    else if(pelny) czujniki<=2'b10;
    else czujniki<=2'b00;
    end
endmodule
