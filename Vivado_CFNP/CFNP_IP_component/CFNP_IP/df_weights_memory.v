`timescale 1ns / 1ps

module df_weights_memory(
    input  wire                clk,
    input  wire                rst,
    input  wire                start,
    input  wire        [ 2: 0] input_filter,
    output wire signed [15: 0] w,
    output wire                done
);
    reg signed [15:0] weights [0:4];

    initial begin
        weights[0] <=  1941; weights[1] <=  1945; weights[2] <=  1940; weights[3] <=  1945; weights[4] <=  1942;
    end

    assign w    = (start == 1)? weights[input_filter] : 0;
    assign done = (start == 1)? 1 : 0;
endmodule