`timescale 1ns / 1ps

module fusionCAP_input_buffer(
    input wire clk,
    input wire rst,
    input wire start,
    input wire signed [15:0] idata,
    output reg signed [15:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9,
    output reg done
);
    integer i;
    
    reg signed [15:0] buffer  [0:9];
    reg        [3:0]  counter;

    /*** shift register ***/
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<10; i=i+1) begin
                buffer[i] <= 0;
            end
        end else if(start) begin
            if(counter < 10) begin
                buffer[9] <= idata;
                for(i=0; i<9; i=i+1) begin
                    buffer[i] <= buffer[i+1];
                end
            end
        end
    end

    /*** output ***/
    always @(posedge clk) begin
        if(rst) begin
            x0 <= 0; x1 <= 0; x2 <= 0; x3 <= 0; x4 <= 0;
            x5 <= 0; x6 <= 0; x7 <= 0; x8 <= 0; x9 <= 0;
            done <= 0;
        end else if(start) begin
            if(counter >= 10) begin 
                x0   <= buffer[0]; x1 <= buffer[1]; x2 <= buffer[2]; x3 <= buffer[3]; x4 <= buffer[4];
                x5   <= buffer[5]; x6 <= buffer[6]; x7 <= buffer[7]; x8 <= buffer[8]; x9 <= buffer[9];
                done <= 1;
            end else begin 
                x0 <= x0; x1 <= x1; x2 <= x2; x3 <= x3; x4 <= x4;
                x5 <= x5; x6 <= x6; x7 <= x7; x8 <= x8; x9 <= x9;
                done <= 0;
            end
        end
    end

    /*** control unit ***/
    always @(posedge clk) begin
        if(rst) begin
            counter <= 0;
        end else if(start) begin
            if(counter <= 10) begin 
                counter <= counter + 1;
            end else begin
                counter <= counter;
            end
        end
    end 
endmodule
