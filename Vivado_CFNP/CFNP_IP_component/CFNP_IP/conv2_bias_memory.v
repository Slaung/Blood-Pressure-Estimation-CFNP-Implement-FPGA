`timescale 1ns / 1ps

module conv2_bias_memory(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire        [3:0]  output_filter,
    output wire signed [31:0] b,
    output wire               done
);
    reg signed [31:0] biases [0:10];
    
    initial begin
        biases[0] <=  921971; biases[1] <=  -29852; biases[2] <= 3035855; biases[3] <= -127806; biases[4] <= 1827791; biases[5] <= 1395976; biases[6] <= -246214; biases[7] <= 1064845; biases[8] <= 1751918; biases[9] <= 1825902;
    end
    
    assign b    = biases[output_filter];
    assign done = (start == 1) ? 1 : 0;
endmodule
