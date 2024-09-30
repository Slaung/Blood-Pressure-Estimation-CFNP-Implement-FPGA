`timescale 1ns / 1ps

module fusionCAP_processing_element(
    input  wire clk,
    input  wire rst,
    input  wire start,
    input  wire signed [15:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9,
    output reg  signed [15:0] odata, 
    output reg  done
);
    /*** variable ***/
    reg adder_1_start, adder_2_start, adder_3_start;
    reg avg_start;
    
    reg signed [16:0] adder_0 [0:4];
    reg signed [17:0] adder_1 [0:2];
    reg signed [18:0] adder_2 [0:1];
    reg signed [19:0] adder_3;
    
    integer i;
    
    /*** adder_0 ***/
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<5; i=i+1) begin
                adder_0[i] <= 0; 
            end
            adder_1_start <= 0;
        end else if(start) begin
            adder_0[0] <= x0 + x1;
            adder_0[1] <= x2 + x3;
            adder_0[2] <= x4 + x5;
            adder_0[3] <= x6 + x7;
            adder_0[4] <= x8 + x9;
            adder_1_start <= 1;
        end
    end
    
    /*** adder_1 ***/
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<3; i=i+1) begin
                adder_1[i] <= 0; 
            end
            adder_2_start <= 0;
        end else if(adder_1_start) begin
            adder_1[0] <= adder_0[0] + adder_0[1];
            adder_1[1] <= adder_0[2] + adder_0[3];
            adder_1[2] <= adder_0[4];
            adder_2_start <= 1;
        end
    end
    
    /*** adder_2 ***/
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<2; i=i+1) begin
                adder_2[i] <= 0; 
            end
            adder_3_start <= 0;
        end else if(adder_2_start) begin
            adder_2[0] <= adder_1[0] + adder_1[1];
            adder_2[1] <= adder_1[2];
            adder_3_start <= 1;
        end
    end
    
    /*** adder_3 ***/
    always @(posedge clk) begin
        if(rst) begin
            adder_3 <= 0; 
            avg_start <= 0;
        end else if(adder_3_start) begin
            adder_3 <= adder_2[0] + adder_2[1];
            avg_start <= 1;
        end
    end

    /*** average ***/
    always @(posedge clk) begin
        if(rst) begin
            odata <= 0; 
            done <= 0;
        end else if(avg_start) begin
            odata <= adder_3 / 10;
            done <= 1;
        end
    end
    
endmodule