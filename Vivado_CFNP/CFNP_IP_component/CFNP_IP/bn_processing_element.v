`timescale 1ns / 1ps

/*
    batch normalization
    m-> mean;
    v-> variance;
    r-> gamma;
    b-> beta
    e-> 0.001
    y=g*(x-m)/((v+e)^0.5)+b
*/

module bn_processing_element(
    input  wire                clk,
    input  wire                rst,
    input  wire                start,
    input  wire signed [15: 0] x,
    input  wire signed [15: 0] p, // p=r/((v+e)^0.5)
    input  wire signed [31: 0] q, // q=b-r*m/((v+e)^0.5)
    output reg  signed [15: 0] odata,
    output reg                 done
);
    /*** DSP block ***/
    wire signed [32: 0] z;

    bn_dsp bn_dsp_0(.A(x), .B(p), .C(q), .P(z));

    always@(posedge clk) begin
        if(rst) begin
            odata <= 0;
            done  <= 0;
        end else if(start) begin
            odata <= z / 1000;
            done  <= 1;
        end
    end
endmodule