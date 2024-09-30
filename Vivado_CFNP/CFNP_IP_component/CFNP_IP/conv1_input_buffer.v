`timescale 1ns / 1ps

module conv1_input_buffer(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire signed [15:0] idata,
    output reg  signed [15:0] x0, x1,
    output reg                done
);
    /*** variable ***/
    integer i;
    reg signed [15:0] buffer  [0:1]; 
    reg        [4:0]  addra;

    /*** shift register ***/
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<1; i=i+1) begin
                buffer[i] <= 0;
            end
        end else if(start) begin
            buffer[1] <= idata;
            for(i=0; i<1; i=i+1) begin
                buffer[i] <= buffer[i+1];
            end
        end
    end

    /*** output ***/
    always @(posedge clk) begin
        if(rst) begin
            x0 <= 0; x1 <= 0;
            done <= 0;
        end else if(start) begin
            if((addra > 1) && (addra <= 23)) begin 
                x0 <= buffer[0];
                x1 <= buffer[1];
                done <= 1;
            end else begin 
                x0 <= x0;
                x1 <= x1;
                done <= 0;
            end
        end
    end

    /*** addra ***/
    always @(posedge clk) begin
        if(rst) begin
            addra <= 0;
        end else if(start) begin
            if(addra <= 23) begin
                addra <= addra + 1;
            end else begin
                addra <= addra;
            end
        end
    end
endmodule