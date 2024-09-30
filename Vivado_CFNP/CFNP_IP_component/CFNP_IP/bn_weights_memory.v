`timescale 1ns / 1ps

module bn_weights_memory(
    input  wire                clk,
    input  wire                rst,
    input  wire                start,
    input  wire        [3: 0]  input_filter,
    output wire signed [15: 0] p,
    output wire signed [31: 0] q,
    output wire                done
);
    reg signed [15: 0] ps [0: 9];
    reg signed [31: 0] qs [0: 9];

    initial begin
        ps[0] <=      107; ps[1] <=    10712; ps[2] <=     -190; ps[3] <=    28571; ps[4] <=     1383; ps[5] <=     3836; ps[6] <=    14619; ps[7] <=      345; ps[8] <=      850; ps[9] <=      781; 
        qs[0] <=  -649363; qs[1] <=   -28612; qs[2] <=   721518; qs[3] <=   -28612; qs[4] <= -1317672; qs[5] <= -1687291; qs[6] <=   -28612; qs[7] <=  -340603; qs[8] <=  -969524; qs[9] <= -1931286;
    end
    
    assign p    = ps[input_filter];
    assign q    = qs[input_filter];
    assign done = (start == 1) ? 1 : 0;

endmodule