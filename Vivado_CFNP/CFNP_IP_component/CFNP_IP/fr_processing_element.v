`timescale 1ns / 1ps

/*** 
    v <= (1/((sd*2)**2))
***/

module fr_processing_element(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire signed [15:0] x,
    input  wire signed [15:0] m,
    input  wire signed [15:0] v,
    output wire               mult0_done,
    output wire               mult1_done,
    output reg  signed [15:0] odata,
    output reg                done
);
    /*** variable ***/
    reg  signed [15:0] subtractor;

    /*** DSP block ***/
    wire signed [31:0] mult0, mult1;
    reg  signed [15:0] q_mult0, q_mult1;

    fr_mult0_dsp fr_mult0_dsp_0(.A(subtractor), .B(subtractor), .P(mult0));
    fr_mult1_dsp fr_mult1_dsp_0(.A(q_mult0),    .B(v),          .P(mult1));

    reg mult0_start, mult1_start, out_start;

    /*** subtractor ***/
    always @(posedge clk) begin
        if(rst) begin
            subtractor  <= 0;
            mult0_start <= 0;
        end else if(start) begin 
            subtractor  <= x - m;
            mult0_start <= 1;
        end
    end
    
    assign mult0_done = (start == 1)? 1 : 0;

    /*** mult0 quantify ***/
    always @(posedge clk) begin
        if(rst) begin
            mult1_start <= 0;
            q_mult0     <= 0;
        end else if(mult0_start) begin
            mult1_start <= 1;
            q_mult0     <= mult0 / 1000;
        end
    end

    assign mult1_done = (mult1_start == 1)? 1 : 0;

    /*** mult1 quantify ***/
    always @(posedge clk) begin
        if(rst) begin
            out_start <= 0;
            q_mult1   <= 0;
        end else if(mult1_start) begin
            out_start <= 1;
            q_mult1   <= mult1 / 100;
        end
    end

    /*** output ***/
    always @(posedge clk) begin
        if(rst) begin
            done  <= 0;
            odata <= 0;
        end else if(out_start) begin
            done  <= 1;
            odata <= q_mult1;
        end
    end

endmodule
