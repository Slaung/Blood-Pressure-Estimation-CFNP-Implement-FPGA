`timescale 1ns / 1ps

module df_processing_element(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire signed [15:0] x,
    input  wire signed [15:0] w,
    output reg  signed [15:0] odata,
    output reg                done
);
    /*** variable ***/
    reg adder_start, out_start;

    reg signed [15:0] quantify;
    reg signed [15:0] adder;
    
    /*** DSP block ***/
    wire signed [31:0] mult;

    df_dsp df_dsp_0(.A(x), .B(w), .P(mult));

    /*** quantify ***/
    always @(posedge clk) begin
        if(rst) begin
            adder_start <= 0;
            quantify    <= 0;
        end else if(start) begin
            adder_start <= 1;
            quantify    <= mult / 1000;
        end
    end

    /*** adder ***/
    always @(posedge clk) begin
        if(rst) begin
            out_start <= 0;
            adder     <= 0;
        end else if(adder_start) begin
            out_start <= 1;
            adder     <= adder + quantify;
        end
    end

    /*** output ***/
    always @(posedge clk) begin
        if(rst) begin
            done  <= 0;
            odata <= 0;
        end else if(out_start) begin
            done  <= 1;
            odata <= adder;
        end
    end

endmodule
