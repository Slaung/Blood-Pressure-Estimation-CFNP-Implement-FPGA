`timescale  1ns / 1ps

module conv1_processing_element(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire signed [15:0] x0, x1,
    input  wire signed [15:0] w0, w1,
    input  wire signed [31:0] b,
    output reg  signed [15:0] odata, 
    output reg                done
);
    /*** variable ***/
    reg adder_1_start;
    reg relu_start;
    reg quantify_start;
    
    wire signed [31:0] mult0, mult1;
    reg  signed [31:0] adder_0 [0:1];
    reg  signed [31:0] adder_1;
    reg  signed [31:0] relu;

    /*** DSP block ***/
    conv1_dsp conv1_dsp_0(.A(x0), .B(w0), .P(mult0));
    conv1_dsp conv1_dsp_1(.A(x1), .B(w1), .P(mult1));
    
    /*** adder 1 ***/
    always @(posedge clk) begin
        if(rst) begin
            adder_0[0] <= 0;
            adder_0[1] <= 0;
            adder_1_start <= 0;
        end else if(start) begin
            adder_0[0] <= mult0 + mult1;
            adder_0[1] <= b;
            adder_1_start <= 1;
        end
    end
    
    /*** adder 2 ***/
    always @(posedge clk) begin
        if(rst) begin
            adder_1 <= 0;
            relu_start <= 0;
        end else if(adder_1_start) begin
            adder_1 <= adder_0[0] + adder_0[1];
            relu_start <= 1;
        end
    end
    
    /*** relu ***/
    always @(posedge clk) begin
        if(rst) begin
            relu <= 0;
            quantify_start <= 0;
        end else if(relu_start) begin
            if(adder_1 > 0) begin
                relu <= adder_1;
            end else begin
                relu <= 0;
            end
            quantify_start <= 1;
        end
    end
    
    /*** quantify ***/
    always @(posedge clk) begin
        if(rst) begin
            odata <= 0;
            done <= 0;
        end else if(quantify_start) begin
            odata <= relu / 1000;
            done <= 1;
        end
    end 
endmodule