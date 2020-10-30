`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 16:44:31
// Design Name: 
// Module Name: division
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


module Division_9bit(quotient, remainder, dividend, divisor);
    parameter Size = 9;
    output reg [Size-1:0] quotient;
    output reg [Size-1:0] remainder;
    input [Size-1:0] dividend, divisor;
  //  reg [Size-1:0] a,b;
    integer a_digit, b_digit;
    integer i;
    
    always @ (dividend, divisor) begin
        if(divisor == 1) begin
            quotient = dividend;
            remainder = 0;
        end
            else begin
      //  a=dividend; b=divisor;
            remainder = dividend;
            quotient = 0;
        
            for(i=0;i<Size;i=i+1)begin
                if(remainder[i]) begin
                    a_digit=i+1;
                end
            end
            for(i=0;i<Size;i=i+1)begin
                if(divisor[i]) begin
                    b_digit = i+1;
                end
            end
            while(a_digit >= b_digit) begin
                quotient = quotient + (1<<(a_digit - b_digit));
                remainder = remainder ^ (divisor<<(a_digit - b_digit));
            
                for( i = 0; i < Size; i = i+1) begin
                    if(remainder[i]) begin
                        a_digit=i+1;        
                    end
                end
            
            end
       // quotient = quotient >> 1;
        end
    end
    
endmodule
