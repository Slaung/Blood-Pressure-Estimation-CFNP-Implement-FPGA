`timescale 1ns / 1ps

module CFNP_top_tb();
    reg                clk;
    reg                rst;
    reg                start;
    wire signed [15:0] odata;
    wire               done;
    
    CFNP_top CFNP_test1(
        .clk               (clk),
        .rst               (rst),
        .start             (start),
        .odata             (odata),
        .done              (done)
    ); 
    
    initial begin 
        clk = 1'b0;
        rst = 1'b1;
        start = 1'b0;
    end

    initial begin
        #10 rst = 1'b0; start = 1'b1;
        #20000 $finish;
    end

    always #5 clk = ~clk;
    

endmodule
