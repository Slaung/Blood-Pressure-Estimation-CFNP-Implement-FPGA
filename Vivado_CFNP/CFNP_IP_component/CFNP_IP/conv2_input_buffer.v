`timescale 1ns / 1ps

module conv2_input_buffer(
    input wire clk,
    input wire rst,
    input wire start,
    input wire signed [15:0] idata,
    output reg signed [15:0] x0, x1,
    output reg done
);
    integer i;
    reg signed [15:0] buffer  [0:1]; // kernel size=2
    reg        [ 3:0] counter;

    /*** shift register ***/
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<2; i=i+1) begin
                buffer[i] <= 0;
            end
        end else if(start) begin
            if(counter < 2) begin // kernel size=2
                buffer[1] <= idata;
                for(i=0; i<1; i=i+1) begin
                    buffer[i] <= buffer[i+1];
                end
            end
        end
    end

    /*** output ***/
    always @(posedge clk) begin
        if(rst) begin
            x0   <= 0; 
            x1   <= 0;
            done <= 0;
        end else if(start) begin
            if(counter >= 2) begin // kernel size=2
                x0   <= buffer[0];
                x1   <= buffer[1];
                done <= 1;
            end else begin 
                x0   <= x0;
                x1   <= x1;
                done <= 0;
            end
        end
    end

    /*** control unit ***/
    always @(posedge clk) begin
        if(rst) begin
            counter <= 0;
        end else if(start) begin
            if(counter <= 2) begin // kernel size=2
                counter <= counter + 1;
            end else begin
                counter <= counter;
            end
        end
    end 
endmodule
