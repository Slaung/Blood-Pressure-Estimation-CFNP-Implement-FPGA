`timescale 1ns / 1ps

module conv2_processing_element(
    input wire clk,
    input wire rst,
    input wire start,
    input wire signed [15:0] x0, x1,
    input wire signed [15:0] w0, w1,
    output reg signed [31:0] odata, 
    output reg done
);
    /*** DSP block ***/
    wire signed [31:0] mult0, mult1;
    
    conv2_dsp conv2_dsp_0(.A(x0), .B(w0), .P(mult0));
    conv2_dsp conv2_dsp_1(.A(x1), .B(w1), .P(mult1));
    
    /*** adder ***/
    always @(posedge clk) begin
        if(rst) begin
            odata <= 0;
            done  <= 0;
        end else if(start) begin
            odata <= mult0 + mult1;
            done  <= 1;
        end
    end
endmodule
