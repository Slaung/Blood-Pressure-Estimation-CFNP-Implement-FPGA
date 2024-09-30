`timescale  1ns / 1ps

module fusionCAP_top #(
    parameter CONV_INPUT_SIZE  = 21,
    parameter CONV_OUTPUT_SIZE = 1
)(
    input                     clk,
    input                     rst,
    input                     start,
    output reg         [3:0]  input_addra, 
    input  wire signed [15:0] idata_0, idata_1, idata_2, idata_3, idata_4, idata_5, idata_6, idata_7, idata_8, idata_9, idata_10, idata_11, idata_12, idata_13, idata_14, idata_15, idata_16, idata_17, idata_18, idata_19,  idata_20,
    output wire signed [15:0] odata_0, odata_1, odata_2, odata_3, odata_4, odata_5, odata_6, odata_7, odata_8, odata_9, odata_10, odata_11, odata_12, odata_13, odata_14, odata_15, odata_16, odata_17, odata_18, odata_19,  odata_20,
    output reg         [1:0]  output_addra,
    output wire               done
);

    /*** variable ***/

    wire all_rst;
    
    /*** input_buffer ***/

    reg [2:0] input_buffer_delay;

    wire input_buffer_start    [0:20];
    wire input_buffer_done     [0:20];
    wire input_buffer_all_done;

    wire signed [15:0] x [0:9][0:20];
    
    fusionCAP_input_buffer fusionCAP_input_buffer0(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[0]  && input_buffer_delay==2), .idata(idata_0),  .x0(x[0][0]),  .x1(x[1][0]),  .x2(x[2][0]),  .x3(x[3][0]),  .x4(x[4][0]),  .x5(x[5][0]),  .x6(x[6][0]),  .x7(x[7][0]),  .x8(x[8][0]),  .x9(x[9][0]),  .done(input_buffer_done[0]));
    fusionCAP_input_buffer fusionCAP_input_buffer1(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[1]  && input_buffer_delay==2), .idata(idata_1),  .x0(x[0][1]),  .x1(x[1][1]),  .x2(x[2][1]),  .x3(x[3][1]),  .x4(x[4][1]),  .x5(x[5][1]),  .x6(x[6][1]),  .x7(x[7][1]),  .x8(x[8][1]),  .x9(x[9][1]),  .done(input_buffer_done[1]));
    fusionCAP_input_buffer fusionCAP_input_buffer2(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[2]  && input_buffer_delay==2), .idata(idata_2),  .x0(x[0][2]),  .x1(x[1][2]),  .x2(x[2][2]),  .x3(x[3][2]),  .x4(x[4][2]),  .x5(x[5][2]),  .x6(x[6][2]),  .x7(x[7][2]),  .x8(x[8][2]),  .x9(x[9][2]),  .done(input_buffer_done[2]));
    fusionCAP_input_buffer fusionCAP_input_buffer3(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[3]  && input_buffer_delay==2), .idata(idata_3),  .x0(x[0][3]),  .x1(x[1][3]),  .x2(x[2][3]),  .x3(x[3][3]),  .x4(x[4][3]),  .x5(x[5][3]),  .x6(x[6][3]),  .x7(x[7][3]),  .x8(x[8][3]),  .x9(x[9][3]),  .done(input_buffer_done[3]));
    fusionCAP_input_buffer fusionCAP_input_buffer4(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[4]  && input_buffer_delay==2), .idata(idata_4),  .x0(x[0][4]),  .x1(x[1][4]),  .x2(x[2][4]),  .x3(x[3][4]),  .x4(x[4][4]),  .x5(x[5][4]),  .x6(x[6][4]),  .x7(x[7][4]),  .x8(x[8][4]),  .x9(x[9][4]),  .done(input_buffer_done[4]));
    fusionCAP_input_buffer fusionCAP_input_buffer5(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[5]  && input_buffer_delay==2), .idata(idata_5),  .x0(x[0][5]),  .x1(x[1][5]),  .x2(x[2][5]),  .x3(x[3][5]),  .x4(x[4][5]),  .x5(x[5][5]),  .x6(x[6][5]),  .x7(x[7][5]),  .x8(x[8][5]),  .x9(x[9][5]),  .done(input_buffer_done[5]));
    fusionCAP_input_buffer fusionCAP_input_buffer6(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[6]  && input_buffer_delay==2), .idata(idata_6),  .x0(x[0][6]),  .x1(x[1][6]),  .x2(x[2][6]),  .x3(x[3][6]),  .x4(x[4][6]),  .x5(x[5][6]),  .x6(x[6][6]),  .x7(x[7][6]),  .x8(x[8][6]),  .x9(x[9][6]),  .done(input_buffer_done[6]));
    fusionCAP_input_buffer fusionCAP_input_buffer7(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[7]  && input_buffer_delay==2), .idata(idata_7),  .x0(x[0][7]),  .x1(x[1][7]),  .x2(x[2][7]),  .x3(x[3][7]),  .x4(x[4][7]),  .x5(x[5][7]),  .x6(x[6][7]),  .x7(x[7][7]),  .x8(x[8][7]),  .x9(x[9][7]),  .done(input_buffer_done[7]));
    fusionCAP_input_buffer fusionCAP_input_buffer8(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[8]  && input_buffer_delay==2), .idata(idata_8),  .x0(x[0][8]),  .x1(x[1][8]),  .x2(x[2][8]),  .x3(x[3][8]),  .x4(x[4][8]),  .x5(x[5][8]),  .x6(x[6][8]),  .x7(x[7][8]),  .x8(x[8][8]),  .x9(x[9][8]),  .done(input_buffer_done[8]));
    fusionCAP_input_buffer fusionCAP_input_buffer9(.clk(clk),  .rst(rst || all_rst), .start(input_buffer_start[9]  && input_buffer_delay==2), .idata(idata_9),  .x0(x[0][9]),  .x1(x[1][9]),  .x2(x[2][9]),  .x3(x[3][9]),  .x4(x[4][9]),  .x5(x[5][9]),  .x6(x[6][9]),  .x7(x[7][9]),  .x8(x[8][9]),  .x9(x[9][9]),  .done(input_buffer_done[9]));
    fusionCAP_input_buffer fusionCAP_input_buffer10(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[10] && input_buffer_delay==2), .idata(idata_10), .x0(x[0][10]), .x1(x[1][10]), .x2(x[2][10]), .x3(x[3][10]), .x4(x[4][10]), .x5(x[5][10]), .x6(x[6][10]), .x7(x[7][10]), .x8(x[8][10]), .x9(x[9][10]), .done(input_buffer_done[10]));
    fusionCAP_input_buffer fusionCAP_input_buffer11(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[11] && input_buffer_delay==2), .idata(idata_11), .x0(x[0][11]), .x1(x[1][11]), .x2(x[2][11]), .x3(x[3][11]), .x4(x[4][11]), .x5(x[5][11]), .x6(x[6][11]), .x7(x[7][11]), .x8(x[8][11]), .x9(x[9][11]), .done(input_buffer_done[11]));
    fusionCAP_input_buffer fusionCAP_input_buffer12(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[12] && input_buffer_delay==2), .idata(idata_12), .x0(x[0][12]), .x1(x[1][12]), .x2(x[2][12]), .x3(x[3][12]), .x4(x[4][12]), .x5(x[5][12]), .x6(x[6][12]), .x7(x[7][12]), .x8(x[8][12]), .x9(x[9][12]), .done(input_buffer_done[12]));
    fusionCAP_input_buffer fusionCAP_input_buffer13(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[13] && input_buffer_delay==2), .idata(idata_13), .x0(x[0][13]), .x1(x[1][13]), .x2(x[2][13]), .x3(x[3][13]), .x4(x[4][13]), .x5(x[5][13]), .x6(x[6][13]), .x7(x[7][13]), .x8(x[8][13]), .x9(x[9][13]), .done(input_buffer_done[13]));
    fusionCAP_input_buffer fusionCAP_input_buffer14(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[14] && input_buffer_delay==2), .idata(idata_14), .x0(x[0][14]), .x1(x[1][14]), .x2(x[2][14]), .x3(x[3][14]), .x4(x[4][14]), .x5(x[5][14]), .x6(x[6][14]), .x7(x[7][14]), .x8(x[8][14]), .x9(x[9][14]), .done(input_buffer_done[14]));
    fusionCAP_input_buffer fusionCAP_input_buffer15(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[15] && input_buffer_delay==2), .idata(idata_15), .x0(x[0][15]), .x1(x[1][15]), .x2(x[2][15]), .x3(x[3][15]), .x4(x[4][15]), .x5(x[5][15]), .x6(x[6][15]), .x7(x[7][15]), .x8(x[8][15]), .x9(x[9][15]), .done(input_buffer_done[15]));
    fusionCAP_input_buffer fusionCAP_input_buffer16(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[16] && input_buffer_delay==2), .idata(idata_16), .x0(x[0][16]), .x1(x[1][16]), .x2(x[2][16]), .x3(x[3][16]), .x4(x[4][16]), .x5(x[5][16]), .x6(x[6][16]), .x7(x[7][16]), .x8(x[8][16]), .x9(x[9][16]), .done(input_buffer_done[16]));
    fusionCAP_input_buffer fusionCAP_input_buffer17(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[17] && input_buffer_delay==2), .idata(idata_17), .x0(x[0][17]), .x1(x[1][17]), .x2(x[2][17]), .x3(x[3][17]), .x4(x[4][17]), .x5(x[5][17]), .x6(x[6][17]), .x7(x[7][17]), .x8(x[8][17]), .x9(x[9][17]), .done(input_buffer_done[17]));
    fusionCAP_input_buffer fusionCAP_input_buffer18(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[18] && input_buffer_delay==2), .idata(idata_18), .x0(x[0][18]), .x1(x[1][18]), .x2(x[2][18]), .x3(x[3][18]), .x4(x[4][18]), .x5(x[5][18]), .x6(x[6][18]), .x7(x[7][18]), .x8(x[8][18]), .x9(x[9][18]), .done(input_buffer_done[18]));
    fusionCAP_input_buffer fusionCAP_input_buffer19(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[19] && input_buffer_delay==2), .idata(idata_19), .x0(x[0][19]), .x1(x[1][19]), .x2(x[2][19]), .x3(x[3][19]), .x4(x[4][19]), .x5(x[5][19]), .x6(x[6][19]), .x7(x[7][19]), .x8(x[8][19]), .x9(x[9][19]), .done(input_buffer_done[19]));
    fusionCAP_input_buffer fusionCAP_input_buffer20(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start[20] && input_buffer_delay==2), .idata(idata_20), .x0(x[0][20]), .x1(x[1][20]), .x2(x[2][20]), .x3(x[3][20]), .x4(x[4][20]), .x5(x[5][20]), .x6(x[6][20]), .x7(x[7][20]), .x8(x[8][20]), .x9(x[9][20]), .done(input_buffer_done[20]));
    
    assign input_buffer_start[0]  = start;
    assign input_buffer_start[1]  = start;
    assign input_buffer_start[2]  = start;
    assign input_buffer_start[3]  = start;
    assign input_buffer_start[4]  = start;
    assign input_buffer_start[5]  = start;
    assign input_buffer_start[6]  = start;
    assign input_buffer_start[7]  = start;
    assign input_buffer_start[8]  = start;
    assign input_buffer_start[9]  = start;
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
    
    /*** processing element***/

    wire pe_start [0:20];
    wire pe_done  [0:20];
    wire pe_all_down;

    wire signed [15:0] pe_odata [0:20];

    fusionCAP_processing_element fusionCAP_processing_element_0 (.clk(clk), .rst(rst || all_rst), .start(pe_start[0]),  .x0(x[0][0]),  .x1(x[1][0]),  .x2(x[2][0]),  .x3(x[3][0]),  .x4(x[4][0]),  .x5(x[5][0]),  .x6(x[6][0]),  .x7(x[7][0]),  .x8(x[8][0]),  .x9(x[9][0]),  .odata(odata_0),  .done(pe_done[0]));
    fusionCAP_processing_element fusionCAP_processing_element_1 (.clk(clk), .rst(rst || all_rst), .start(pe_start[1]),  .x0(x[0][1]),  .x1(x[1][1]),  .x2(x[2][1]),  .x3(x[3][1]),  .x4(x[4][1]),  .x5(x[5][1]),  .x6(x[6][1]),  .x7(x[7][1]),  .x8(x[8][1]),  .x9(x[9][1]),  .odata(odata_1),  .done(pe_done[1]));
    fusionCAP_processing_element fusionCAP_processing_element_2 (.clk(clk), .rst(rst || all_rst), .start(pe_start[2]),  .x0(x[0][2]),  .x1(x[1][2]),  .x2(x[2][2]),  .x3(x[3][2]),  .x4(x[4][2]),  .x5(x[5][2]),  .x6(x[6][2]),  .x7(x[7][2]),  .x8(x[8][2]),  .x9(x[9][2]),  .odata(odata_2),  .done(pe_done[2]));
    fusionCAP_processing_element fusionCAP_processing_element_3 (.clk(clk), .rst(rst || all_rst), .start(pe_start[3]),  .x0(x[0][3]),  .x1(x[1][3]),  .x2(x[2][3]),  .x3(x[3][3]),  .x4(x[4][3]),  .x5(x[5][3]),  .x6(x[6][3]),  .x7(x[7][3]),  .x8(x[8][3]),  .x9(x[9][3]),  .odata(odata_3),  .done(pe_done[3]));
    fusionCAP_processing_element fusionCAP_processing_element_4 (.clk(clk), .rst(rst || all_rst), .start(pe_start[4]),  .x0(x[0][4]),  .x1(x[1][4]),  .x2(x[2][4]),  .x3(x[3][4]),  .x4(x[4][4]),  .x5(x[5][4]),  .x6(x[6][4]),  .x7(x[7][4]),  .x8(x[8][4]),  .x9(x[9][4]),  .odata(odata_4),  .done(pe_done[4]));
    fusionCAP_processing_element fusionCAP_processing_element_5 (.clk(clk), .rst(rst || all_rst), .start(pe_start[5]),  .x0(x[0][5]),  .x1(x[1][5]),  .x2(x[2][5]),  .x3(x[3][5]),  .x4(x[4][5]),  .x5(x[5][5]),  .x6(x[6][5]),  .x7(x[7][5]),  .x8(x[8][5]),  .x9(x[9][5]),  .odata(odata_5),  .done(pe_done[5]));
    fusionCAP_processing_element fusionCAP_processing_element_6 (.clk(clk), .rst(rst || all_rst), .start(pe_start[6]),  .x0(x[0][6]),  .x1(x[1][6]),  .x2(x[2][6]),  .x3(x[3][6]),  .x4(x[4][6]),  .x5(x[5][6]),  .x6(x[6][6]),  .x7(x[7][6]),  .x8(x[8][6]),  .x9(x[9][6]),  .odata(odata_6),  .done(pe_done[6]));
    fusionCAP_processing_element fusionCAP_processing_element_7 (.clk(clk), .rst(rst || all_rst), .start(pe_start[7]),  .x0(x[0][7]),  .x1(x[1][7]),  .x2(x[2][7]),  .x3(x[3][7]),  .x4(x[4][7]),  .x5(x[5][7]),  .x6(x[6][7]),  .x7(x[7][7]),  .x8(x[8][7]),  .x9(x[9][7]),  .odata(odata_7),  .done(pe_done[7]));
    fusionCAP_processing_element fusionCAP_processing_element_8 (.clk(clk), .rst(rst || all_rst), .start(pe_start[8]),  .x0(x[0][8]),  .x1(x[1][8]),  .x2(x[2][8]),  .x3(x[3][8]),  .x4(x[4][8]),  .x5(x[5][8]),  .x6(x[6][8]),  .x7(x[7][8]),  .x8(x[8][8]),  .x9(x[9][8]),  .odata(odata_8),  .done(pe_done[8]));
    fusionCAP_processing_element fusionCAP_processing_element_9 (.clk(clk), .rst(rst || all_rst), .start(pe_start[9]),  .x0(x[0][9]),  .x1(x[1][9]),  .x2(x[2][9]),  .x3(x[3][9]),  .x4(x[4][9]),  .x5(x[5][9]),  .x6(x[6][9]),  .x7(x[7][9]),  .x8(x[8][9]),  .x9(x[9][9]),  .odata(odata_9),  .done(pe_done[9]));
    fusionCAP_processing_element fusionCAP_processing_element_10(.clk(clk), .rst(rst || all_rst), .start(pe_start[10]), .x0(x[0][10]), .x1(x[1][10]), .x2(x[2][10]), .x3(x[3][10]), .x4(x[4][10]), .x5(x[5][10]), .x6(x[6][10]), .x7(x[7][10]), .x8(x[8][10]), .x9(x[9][10]), .odata(odata_10), .done(pe_done[10]));
    fusionCAP_processing_element fusionCAP_processing_element_11(.clk(clk), .rst(rst || all_rst), .start(pe_start[11]), .x0(x[0][11]), .x1(x[1][11]), .x2(x[2][11]), .x3(x[3][11]), .x4(x[4][11]), .x5(x[5][11]), .x6(x[6][11]), .x7(x[7][11]), .x8(x[8][11]), .x9(x[9][11]), .odata(odata_11), .done(pe_done[11]));
    fusionCAP_processing_element fusionCAP_processing_element_12(.clk(clk), .rst(rst || all_rst), .start(pe_start[12]), .x0(x[0][12]), .x1(x[1][12]), .x2(x[2][12]), .x3(x[3][12]), .x4(x[4][12]), .x5(x[5][12]), .x6(x[6][12]), .x7(x[7][12]), .x8(x[8][12]), .x9(x[9][12]), .odata(odata_12), .done(pe_done[12]));
    fusionCAP_processing_element fusionCAP_processing_element_13(.clk(clk), .rst(rst || all_rst), .start(pe_start[13]), .x0(x[0][13]), .x1(x[1][13]), .x2(x[2][13]), .x3(x[3][13]), .x4(x[4][13]), .x5(x[5][13]), .x6(x[6][13]), .x7(x[7][13]), .x8(x[8][13]), .x9(x[9][13]), .odata(odata_13), .done(pe_done[13]));
    fusionCAP_processing_element fusionCAP_processing_element_14(.clk(clk), .rst(rst || all_rst), .start(pe_start[14]), .x0(x[0][14]), .x1(x[1][14]), .x2(x[2][14]), .x3(x[3][14]), .x4(x[4][14]), .x5(x[5][14]), .x6(x[6][14]), .x7(x[7][14]), .x8(x[8][14]), .x9(x[9][14]), .odata(odata_14), .done(pe_done[14]));
    fusionCAP_processing_element fusionCAP_processing_element_15(.clk(clk), .rst(rst || all_rst), .start(pe_start[15]), .x0(x[0][15]), .x1(x[1][15]), .x2(x[2][15]), .x3(x[3][15]), .x4(x[4][15]), .x5(x[5][15]), .x6(x[6][15]), .x7(x[7][15]), .x8(x[8][15]), .x9(x[9][15]), .odata(odata_15), .done(pe_done[15]));
    fusionCAP_processing_element fusionCAP_processing_element_16(.clk(clk), .rst(rst || all_rst), .start(pe_start[16]), .x0(x[0][16]), .x1(x[1][16]), .x2(x[2][16]), .x3(x[3][16]), .x4(x[4][16]), .x5(x[5][16]), .x6(x[6][16]), .x7(x[7][16]), .x8(x[8][16]), .x9(x[9][16]), .odata(odata_16), .done(pe_done[16]));
    fusionCAP_processing_element fusionCAP_processing_element_17(.clk(clk), .rst(rst || all_rst), .start(pe_start[17]), .x0(x[0][17]), .x1(x[1][17]), .x2(x[2][17]), .x3(x[3][17]), .x4(x[4][17]), .x5(x[5][17]), .x6(x[6][17]), .x7(x[7][17]), .x8(x[8][17]), .x9(x[9][17]), .odata(odata_17), .done(pe_done[17]));
    fusionCAP_processing_element fusionCAP_processing_element_18(.clk(clk), .rst(rst || all_rst), .start(pe_start[18]), .x0(x[0][18]), .x1(x[1][18]), .x2(x[2][18]), .x3(x[3][18]), .x4(x[4][18]), .x5(x[5][18]), .x6(x[6][18]), .x7(x[7][18]), .x8(x[8][18]), .x9(x[9][18]), .odata(odata_18), .done(pe_done[18]));
    fusionCAP_processing_element fusionCAP_processing_element_19(.clk(clk), .rst(rst || all_rst), .start(pe_start[19]), .x0(x[0][19]), .x1(x[1][19]), .x2(x[2][19]), .x3(x[3][19]), .x4(x[4][19]), .x5(x[5][19]), .x6(x[6][19]), .x7(x[7][19]), .x8(x[8][19]), .x9(x[9][19]), .odata(odata_19), .done(pe_done[19]));
    fusionCAP_processing_element fusionCAP_processing_element_20(.clk(clk), .rst(rst || all_rst), .start(pe_start[20]), .x0(x[0][20]), .x1(x[1][20]), .x2(x[2][20]), .x3(x[3][20]), .x4(x[4][20]), .x5(x[5][20]), .x6(x[6][20]), .x7(x[7][20]), .x8(x[8][20]), .x9(x[9][20]), .odata(odata_20), .done(pe_done[20]));

    assign pe_start[0]  = input_buffer_done[0];
    assign pe_start[1]  = input_buffer_done[1];
    assign pe_start[2]  = input_buffer_done[2];
    assign pe_start[3]  = input_buffer_done[3];
    assign pe_start[4]  = input_buffer_done[4];
    assign pe_start[5]  = input_buffer_done[5];
    assign pe_start[6]  = input_buffer_done[6];
    assign pe_start[7]  = input_buffer_done[7];
    assign pe_start[8]  = input_buffer_done[8];
    assign pe_start[9]  = input_buffer_done[9];
    assign pe_start[10] = input_buffer_done[10];
    assign pe_start[11] = input_buffer_done[11];
    assign pe_start[12] = input_buffer_done[12];
    assign pe_start[13] = input_buffer_done[13];
    assign pe_start[14] = input_buffer_done[14];
    assign pe_start[15] = input_buffer_done[15];
    assign pe_start[16] = input_buffer_done[16];
    assign pe_start[17] = input_buffer_done[17];
    assign pe_start[18] = input_buffer_done[18];
    assign pe_start[19] = input_buffer_done[19];
    assign pe_start[20] = input_buffer_done[20];

    assign pe_all_done = pe_done[0] && pe_done[1] && pe_done[2] && pe_done[3] && pe_done[4] && pe_done[5] && pe_done[6] && pe_done[7] && pe_done[8] && pe_done[9] && pe_done[10] && pe_done[11] && pe_done[12] && pe_done[13] && pe_done[14] && pe_done[15] && pe_done[16] && pe_done[17] && pe_done[18] && pe_done[19] && pe_done[20]; 
    
    /***** controll unit *****/

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
                input_addra <= input_addra + 1;
            end else begin
                input_addra <= input_addra;
            end
        end
    end

    /*** output_addra ***/
    always @(posedge clk) begin
        if(rst) begin
            output_addra <= 0;
        end else if(pe_all_done) begin
            if(output_addra != CONV_OUTPUT_SIZE) begin
                output_addra <= output_addra + 1;
            end else begin
                output_addra <= output_addra;
            end
        end
    end

    /*** done ***/ 
    //assign all_rst = (output_addra == CONV_OUTPUT_SIZE - 1)? 1 : 0;
    assign all_rst = (pe_all_done)? 1 : 0;
    assign done    = (output_addra == CONV_OUTPUT_SIZE)? 1 : 0;
endmodule