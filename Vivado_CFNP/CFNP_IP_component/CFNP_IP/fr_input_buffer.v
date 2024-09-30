`timescale 1ns / 1ps

module fr_input_buffer(
    input  wire clk,
    input  wire rst,
    input  wire start,
    input  wire signed [15: 0] idata,
    output reg  signed [15: 0] x, 
    output reg  done
);
    reg signed [15: 0] buffer;
    reg buffer_done;

    /*** register ***/
    always@(posedge clk) begin
        if(rst) begin
            buffer     <= 0;
            buffer_done <= 0;
        end else if(start) begin
            buffer      <= idata;
            buffer_done <= 1;
        end
    end
    
    /*** output ***/
    always@(posedge clk) begin
        if(rst) begin
            x    <= 0;             
            done <= 0;
        end else if(buffer_done) begin
            x    <= buffer;
            done <= 1;
        end
    end

endmodule