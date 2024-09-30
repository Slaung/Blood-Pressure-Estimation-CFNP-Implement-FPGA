`timescale 1ns / 1ps

/*** 
    v <= (1/((sd*2)**2))
***/ 

module fuzzy_rule_top #(
    parameter FR_INPUT_SIZE    = 21,
    parameter FR_OUTPUT_FILTER = 5
)(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    output reg         [ 1:0] input_addra, 
    input  wire signed [15:0] idata_0, idata_1, idata_2, idata_3, idata_4, idata_5, idata_6, idata_7, idata_8, idata_9, idata_10, idata_11, idata_12, idata_13, idata_14, idata_15, idata_16, idata_17, idata_18, idata_19, idata_20,
    output reg         [ 2:0] output_filter, 
    output wire signed [15:0] odata,
    output wire               done
);
    /*** variable ***/

    wire       all_rst;
    reg  [2:0] weights_memory_filter_m;
    reg  [2:0] weights_memory_filter_v;

    /*** input buffer ***/

    reg [2:0] input_buffer_delay;

    wire input_buffer_start   [0:20];
    wire input_buffer_done    [0:20];
    wire input_buffer_all_done;

    wire signed [15:0] x [0:20];

    fr_input_buffer fr_input_buffer_0 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 0] && input_buffer_delay==2), .idata(idata_0 ), .x(x[ 0]), .done(input_buffer_done[ 0]));
    fr_input_buffer fr_input_buffer_1 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 1] && input_buffer_delay==2), .idata(idata_1 ), .x(x[ 1]), .done(input_buffer_done[ 1]));
    fr_input_buffer fr_input_buffer_2 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 2] && input_buffer_delay==2), .idata(idata_2 ), .x(x[ 2]), .done(input_buffer_done[ 2]));
    fr_input_buffer fr_input_buffer_3 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 3] && input_buffer_delay==2), .idata(idata_3 ), .x(x[ 3]), .done(input_buffer_done[ 3]));
    fr_input_buffer fr_input_buffer_4 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 4] && input_buffer_delay==2), .idata(idata_4 ), .x(x[ 4]), .done(input_buffer_done[ 4]));
    fr_input_buffer fr_input_buffer_5 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 5] && input_buffer_delay==2), .idata(idata_5 ), .x(x[ 5]), .done(input_buffer_done[ 5]));
    fr_input_buffer fr_input_buffer_6 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 6] && input_buffer_delay==2), .idata(idata_6 ), .x(x[ 6]), .done(input_buffer_done[ 6]));
    fr_input_buffer fr_input_buffer_7 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 7] && input_buffer_delay==2), .idata(idata_7 ), .x(x[ 7]), .done(input_buffer_done[ 7]));
    fr_input_buffer fr_input_buffer_8 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 8] && input_buffer_delay==2), .idata(idata_8 ), .x(x[ 8]), .done(input_buffer_done[ 8]));
    fr_input_buffer fr_input_buffer_9 (.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[ 9] && input_buffer_delay==2), .idata(idata_9 ), .x(x[ 9]), .done(input_buffer_done[ 9]));
    fr_input_buffer fr_input_buffer_10(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[10] && input_buffer_delay==2), .idata(idata_10), .x(x[10]), .done(input_buffer_done[10]));
    fr_input_buffer fr_input_buffer_11(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[11] && input_buffer_delay==2), .idata(idata_11), .x(x[11]), .done(input_buffer_done[11]));
    fr_input_buffer fr_input_buffer_12(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[12] && input_buffer_delay==2), .idata(idata_12), .x(x[12]), .done(input_buffer_done[12]));
    fr_input_buffer fr_input_buffer_13(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[13] && input_buffer_delay==2), .idata(idata_13), .x(x[13]), .done(input_buffer_done[13]));
    fr_input_buffer fr_input_buffer_14(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[14] && input_buffer_delay==2), .idata(idata_14), .x(x[14]), .done(input_buffer_done[14]));
    fr_input_buffer fr_input_buffer_15(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[15] && input_buffer_delay==2), .idata(idata_15), .x(x[15]), .done(input_buffer_done[15]));
    fr_input_buffer fr_input_buffer_16(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[16] && input_buffer_delay==2), .idata(idata_16), .x(x[16]), .done(input_buffer_done[16]));
    fr_input_buffer fr_input_buffer_17(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[17] && input_buffer_delay==2), .idata(idata_17), .x(x[17]), .done(input_buffer_done[17]));
    fr_input_buffer fr_input_buffer_18(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[18] && input_buffer_delay==2), .idata(idata_18), .x(x[18]), .done(input_buffer_done[18]));
    fr_input_buffer fr_input_buffer_19(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[19] && input_buffer_delay==2), .idata(idata_19), .x(x[19]), .done(input_buffer_done[19]));
    fr_input_buffer fr_input_buffer_20(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[20] && input_buffer_delay==2), .idata(idata_20), .x(x[20]), .done(input_buffer_done[20]));
        
    assign input_buffer_start[ 0] = start;
    assign input_buffer_start[ 1] = start;
    assign input_buffer_start[ 2] = start;
    assign input_buffer_start[ 3] = start;
    assign input_buffer_start[ 4] = start;
    assign input_buffer_start[ 5] = start;
    assign input_buffer_start[ 6] = start;
    assign input_buffer_start[ 7] = start;
    assign input_buffer_start[ 8] = start;
    assign input_buffer_start[ 9] = start;
    assign input_buffer_start[10] = start;
    assign input_buffer_start[11] = start;
    assign input_buffer_start[12] = start;
    assign input_buffer_start[13] = start;
    assign input_buffer_start[14] = start;
    assign input_buffer_start[15] = start;
    assign input_buffer_start[16] = start;
    assign input_buffer_start[17] = start;
    assign input_buffer_start[18] = start;
    assign input_buffer_start[19] = start;
    assign input_buffer_start[20] = start;


    assign input_buffer_all_done = input_buffer_done[0] && input_buffer_done[1] && input_buffer_done[2] && input_buffer_done[3] && input_buffer_done[4] && input_buffer_done[5] && input_buffer_done[6] && input_buffer_done[7] && input_buffer_done[8] && input_buffer_done[9] && input_buffer_done[10] && input_buffer_done[11] && input_buffer_done[12] && input_buffer_done[13] && input_buffer_done[14] && input_buffer_done[15] && input_buffer_done[16] && input_buffer_done[17] && input_buffer_done[18] && input_buffer_done[19] && input_buffer_done[20]; 

    /*** weight memory***/
    wire weights_memory_start   [0:20];
    wire weights_memory_done    [0:20];
    wire weights_memory_all_done;
    
    wire signed [15:0] m [0:20];
    wire signed [15:0] v [0:20];

    fr_weights_memory fr_weights_memory_0 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 0]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd0 ), .m(m[ 0]), .v(v[ 0]), .done(weights_memory_done[ 0]));
    fr_weights_memory fr_weights_memory_1 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 1]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd1 ), .m(m[ 1]), .v(v[ 1]), .done(weights_memory_done[ 1]));
    fr_weights_memory fr_weights_memory_2 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 2]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd2 ), .m(m[ 2]), .v(v[ 2]), .done(weights_memory_done[ 2]));
    fr_weights_memory fr_weights_memory_3 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 3]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd3 ), .m(m[ 3]), .v(v[ 3]), .done(weights_memory_done[ 3]));
    fr_weights_memory fr_weights_memory_4 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 4]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd4 ), .m(m[ 4]), .v(v[ 4]), .done(weights_memory_done[ 4]));
    fr_weights_memory fr_weights_memory_5 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 5]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd5 ), .m(m[ 5]), .v(v[ 5]), .done(weights_memory_done[ 5]));
    fr_weights_memory fr_weights_memory_6 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 6]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd6 ), .m(m[ 6]), .v(v[ 6]), .done(weights_memory_done[ 6]));
    fr_weights_memory fr_weights_memory_7 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 7]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd7 ), .m(m[ 7]), .v(v[ 7]), .done(weights_memory_done[ 7]));
    fr_weights_memory fr_weights_memory_8 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 8]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd8 ), .m(m[ 8]), .v(v[ 8]), .done(weights_memory_done[ 8]));
    fr_weights_memory fr_weights_memory_9 (.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[ 9]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd9 ), .m(m[ 9]), .v(v[ 9]), .done(weights_memory_done[ 9]));
    fr_weights_memory fr_weights_memory_10(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[10]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd10), .m(m[10]), .v(v[10]), .done(weights_memory_done[10]));
    fr_weights_memory fr_weights_memory_11(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[11]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd11), .m(m[11]), .v(v[11]), .done(weights_memory_done[11]));
    fr_weights_memory fr_weights_memory_12(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[12]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd12), .m(m[12]), .v(v[12]), .done(weights_memory_done[12]));
    fr_weights_memory fr_weights_memory_13(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[13]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd13), .m(m[13]), .v(v[13]), .done(weights_memory_done[13]));
    fr_weights_memory fr_weights_memory_14(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[14]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd14), .m(m[14]), .v(v[14]), .done(weights_memory_done[14]));
    fr_weights_memory fr_weights_memory_15(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[15]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd15), .m(m[15]), .v(v[15]), .done(weights_memory_done[15]));
    fr_weights_memory fr_weights_memory_16(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[16]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd16), .m(m[16]), .v(v[16]), .done(weights_memory_done[16]));
    fr_weights_memory fr_weights_memory_17(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[17]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd17), .m(m[17]), .v(v[17]), .done(weights_memory_done[17]));
    fr_weights_memory fr_weights_memory_18(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[18]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd18), .m(m[18]), .v(v[18]), .done(weights_memory_done[18]));
    fr_weights_memory fr_weights_memory_19(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[19]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd19), .m(m[19]), .v(v[19]), .done(weights_memory_done[19]));
    fr_weights_memory fr_weights_memory_20(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start[20]), .output_filter_m(weights_memory_filter_m), .output_filter_v(weights_memory_filter_v), .input_filter(5'd20), .m(m[20]), .v(v[20]), .done(weights_memory_done[20]));

    assign weights_memory_start[ 0] = start;
    assign weights_memory_start[ 1] = start;
    assign weights_memory_start[ 2] = start;
    assign weights_memory_start[ 3] = start;
    assign weights_memory_start[ 4] = start;
    assign weights_memory_start[ 5] = start;
    assign weights_memory_start[ 6] = start;
    assign weights_memory_start[ 7] = start;
    assign weights_memory_start[ 8] = start;
    assign weights_memory_start[ 9] = start;
    assign weights_memory_start[10] = start;
    assign weights_memory_start[11] = start;
    assign weights_memory_start[12] = start;
    assign weights_memory_start[13] = start;
    assign weights_memory_start[14] = start;
    assign weights_memory_start[15] = start;
    assign weights_memory_start[16] = start;
    assign weights_memory_start[17] = start;
    assign weights_memory_start[18] = start;
    assign weights_memory_start[19] = start;
    assign weights_memory_start[20] = start;

    assign weights_memory_all_done = weights_memory_done[0] && weights_memory_done[1] && weights_memory_done[2] && weights_memory_done[3] && weights_memory_done[4] && weights_memory_done[5] && weights_memory_done[6] && weights_memory_done[7] && weights_memory_done[8] && weights_memory_done[9] && weights_memory_done[10] && weights_memory_done[11] && weights_memory_done[12] && weights_memory_done[13] && weights_memory_done[14] && weights_memory_done[15] && weights_memory_done[16] && weights_memory_done[17] && weights_memory_done[18] && weights_memory_done[19] && weights_memory_done[20]; 

    /*** processing element ***/

    wire pe_start   [0:20];
    wire pe_done    [0:20];
    wire pe_all_done;

    wire mult0_done [0:20];
    wire mult1_done [0:20];
    wire mult0_all_done, mult1_all_done;

    wire signed [15:0] pe_odata [0:20];

    fr_processing_element fr_processing_element_0 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 0]), .x(x[ 0]), .m(m[ 0]), .v(v[ 0]), .mult0_done(mult0_done[ 0]), .mult1_done(mult1_done[ 0]), .odata(pe_odata[ 0]), .done(pe_done[ 0]));
    fr_processing_element fr_processing_element_1 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 1]), .x(x[ 1]), .m(m[ 1]), .v(v[ 1]), .mult0_done(mult0_done[ 1]), .mult1_done(mult1_done[ 1]), .odata(pe_odata[ 1]), .done(pe_done[ 1]));
    fr_processing_element fr_processing_element_2 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 2]), .x(x[ 2]), .m(m[ 2]), .v(v[ 2]), .mult0_done(mult0_done[ 2]), .mult1_done(mult1_done[ 2]), .odata(pe_odata[ 2]), .done(pe_done[ 2]));
    fr_processing_element fr_processing_element_3 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 3]), .x(x[ 3]), .m(m[ 3]), .v(v[ 3]), .mult0_done(mult0_done[ 3]), .mult1_done(mult1_done[ 3]), .odata(pe_odata[ 3]), .done(pe_done[ 3]));
    fr_processing_element fr_processing_element_4 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 4]), .x(x[ 4]), .m(m[ 4]), .v(v[ 4]), .mult0_done(mult0_done[ 4]), .mult1_done(mult1_done[ 4]), .odata(pe_odata[ 4]), .done(pe_done[ 4]));
    fr_processing_element fr_processing_element_5 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 5]), .x(x[ 5]), .m(m[ 5]), .v(v[ 5]), .mult0_done(mult0_done[ 5]), .mult1_done(mult1_done[ 5]), .odata(pe_odata[ 5]), .done(pe_done[ 5]));
    fr_processing_element fr_processing_element_6 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 6]), .x(x[ 6]), .m(m[ 6]), .v(v[ 6]), .mult0_done(mult0_done[ 6]), .mult1_done(mult1_done[ 6]), .odata(pe_odata[ 6]), .done(pe_done[ 6]));
    fr_processing_element fr_processing_element_7 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 7]), .x(x[ 7]), .m(m[ 7]), .v(v[ 7]), .mult0_done(mult0_done[ 7]), .mult1_done(mult1_done[ 7]), .odata(pe_odata[ 7]), .done(pe_done[ 7]));
    fr_processing_element fr_processing_element_8 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 8]), .x(x[ 8]), .m(m[ 8]), .v(v[ 8]), .mult0_done(mult0_done[ 8]), .mult1_done(mult1_done[ 8]), .odata(pe_odata[ 8]), .done(pe_done[ 8]));
    fr_processing_element fr_processing_element_9 (.clk(clk), .rst(rst || all_rst), .start(pe_start[ 9]), .x(x[ 9]), .m(m[ 9]), .v(v[ 9]), .mult0_done(mult0_done[ 9]), .mult1_done(mult1_done[ 9]), .odata(pe_odata[ 9]), .done(pe_done[ 9]));
    fr_processing_element fr_processing_element_10(.clk(clk), .rst(rst || all_rst), .start(pe_start[10]), .x(x[10]), .m(m[10]), .v(v[10]), .mult0_done(mult0_done[10]), .mult1_done(mult1_done[10]), .odata(pe_odata[10]), .done(pe_done[10]));
    fr_processing_element fr_processing_element_11(.clk(clk), .rst(rst || all_rst), .start(pe_start[11]), .x(x[11]), .m(m[11]), .v(v[11]), .mult0_done(mult0_done[11]), .mult1_done(mult1_done[11]), .odata(pe_odata[11]), .done(pe_done[11]));
    fr_processing_element fr_processing_element_12(.clk(clk), .rst(rst || all_rst), .start(pe_start[12]), .x(x[12]), .m(m[12]), .v(v[12]), .mult0_done(mult0_done[12]), .mult1_done(mult1_done[12]), .odata(pe_odata[12]), .done(pe_done[12]));
    fr_processing_element fr_processing_element_13(.clk(clk), .rst(rst || all_rst), .start(pe_start[13]), .x(x[13]), .m(m[13]), .v(v[13]), .mult0_done(mult0_done[13]), .mult1_done(mult1_done[13]), .odata(pe_odata[13]), .done(pe_done[13]));
    fr_processing_element fr_processing_element_14(.clk(clk), .rst(rst || all_rst), .start(pe_start[14]), .x(x[14]), .m(m[14]), .v(v[14]), .mult0_done(mult0_done[14]), .mult1_done(mult1_done[14]), .odata(pe_odata[14]), .done(pe_done[14]));
    fr_processing_element fr_processing_element_15(.clk(clk), .rst(rst || all_rst), .start(pe_start[15]), .x(x[15]), .m(m[15]), .v(v[15]), .mult0_done(mult0_done[15]), .mult1_done(mult1_done[15]), .odata(pe_odata[15]), .done(pe_done[15]));
    fr_processing_element fr_processing_element_16(.clk(clk), .rst(rst || all_rst), .start(pe_start[16]), .x(x[16]), .m(m[16]), .v(v[16]), .mult0_done(mult0_done[16]), .mult1_done(mult1_done[16]), .odata(pe_odata[16]), .done(pe_done[16]));
    fr_processing_element fr_processing_element_17(.clk(clk), .rst(rst || all_rst), .start(pe_start[17]), .x(x[17]), .m(m[17]), .v(v[17]), .mult0_done(mult0_done[17]), .mult1_done(mult1_done[17]), .odata(pe_odata[17]), .done(pe_done[17]));
    fr_processing_element fr_processing_element_18(.clk(clk), .rst(rst || all_rst), .start(pe_start[18]), .x(x[18]), .m(m[18]), .v(v[18]), .mult0_done(mult0_done[18]), .mult1_done(mult1_done[18]), .odata(pe_odata[18]), .done(pe_done[18]));
    fr_processing_element fr_processing_element_19(.clk(clk), .rst(rst || all_rst), .start(pe_start[19]), .x(x[19]), .m(m[19]), .v(v[19]), .mult0_done(mult0_done[19]), .mult1_done(mult1_done[19]), .odata(pe_odata[19]), .done(pe_done[19]));
    fr_processing_element fr_processing_element_20(.clk(clk), .rst(rst || all_rst), .start(pe_start[20]), .x(x[20]), .m(m[20]), .v(v[20]), .mult0_done(mult0_done[20]), .mult1_done(mult1_done[20]), .odata(pe_odata[20]), .done(pe_done[20]));

    assign pe_start[ 0] = input_buffer_done[ 0] && weights_memory_done[ 0];
    assign pe_start[ 1] = input_buffer_done[ 1] && weights_memory_done[ 1];
    assign pe_start[ 2] = input_buffer_done[ 2] && weights_memory_done[ 2];
    assign pe_start[ 3] = input_buffer_done[ 3] && weights_memory_done[ 3];
    assign pe_start[ 4] = input_buffer_done[ 4] && weights_memory_done[ 4];
    assign pe_start[ 5] = input_buffer_done[ 5] && weights_memory_done[ 5];
    assign pe_start[ 6] = input_buffer_done[ 6] && weights_memory_done[ 6];
    assign pe_start[ 7] = input_buffer_done[ 7] && weights_memory_done[ 7];
    assign pe_start[ 8] = input_buffer_done[ 8] && weights_memory_done[ 8];
    assign pe_start[ 9] = input_buffer_done[ 9] && weights_memory_done[ 9];
    assign pe_start[10] = input_buffer_done[10] && weights_memory_done[10];
    assign pe_start[11] = input_buffer_done[11] && weights_memory_done[11];
    assign pe_start[12] = input_buffer_done[12] && weights_memory_done[12];
    assign pe_start[13] = input_buffer_done[13] && weights_memory_done[13];
    assign pe_start[14] = input_buffer_done[14] && weights_memory_done[14];
    assign pe_start[15] = input_buffer_done[15] && weights_memory_done[15];
    assign pe_start[16] = input_buffer_done[16] && weights_memory_done[16];
    assign pe_start[17] = input_buffer_done[17] && weights_memory_done[17];
    assign pe_start[18] = input_buffer_done[18] && weights_memory_done[18];
    assign pe_start[19] = input_buffer_done[19] && weights_memory_done[19];
    assign pe_start[20] = input_buffer_done[20] && weights_memory_done[20];

    assign pe_all_done = pe_done[0] && pe_done[1] && pe_done[2] && pe_done[3] && pe_done[4] && pe_done[5] && pe_done[6] && pe_done[7] && pe_done[8] && pe_done[9] && pe_done[10] && pe_done[11] && pe_done[12] && pe_done[13] && pe_done[14] && pe_done[15] && pe_done[16] && pe_done[17] && pe_done[18] && pe_done[19] && pe_done[20]; 

    assign mult0_all_done = mult0_done[0] && mult0_done[1] && mult0_done[2] && mult0_done[3] && mult0_done[4] && mult0_done[5] && mult0_done[6] && mult0_done[7] && mult0_done[8] && mult0_done[9] && mult0_done[10] && mult0_done[11] && mult0_done[12] && mult0_done[13] && mult0_done[14] && mult0_done[15] && mult0_done[16] && mult0_done[17] && mult0_done[18] && mult0_done[19] && mult0_done[20]; 
    assign mult1_all_done = mult1_done[0] && mult1_done[1] && mult1_done[2] && mult1_done[3] && mult1_done[4] && mult1_done[5] && mult1_done[6] && mult1_done[7] && mult1_done[8] && mult1_done[9] && mult1_done[10] && mult1_done[11] && mult1_done[12] && mult1_done[13] && mult1_done[14] && mult1_done[15] && mult1_done[16] && mult1_done[17] && mult1_done[18] && mult1_done[19] && mult1_done[20]; 

    /*** adder tree ***/

    integer i;

    reg adder1_start, adder2_start, adder3_start, adder4_start, quantify_start, exp_start;

    reg [16:0] adder0 [0:10];
    reg [17:0] adder1 [0: 5];
    reg [18:0] adder2 [0: 2];
    reg [19:0] adder3 [0: 1];
    reg [20:0] adder4;
    reg [20:0] quantify;

    /* adder0 */
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<11; i=i+1) begin
                adder0[i] <= 0;
            end
            adder1_start <= 0;
        end else if(pe_all_done) begin
            adder0[ 0] <= pe_odata[ 0] + pe_odata[ 1];
            adder0[ 1] <= pe_odata[ 2] + pe_odata[ 3];
            adder0[ 2] <= pe_odata[ 4] + pe_odata[ 5];
            adder0[ 3] <= pe_odata[ 6] + pe_odata[ 7];
            adder0[ 4] <= pe_odata[ 8] + pe_odata[ 9];
            adder0[ 5] <= pe_odata[10] + pe_odata[11];
            adder0[ 6] <= pe_odata[12] + pe_odata[13];
            adder0[ 7] <= pe_odata[14] + pe_odata[15];
            adder0[ 8] <= pe_odata[16] + pe_odata[17];
            adder0[ 9] <= pe_odata[18] + pe_odata[19];
            adder0[10] <= pe_odata[20];
            adder1_start <= 1;
        end
    end

    /* adder1 */
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<6; i=i+1) begin
                adder1[i] <= 0;
            end
            adder2_start <= 0;
        end else if(adder1_start) begin
            adder1[ 0] <= adder0[ 0] + adder0[ 1];
            adder1[ 1] <= adder0[ 2] + adder0[ 3];
            adder1[ 2] <= adder0[ 4] + adder0[ 5];
            adder1[ 3] <= adder0[ 6] + adder0[ 7];
            adder1[ 4] <= adder0[ 8] + adder0[ 9];
            adder1[ 5] <= adder0[10];
            adder2_start <= 1;
        end
    end

    /* adder2 */
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<3; i=i+1) begin
                adder2[i] <= 0;
            end
            adder3_start <= 0;
        end else if(adder2_start) begin
            adder2[ 0] <= adder1[ 0] + adder1[ 1];
            adder2[ 1] <= adder1[ 2] + adder1[ 3];
            adder2[ 2] <= adder1[ 4] + adder1[ 5];
            adder3_start <= 1;
        end
    end

    /* adder3 */
    always @(posedge clk) begin
        if(rst) begin
            for(i=0; i<2; i=i+1) begin
                adder3[i] <= 0;
            end
            adder4_start <= 0;
        end else if(adder3_start) begin
            adder3[ 0] <= adder2[ 0] + adder2[ 1];
            adder3[ 1] <= adder2[ 2];
            adder4_start <= 1;
        end
    end

    /*** adder4 ***/
    always @(posedge clk) begin
        if(rst) begin
            adder4         <= 0;
            quantify_start <= 0;
        end else if(adder4_start) begin
            adder4         <= adder3[0] + adder3[1];
            quantify_start <= 1;
        end
    end

    /*** adder quantify ***/
    always @(posedge clk) begin
        if(rst) begin
            quantify  <= 0;
            exp_start <= 0;
        end else if(quantify_start) begin
            quantify  <= adder4 / 100;
            exp_start <= 1;
        end
    end

    /*** exp ***/
    
    wire exp_done;

    fr_exp_lut fr_exp_lut_0(.clk(clk), .rst(rst), .start(exp_start), .addra(quantify[15:0]), .odata(odata), .done(exp_done));


    /***** control unit *****/
    
    /*** input_buffer_delay***/
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

    /*** weights_memory_filter_m ***/
    always @(posedge clk) begin
        if(rst) begin
            weights_memory_filter_m <= 0;
        end else if(start) begin
            if(weights_memory_filter_m != FR_OUTPUT_FILTER - 1 && mult0_all_done) begin
                weights_memory_filter_m <= weights_memory_filter_m + 1;
            end else begin
                weights_memory_filter_m <= weights_memory_filter_m;
            end
        end 
    end

    /*** weights_memory_filter_v ***/
    always @(posedge clk) begin
        if(rst) begin
            weights_memory_filter_v <= 0;
        end else if(start) begin
            if(weights_memory_filter_v != FR_OUTPUT_FILTER - 1 && mult1_all_done) begin
                weights_memory_filter_v <= weights_memory_filter_v + 1;
            end else begin
                weights_memory_filter_v <= weights_memory_filter_v;
            end
        end 
    end

    /*** output_filter ***/
    always @(posedge clk) begin
        if(rst) begin
            output_filter <= 0;
        end else if(start) begin
            if(output_filter != FR_OUTPUT_FILTER && exp_done) begin
                output_filter <= output_filter + 1;
            end else begin
                output_filter <= output_filter;
            end
        end 
    end

    /*** done ***/
    assign all_rst = 0;
    assign done    = (output_filter == FR_OUTPUT_FILTER)? 1 : 0;
endmodule
