`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/08 16:41:18
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(product, multiplicand, multiplier);
    parameter Size = 8;
    parameter longSize = Size*2;
    parameter const = 9'b100011011;
    output reg [Size-1:0] product;
    reg [longSize-1:0]long_product;
    input [Size-1:0] multiplicand, multiplier;
//    reg [Size-1:0] cand, lier;
    integer i = 0;
    

    
    always @ (multiplicand, multiplier) begin
    long_product = 0;
        for(i=0; i<Size; i=i+1) begin
            if(multiplier[i]) begin
                long_product = (long_product ^ (multiplicand<<i));
            end
        end
        for(i=longSize-1; i>=Size; i = i-1) begin
            if(long_product[i]) begin
                long_product = (long_product) ^((const)<<(i-Size));
            end
        end
        product = long_product[Size-1:0];
    end
        
        
endmodule
