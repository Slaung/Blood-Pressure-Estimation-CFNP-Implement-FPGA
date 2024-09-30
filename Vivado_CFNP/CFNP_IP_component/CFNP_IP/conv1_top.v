`timescale 1ns / 1ps

module conv1_top#(
    parameter CONV_INPUT_SIZE = 23,
    parameter CONV_OUTPUT_SIZE = 22,
    parameter CONV_OUTPUT_FILTER = 20
)(
    input                     clk,
    input                     rst,
    input                     start,
    output reg         [4: 0] input_addra,
    input  wire signed [15:0] idata,
    output wire signed [15:0] odata,
    output reg         [4: 0] output_filter,
    output reg         [4: 0] output_addra,
    output reg                done = 0
);
    /*** variable ***/
    reg [2:0] input_buffer_delay;
    reg [4:0] weights_memory_filter;
    reg [4:0] weights_memory_filter_counter;
    
    wire all_rst;
    wire input_buffer_start;
    wire input_buffer_done;
    wire weights_memory_start;
    wire weights_memory_done;
    wire pe_start;
    wire pe_done;
    
    wire signed [15: 0] x [0: 1];
    wire signed [15: 0] w [0: 1];
    wire signed [31: 0] b;

    /*** input buffer ***/
    conv1_input_buffer conv1_input_buffer1(
        .clk  (clk),
        .rst  (rst || all_rst),
        .start(input_buffer_start && input_buffer_delay == 2),
        .idata(idata),
        .x0   (x[0]), .x1(x[1]),
        .done (input_buffer_done)
    );
    assign input_buffer_start = start;
    
    /*** weights memory ***/
    conv1_weights_memory conv1_weights_memory_0(
        .clk         (clk), 
        .rst         (rst || all_rst), 
        .start       (start), 
        .input_filter(weights_memory_filter), 
        .w0          (w[0]), 
        .w1          (w[1]), 
        .b           (b), 
        .done        (weights_memory_done)
    );
    
    assign weights_memory_start = start;

    
    /*** processing element ***/
    conv1_processing_element conv1_processing_element_0(
        .clk  (clk), 
        .rst  (rst || all_rst), 
        .start(pe_start), 
        .x0   (x[0]), 
        .x1   (x[1]), 
        .w0   (w[0]), 
        .w1   (w[1]), 
        .b    (b), 
        .odata(odata), 
        .done (pe_done)
    );

    assign pe_start = input_buffer_done && weights_memory_done;

    /***** control unit *****/
    
    /*** input_buffer_delay ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            input_buffer_delay <= 0;
        end else if(start) begin
            if(input_buffer_delay != 2) begin
                input_buffer_delay <= input_buffer_delay + 1;
            end else begin
                input_buffer_delay <= input_buffer_delay;
            end
        end
    end
    
    /*** input_addra ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            input_addra <= 0;
        end else if(start) begin
            if(input_addra != CONV_INPUT_SIZE - 1) begin
                input_addra <= input_addra + 1;
            end else begin
                input_addra <= 0;
            end
        end
    end
    
    /*** weights_memory_filter ***/
    always @(posedge clk) begin
        if(rst) begin
            weights_memory_filter <= 0;
        end else if(start) begin
            if(weights_memory_filter != CONV_OUTPUT_FILTER - 1 && weights_memory_filter_counter == CONV_OUTPUT_SIZE - 1) begin
                weights_memory_filter <= weights_memory_filter + 1;
            end else begin
                weights_memory_filter <= weights_memory_filter;
            end
        end
    end
    
    /*** weights_memory_filter_counter ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            weights_memory_filter_counter <= 0;
        end else if(pe_start) begin
            if(weights_memory_filter_counter != CONV_INPUT_SIZE - 1) begin
                weights_memory_filter_counter <= weights_memory_filter_counter + 1;
            end else begin
                weights_memory_filter_counter <= 0;
            end
        end
    end
    
    /*** output_addra ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            output_addra <= 0;
        end else if(pe_done) begin
            if(output_addra ==  CONV_OUTPUT_SIZE - 1) begin
                output_addra <= 0;
            end else begin
                output_addra <= output_addra + 1;
            end
        end
    end
    
    /*** output_filter ***/
    always @(posedge clk) begin
        if(rst) begin
            output_filter <= 0;
        end else if(output_addra == CONV_OUTPUT_SIZE - 1) begin
            if(output_filter !=  CONV_OUTPUT_FILTER - 1) begin
                output_filter <= output_filter + 1;
            end else begin
                output_filter <= output_filter;
            end
        end
    end
    
    /*** done ***/
     always @(posedge clk) begin
        if(rst) begin
            done <= 0;
        end else if(output_filter == CONV_OUTPUT_FILTER - 1 && output_addra == CONV_OUTPUT_SIZE - 1) begin
            done <= 1;
        end
    end
    
    assign all_rst = (output_addra == CONV_OUTPUT_SIZE - 1)? 1 : 0;
endmodule
