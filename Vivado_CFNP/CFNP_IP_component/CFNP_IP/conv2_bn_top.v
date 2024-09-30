`timescale 1ns / 1ps

module conv2_bn_top #(
    parameter CONV_INPUT_SIZE    = 22,
    parameter CONV_OUTPUT_SIZE   = 21,
    parameter CONV_OUTPUT_FILTER = 10
)(
    input                     clk,
    input                     rst,
    input                     start,
    output reg         [4:0]  input_addra, 
    input  wire signed [15:0] idata_0, idata_1, idata_2, idata_3, idata_4, idata_5, idata_6, idata_7, idata_8, idata_9, idata_10, idata_11, idata_12, idata_13, idata_14, idata_15, idata_16, idata_17, idata_18, idata_19,
    output wire signed [15:0] odata,
    output reg         [4:0]  output_addra,
    output reg         [3:0]  output_filter,
    output wire               done
);
    /*** variable ***/

    wire all_rst; // 10 filters are calculated before enable
    wire bn_done;
    
    reg [3:0] conv2_weights_memory_filter;
    reg [3:0] bias_memory_filter;
    reg [4:0] quantify_counter;
    reg [3:0] bn_weights_memory_fliter;

    /*** input buffer ***/
    
    reg [2:0] input_buffer_delay;
    
    wire input_buffer_done    [0:19];
    wire input_buffer_all_done;
    
    wire signed [15:0] x [0:1][0:19];

    conv2_input_buffer conv2_input_buffer_0 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_0 ), .x0(x[0][ 0]), .x1(x[1][ 0]), .done(input_buffer_done[ 0]));
    conv2_input_buffer conv2_input_buffer_1 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_1 ), .x0(x[0][ 1]), .x1(x[1][ 1]), .done(input_buffer_done[ 1]));
    conv2_input_buffer conv2_input_buffer_2 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_2 ), .x0(x[0][ 2]), .x1(x[1][ 2]), .done(input_buffer_done[ 2]));
    conv2_input_buffer conv2_input_buffer_3 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_3 ), .x0(x[0][ 3]), .x1(x[1][ 3]), .done(input_buffer_done[ 3]));
    conv2_input_buffer conv2_input_buffer_4 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_4 ), .x0(x[0][ 4]), .x1(x[1][ 4]), .done(input_buffer_done[ 4]));
    conv2_input_buffer conv2_input_buffer_5 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_5 ), .x0(x[0][ 5]), .x1(x[1][ 5]), .done(input_buffer_done[ 5]));
    conv2_input_buffer conv2_input_buffer_6 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_6 ), .x0(x[0][ 6]), .x1(x[1][ 6]), .done(input_buffer_done[ 6]));
    conv2_input_buffer conv2_input_buffer_7 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_7 ), .x0(x[0][ 7]), .x1(x[1][ 7]), .done(input_buffer_done[ 7]));
    conv2_input_buffer conv2_input_buffer_8 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_8 ), .x0(x[0][ 8]), .x1(x[1][ 8]), .done(input_buffer_done[ 8]));
    conv2_input_buffer conv2_input_buffer_9 (.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_9 ), .x0(x[0][ 9]), .x1(x[1][ 9]), .done(input_buffer_done[ 9]));
    conv2_input_buffer conv2_input_buffer_10(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_10), .x0(x[0][10]), .x1(x[1][10]), .done(input_buffer_done[10]));
    conv2_input_buffer conv2_input_buffer_11(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_11), .x0(x[0][11]), .x1(x[1][11]), .done(input_buffer_done[11]));
    conv2_input_buffer conv2_input_buffer_12(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_12), .x0(x[0][12]), .x1(x[1][12]), .done(input_buffer_done[12]));
    conv2_input_buffer conv2_input_buffer_13(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_13), .x0(x[0][13]), .x1(x[1][13]), .done(input_buffer_done[13]));
    conv2_input_buffer conv2_input_buffer_14(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_14), .x0(x[0][14]), .x1(x[1][14]), .done(input_buffer_done[14]));
    conv2_input_buffer conv2_input_buffer_15(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_15), .x0(x[0][15]), .x1(x[1][15]), .done(input_buffer_done[15]));
    conv2_input_buffer conv2_input_buffer_16(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_16), .x0(x[0][16]), .x1(x[1][16]), .done(input_buffer_done[16]));
    conv2_input_buffer conv2_input_buffer_17(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_17), .x0(x[0][17]), .x1(x[1][17]), .done(input_buffer_done[17]));
    conv2_input_buffer conv2_input_buffer_18(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_18), .x0(x[0][18]), .x1(x[1][18]), .done(input_buffer_done[18]));
    conv2_input_buffer conv2_input_buffer_19(.clk(clk), .rst(rst || all_rst), .start(start && input_buffer_delay==2), .idata(idata_19), .x0(x[0][19]), .x1(x[1][19]), .done(input_buffer_done[19]));

    assign input_buffer_all_done = input_buffer_done[0] && input_buffer_done[1] && input_buffer_done[2] && input_buffer_done[3] && input_buffer_done[4] && input_buffer_done[5] && input_buffer_done[6] && input_buffer_done[7] && input_buffer_done[8] && input_buffer_done[9] && input_buffer_done[10] && input_buffer_done[11] && input_buffer_done[12] && input_buffer_done[13] && input_buffer_done[14] && input_buffer_done[15] && input_buffer_done[16] && input_buffer_done[17] && input_buffer_done[18] && input_buffer_done[19];
    
    /*** weights memory ***/
    
    wire conv2_weights_memory_done    [0:19];
    wire conv2_weights_memory_all_done;

    wire bias_memory_start;
    wire bias_memory_done;    
    
    wire bn_weights_memory_start;
    wire bn_weights_memory_done;
    
    wire signed [15:0] w [0:1][0:19];
    wire signed [31:0] b;
    wire signed [15:0] wp;
    wire signed [31:0] wq;

    conv2_weights_memory conv2_weights_memory_0 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 0), .w0(w[0][ 0]), .w1(w[1][ 0]), .done(conv2_weights_memory_done[ 0]));
    conv2_weights_memory conv2_weights_memory_1 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 1), .w0(w[0][ 1]), .w1(w[1][ 1]), .done(conv2_weights_memory_done[ 1]));
    conv2_weights_memory conv2_weights_memory_2 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 2), .w0(w[0][ 2]), .w1(w[1][ 2]), .done(conv2_weights_memory_done[ 2]));
    conv2_weights_memory conv2_weights_memory_3 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 3), .w0(w[0][ 3]), .w1(w[1][ 3]), .done(conv2_weights_memory_done[ 3]));
    conv2_weights_memory conv2_weights_memory_4 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 4), .w0(w[0][ 4]), .w1(w[1][ 4]), .done(conv2_weights_memory_done[ 4]));
    conv2_weights_memory conv2_weights_memory_5 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 5), .w0(w[0][ 5]), .w1(w[1][ 5]), .done(conv2_weights_memory_done[ 5]));
    conv2_weights_memory conv2_weights_memory_6 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 6), .w0(w[0][ 6]), .w1(w[1][ 6]), .done(conv2_weights_memory_done[ 6]));
    conv2_weights_memory conv2_weights_memory_7 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 7), .w0(w[0][ 7]), .w1(w[1][ 7]), .done(conv2_weights_memory_done[ 7]));
    conv2_weights_memory conv2_weights_memory_8 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 8), .w0(w[0][ 8]), .w1(w[1][ 8]), .done(conv2_weights_memory_done[ 8]));
    conv2_weights_memory conv2_weights_memory_9 (.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd 9), .w0(w[0][ 9]), .w1(w[1][ 9]), .done(conv2_weights_memory_done[ 9]));
    conv2_weights_memory conv2_weights_memory_10(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd10), .w0(w[0][10]), .w1(w[1][10]), .done(conv2_weights_memory_done[10]));
    conv2_weights_memory conv2_weights_memory_11(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd11), .w0(w[0][11]), .w1(w[1][11]), .done(conv2_weights_memory_done[11]));
    conv2_weights_memory conv2_weights_memory_12(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd12), .w0(w[0][12]), .w1(w[1][12]), .done(conv2_weights_memory_done[12]));
    conv2_weights_memory conv2_weights_memory_13(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd13), .w0(w[0][13]), .w1(w[1][13]), .done(conv2_weights_memory_done[13]));
    conv2_weights_memory conv2_weights_memory_14(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd14), .w0(w[0][14]), .w1(w[1][14]), .done(conv2_weights_memory_done[14]));
    conv2_weights_memory conv2_weights_memory_15(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd15), .w0(w[0][15]), .w1(w[1][15]), .done(conv2_weights_memory_done[15]));
    conv2_weights_memory conv2_weights_memory_16(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd16), .w0(w[0][16]), .w1(w[1][16]), .done(conv2_weights_memory_done[16]));
    conv2_weights_memory conv2_weights_memory_17(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd17), .w0(w[0][17]), .w1(w[1][17]), .done(conv2_weights_memory_done[17]));
    conv2_weights_memory conv2_weights_memory_18(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd18), .w0(w[0][18]), .w1(w[1][18]), .done(conv2_weights_memory_done[18]));
    conv2_weights_memory conv2_weights_memory_19(.clk(clk), .rst(rst || all_rst), .start(start), .output_filter(conv2_weights_memory_filter), .input_filter(5'd19), .w0(w[0][19]), .w1(w[1][19]), .done(conv2_weights_memory_done[19]));      
    
    conv2_bias_memory conv2_bias_memory_0(.clk(clk), .rst(rst || all_rst), .start(bias_memory_start), .output_filter(bias_memory_filter), .b(b), .done(bias_memory_done)); 

    bn_weights_memory bn_weights_memory_0(.clk(clk), .rst(rst || all_rst), .start(bn_weights_memory_start), .input_filter(bn_weights_memory_fliter), .p(wp), .q(wq), .done(bn_weights_memory_done));
    
    assign bias_memory_start = adder_tree3_start;
    
    assign bn_weights_memory_start = bn_start;

    assign conv2_weights_memory_all_done = conv2_weights_memory_done[0] && conv2_weights_memory_done[1] && conv2_weights_memory_done[2] && conv2_weights_memory_done[3] && conv2_weights_memory_done[4] && conv2_weights_memory_done[5] && conv2_weights_memory_done[6] && conv2_weights_memory_done[7] && conv2_weights_memory_done[8] && conv2_weights_memory_done[9] && conv2_weights_memory_done[10] && conv2_weights_memory_done[11] && conv2_weights_memory_done[12] && conv2_weights_memory_done[13] && conv2_weights_memory_done[14] && conv2_weights_memory_done[15] && conv2_weights_memory_done[16] && conv2_weights_memory_done[17] && conv2_weights_memory_done[18] && conv2_weights_memory_done[19]; 
    
    /*** processing element ***/

    wire pe_done  [0:19];
    wire pe_all_done;

    wire signed [31:0] pe_odata [0:19];

    conv2_processing_element conv2_processing_element_0 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 0] && conv2_weights_memory_done[ 0]), .x0(x[0][ 0]), .x1(x[1][ 0]), .w0(w[0][ 0]), .w1(w[1][ 0]), .odata(pe_odata[ 0]), .done(pe_done[ 0]));
    conv2_processing_element conv2_processing_element_1 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 1] && conv2_weights_memory_done[ 1]), .x0(x[0][ 1]), .x1(x[1][ 1]), .w0(w[0][ 1]), .w1(w[1][ 1]), .odata(pe_odata[ 1]), .done(pe_done[ 1]));
    conv2_processing_element conv2_processing_element_2 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 2] && conv2_weights_memory_done[ 2]), .x0(x[0][ 2]), .x1(x[1][ 2]), .w0(w[0][ 2]), .w1(w[1][ 2]), .odata(pe_odata[ 2]), .done(pe_done[ 2]));
    conv2_processing_element conv2_processing_element_3 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 3] && conv2_weights_memory_done[ 3]), .x0(x[0][ 3]), .x1(x[1][ 3]), .w0(w[0][ 3]), .w1(w[1][ 3]), .odata(pe_odata[ 3]), .done(pe_done[ 3]));
    conv2_processing_element conv2_processing_element_4 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 4] && conv2_weights_memory_done[ 4]), .x0(x[0][ 4]), .x1(x[1][ 4]), .w0(w[0][ 4]), .w1(w[1][ 4]), .odata(pe_odata[ 4]), .done(pe_done[ 4]));
    conv2_processing_element conv2_processing_element_5 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 5] && conv2_weights_memory_done[ 5]), .x0(x[0][ 5]), .x1(x[1][ 5]), .w0(w[0][ 5]), .w1(w[1][ 5]), .odata(pe_odata[ 5]), .done(pe_done[ 5]));
    conv2_processing_element conv2_processing_element_6 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 6] && conv2_weights_memory_done[ 6]), .x0(x[0][ 6]), .x1(x[1][ 6]), .w0(w[0][ 6]), .w1(w[1][ 6]), .odata(pe_odata[ 6]), .done(pe_done[ 6]));
    conv2_processing_element conv2_processing_element_7 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 7] && conv2_weights_memory_done[ 7]), .x0(x[0][ 7]), .x1(x[1][ 7]), .w0(w[0][ 7]), .w1(w[1][ 7]), .odata(pe_odata[ 7]), .done(pe_done[ 7]));
    conv2_processing_element conv2_processing_element_8 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 8] && conv2_weights_memory_done[ 8]), .x0(x[0][ 8]), .x1(x[1][ 8]), .w0(w[0][ 8]), .w1(w[1][ 8]), .odata(pe_odata[ 8]), .done(pe_done[ 8]));
    conv2_processing_element conv2_processing_element_9 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[ 9] && conv2_weights_memory_done[ 9]), .x0(x[0][ 9]), .x1(x[1][ 9]), .w0(w[0][ 9]), .w1(w[1][ 9]), .odata(pe_odata[ 9]), .done(pe_done[ 9]));
    conv2_processing_element conv2_processing_element_10(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[10] && conv2_weights_memory_done[10]), .x0(x[0][10]), .x1(x[1][10]), .w0(w[0][10]), .w1(w[1][10]), .odata(pe_odata[10]), .done(pe_done[10]));
    conv2_processing_element conv2_processing_element_11(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[11] && conv2_weights_memory_done[11]), .x0(x[0][11]), .x1(x[1][11]), .w0(w[0][11]), .w1(w[1][11]), .odata(pe_odata[11]), .done(pe_done[11]));
    conv2_processing_element conv2_processing_element_12(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[12] && conv2_weights_memory_done[12]), .x0(x[0][12]), .x1(x[1][12]), .w0(w[0][12]), .w1(w[1][12]), .odata(pe_odata[12]), .done(pe_done[12]));
    conv2_processing_element conv2_processing_element_13(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[13] && conv2_weights_memory_done[13]), .x0(x[0][13]), .x1(x[1][13]), .w0(w[0][13]), .w1(w[1][13]), .odata(pe_odata[13]), .done(pe_done[13]));
    conv2_processing_element conv2_processing_element_14(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[14] && conv2_weights_memory_done[14]), .x0(x[0][14]), .x1(x[1][14]), .w0(w[0][14]), .w1(w[1][14]), .odata(pe_odata[14]), .done(pe_done[14]));
    conv2_processing_element conv2_processing_element_15(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[15] && conv2_weights_memory_done[15]), .x0(x[0][15]), .x1(x[1][15]), .w0(w[0][15]), .w1(w[1][15]), .odata(pe_odata[15]), .done(pe_done[15]));
    conv2_processing_element conv2_processing_element_16(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[16] && conv2_weights_memory_done[16]), .x0(x[0][16]), .x1(x[1][16]), .w0(w[0][16]), .w1(w[1][16]), .odata(pe_odata[16]), .done(pe_done[16]));
    conv2_processing_element conv2_processing_element_17(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[17] && conv2_weights_memory_done[17]), .x0(x[0][17]), .x1(x[1][17]), .w0(w[0][17]), .w1(w[1][17]), .odata(pe_odata[17]), .done(pe_done[17]));
    conv2_processing_element conv2_processing_element_18(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[18] && conv2_weights_memory_done[18]), .x0(x[0][18]), .x1(x[1][18]), .w0(w[0][18]), .w1(w[1][18]), .odata(pe_odata[18]), .done(pe_done[18]));
    conv2_processing_element conv2_processing_element_19(.clk(clk), .rst(rst || all_rst), .start(input_buffer_done[19] && conv2_weights_memory_done[19]), .x0(x[0][19]), .x1(x[1][19]), .w0(w[0][19]), .w1(w[1][19]), .odata(pe_odata[19]), .done(pe_done[19]));
    
    assign pe_all_done = pe_done[0] && pe_done[1] && pe_done[2] && pe_done[3] && pe_done[4] && pe_done[5] && pe_done[6] && pe_done[7] && pe_done[8] && pe_done[9] && pe_done[10] && pe_done[11] && pe_done[12] && pe_done[13] && pe_done[14] && pe_done[15] && pe_done[16] && pe_done[17] && pe_done[18] && pe_done[19]; 
    
    /*** adder ***/
    integer i;

    reg adder_tree1_start, adder_tree2_start, adder_tree3_start, adder_tree4_start;
    reg signed relu_start, quantify_start, bn_start;

    reg signed [31:0] adder_0 [0:9];
    reg signed [31:0] adder_1 [0:4];
    reg signed [31:0] adder_2 [0:2];
    reg signed [31:0] adder_3 [0:1];
    reg signed [31:0] adder_4;
    reg signed [31:0] relu;
    reg signed [15:0] conv2_odata;

    /*** adder tree ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            for(i=0; i<10; i=i+1) begin
                adder_0[i] <= 0;
            end
            adder_tree1_start <= 0;
        end else if(pe_all_done)begin
            adder_0[0] <= pe_odata[0]  + pe_odata[1];
            adder_0[1] <= pe_odata[2]  + pe_odata[3];
            adder_0[2] <= pe_odata[4]  + pe_odata[5];
            adder_0[3] <= pe_odata[6]  + pe_odata[7];
            adder_0[4] <= pe_odata[8]  + pe_odata[9];
            adder_0[5] <= pe_odata[10] + pe_odata[11];
            adder_0[6] <= pe_odata[12] + pe_odata[13];
            adder_0[7] <= pe_odata[14] + pe_odata[15];
            adder_0[8] <= pe_odata[16] + pe_odata[17];
            adder_0[9] <= pe_odata[18] + pe_odata[19];
            adder_tree1_start <= 1;
        end
    end

    /*** adder tree1 ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            for(i=0; i<5; i=i+1) begin
                adder_1[i] <= 0;
            end
            adder_tree2_start <= 0;
        end else if(adder_tree1_start) begin
            adder_1[0] <= adder_0[0] + adder_0[1];
            adder_1[1] <= adder_0[2] + adder_0[3];
            adder_1[2] <= adder_0[4] + adder_0[5];
            adder_1[3] <= adder_0[6] + adder_0[7];
            adder_1[4] <= adder_0[8] + adder_0[9];
            adder_tree2_start <= 1;
        end
    end

    /*** adder tree2 ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            for(i=0; i<3; i=i+1) begin
                adder_2[i] <= 0;
            end
            adder_tree3_start <= 0;
        end else if(adder_tree2_start) begin
            adder_2[0] <= adder_1[0] + adder_1[1];
            adder_2[1] <= adder_1[2] + adder_1[3];
            adder_2[2] <= adder_1[4];
            adder_tree3_start <= 1;
        end
    end

    /*** adder tree3 ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin 
            for(i=0; i<2; i=i+1) begin
                adder_3[i] <= 0;
            end
            adder_tree4_start <= 0;
        end else if(adder_tree3_start) begin
            adder_3[0] <= adder_2[0] + adder_2[1];
            adder_3[1] <= adder_2[2] + b;
            adder_tree4_start <= 1;
        end
    end

    /*** adder tree4 ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            adder_4    <= 0;
            relu_start <= 0;
        end else if(adder_tree4_start) begin
            adder_4    <= adder_3[0] + adder_3[1];
            relu_start <= 1;
        end
    end

    /*** relu ***/  
    always @(posedge clk) begin
        if(rst || all_rst) begin
            relu <= 0;
            quantify_start <= 0;
        end else if(relu_start) begin
            if(adder_4 > 0) begin
                relu <= adder_4;
            end else begin
                relu <= 0;
            end
            quantify_start <= 1;
        end
    end
    
    /*** quantify ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            conv2_odata <= 0;
            bn_start    <= 0;
        end else if(quantify_start) begin
            conv2_odata <= relu / 1000;
            bn_start    <= 1;
        end
    end
    
    /*** batchnorm. ***/
    bn_processing_element bn_processing_element_0(.clk(clk), .rst(rst || all_rst), .start(bn_start), .x(conv2_odata), .p(wp), .q(wq), .odata(odata), .done(bn_done));
    
    /***** control unit *****/
    
    /*** input_buffer_delay ***/
    always @(posedge clk) begin
        if(rst) begin
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
        if(rst) begin
            input_addra <= 0;
        end else if(start) begin
            if(input_addra != CONV_INPUT_SIZE - 1) begin
                if(input_addra == 0) begin
                    input_addra <= input_addra + 1;
                end else if(bn_done && quantify_counter == 8) begin
                    input_addra <= input_addra + 1;
                end else begin
                    input_addra <= input_addra;
                end
            end
        end
    end
    
    /*** conv2_weights_memory_filter ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            conv2_weights_memory_filter <= 0;
        end else if(start) begin
            if(conv2_weights_memory_filter != CONV_OUTPUT_FILTER - 1 && input_buffer_all_done) begin
                conv2_weights_memory_filter <= conv2_weights_memory_filter + 1;
            end else begin
                conv2_weights_memory_filter <= 0;
            end
        end 
    end

    /*** bias_memory_filter ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            bias_memory_filter <= 0;
        end else if(adder_tree3_start) begin
            if(bias_memory_filter != CONV_OUTPUT_FILTER - 1) begin
                bias_memory_filter <= bias_memory_filter + 1;
            end else begin
                bias_memory_filter <= 0;
            end
        end
    end
    
    /*** bn_weights_memory_fliter ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            bn_weights_memory_fliter <= 0;
        end else if(bn_start) begin
            if(bn_weights_memory_fliter != CONV_OUTPUT_FILTER - 1)begin
                bn_weights_memory_fliter <= bn_weights_memory_fliter + 1;
            end else begin
                bn_weights_memory_fliter <= 0;
            end
        end
    end
    
    /*** quantify_counter ***/
    always @(posedge clk) begin
        if(rst || all_rst) begin
            quantify_counter <= 0;
        end else if(bn_done) begin
            if(quantify_counter != CONV_OUTPUT_FILTER - 1) begin
                quantify_counter <= quantify_counter + 1;
            end else begin
                quantify_counter <= 0;
            end
        end 
    end

    /*** output_filter ***/
    always @(posedge clk) begin
        if(rst) begin
            output_filter <= -1;
        end else if(start) begin
            if(output_filter != CONV_OUTPUT_FILTER - 1 && bn_done) begin
                output_filter <= output_filter + 1;
            end else begin
                output_filter <= 0;
            end
        end 
    end

    /*** output_addra ***/
    always @(posedge clk) begin
        if(rst) begin
            output_addra <= 0;
        end else if(start) begin
            if(quantify_counter == CONV_OUTPUT_FILTER - 1) begin
                output_addra <= output_addra + 1;
            end else begin
                output_addra <= output_addra;
            end
        end
    end
    
    /*** done ***/ 
    assign all_rst = (quantify_counter == CONV_OUTPUT_FILTER - 1)? 1 : 0;
    assign done    = (output_addra == CONV_OUTPUT_SIZE)? 1 : 0;
endmodule
