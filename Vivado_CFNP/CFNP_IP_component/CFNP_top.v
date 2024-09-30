`timescale 1ns / 1ps
    
module CFNP_top(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    output wire signed [15:0] odata,
    output wire               done
    
    /*** input data ***/
    /*
    input  wire signed [15:0] idata,
    input  wire        [ 4:0] idata_addra
    */
    
    /*** Test conv1_top ***/ 
    /*
    output        conv1_rst,
    output        conv1_start,
    output [ 4:0] conv1_input_addra,
    output [15:0] conv1_idata,
    output [15:0] conv1_odata,
    output [ 4:0] conv1_output_filter,
    output [ 4:0] conv1_output_addra,
    output        conv1_done,
    */
    
    /*** Test conv2_bn_top ***/
    /*
    output        conv2_bn_rst,
    output        conv2_bn_start,
    output [ 4:0] conv2_bn_input_addra,
    output [15:0] conv2_bn_odata,
    output [ 4:0] conv2_bn_output_addra,
    output [ 3:0] conv2_bn_output_filter,
    output        conv2_bn_done 
    */
    
    /*** Test fusionCAP ***/
    /*
    output        fusionCAP_rst,
    output        fusionCAP_start,
    output [ 3:0] fusionCAP_input_addra,
    output [15:0] fusionCAP_odata_0, fusionCAP_odata_1, fusionCAP_odata_2, fusionCAP_odata_3, fusionCAP_odata_4, fusionCAP_odata_5, fusionCAP_odata_6, fusionCAP_odata_7, fusionCAP_odata_8, fusionCAP_odata_9, fusionCAP_odata_10, fusionCAP_odata_11, fusionCAP_odata_12, fusionCAP_odata_13, fusionCAP_odata_14, fusionCAP_odata_15, fusionCAP_odata_16, fusionCAP_odata_17, fusionCAP_odata_18, fusionCAP_odata_19, fusionCAP_odata_20,
    output [ 1:0] fusionCAP_output_addra,
    output        fusionCAP_done,
    */
    
    /*** Test fuzzy_rule ***/
    /*
    output        fuzzy_rule_rst,
    output        fuzzy_rule_start,
    output [15:0] fuzzy_rule_odata,
    output [ 2:0] fuzzy_rule_output_filter,
    output        fuzzy_rule_done,
    */
    
    /*** Test defuzzy ***/
    /*
    output        defuzzy_rst,
    output        defuzzy_start,
    output [ 2:0] defuzzy_input_addra,
    output [15:0] defuzzy_odata,
    output        defuzzy_done
    */
);
    /*========== BRAM ==========*/
    /*** input feature BRAM ***/    
    wire               input_feature_bram_ena;
    wire               input_feature_bram_wea;
    wire        [ 4:0] input_feature_bram_addra;
    wire signed [15:0] input_feature_bram_dina;
    wire signed [15:0] input_feature_bram_douta; 
    
    /*** conv1 feature BRAM ***/    
    wire               conv1_feature_bram_ena   [0:19];
    wire               conv1_feature_bram_wea   [0:19];
    wire        [ 4:0] conv1_feature_bram_addra;
    wire signed [15:0] conv1_feature_bram_dina;
    wire signed [15:0] conv1_feature_bram_douta [0:19]; 
    
    /*** conv2_bn feature BRAM ***/    
    wire               conv2_bn_feature_bram_ena    [0:20];
    wire               conv2_bn_feature_bram_wea    [0:20];
    wire        [ 3:0] conv2_bn_feature_bram_addra  [0:20];
    wire signed [15:0] conv2_bn_feature_bram_dina   [0:20];
    wire signed [15:0] conv2_bn_feature_bram_douta  [0:20]; 
    
    /*** fusionCAP feature BRAM ***/    
    wire               fusionCAP_feature_bram_ena   [0:20];
    wire               fusionCAP_feature_bram_wea   [0:20];
    wire        [ 1:0] fusionCAP_feature_bram_addra [0:20];
    wire signed [15:0] fusionCAP_feature_bram_dina  [0:20];
    wire signed [15:0] fusionCAP_feature_bram_douta [0:20]; 
    
    /*** fuzzy_rule feature BRAM ***/    
    wire               fuzzy_rule_feature_bram_ena;
    wire               fuzzy_rule_feature_bram_wea;
    wire        [ 2:0] fuzzy_rule_feature_bram_addra;
    wire signed [15:0] fuzzy_rule_feature_bram_dina;
    wire signed [15:0] fuzzy_rule_feature_bram_douta; 
    
    
    /*========== CFNP IP component ==========*/
    /*** conv1 ***/
    wire               conv1_rst;
    wire               conv1_start;
    wire        [ 4:0] conv1_input_addra;
    wire signed [15:0] conv1_idata;
    wire signed [15:0] conv1_odata;
    wire        [ 4:0] conv1_output_filter;
    wire        [ 4:0] conv1_output_addra;
    wire               conv1_done;
    
    /*** conv2 ***/
    wire               conv2_bn_rst;
    wire               conv2_bn_start;
    wire        [ 4:0] conv2_bn_input_addra;
    wire signed [15:0] conv2_bn_idata           [0:19];
    wire signed [15:0] conv2_bn_odata;
    wire        [ 4:0] conv2_bn_output_addra;
    wire        [ 3:0] conv2_bn_output_filter;
    wire               conv2_bn_done;
    
    /*** fusionCAP ***/
    wire               fusionCAP_rst;
    wire               fusionCAP_start;
    wire        [ 3:0] fusionCAP_input_addra;
    wire signed [15:0] fusionCAP_idata          [0:20];
    wire signed [15:0] fusionCAP_odata          [0:20];
    wire        [ 3:0] fusionCAP_output_addra;
    wire               fusionCAP_done;
    
    /*** fuzzy_rule ***/
    wire               fuzzy_rule_rst;
    wire               fuzzy_rule_start;
    wire signed [15:0] fuzzy_rule_idata [0:20];
    wire signed [15:0] fuzzy_rule_odata;
    wire        [ 2:0] fuzzy_rule_output_filter;
    wire               fuzzy_rule_done;
    
    /*** defuzzy ***/
    wire               defuzzy_rst;
    wire               defuzzy_start;
    wire signed [ 2:0] defuzzy_input_addra;
    wire signed [15:0] defuzzy_idata;
    wire signed [15:0] defuzzy_odata;
    wire               defuzzy_done;
    
    
    /*========== Start work ==========*/
    /*** input feature BRAM ***/
    input_feature_bram input_feature_bram_0(.clka(clk), .ena(input_feature_bram_ena), .wea(input_feature_bram_wea), .addra(input_feature_bram_addra), .dina(input_feature_bram_dina), .douta(input_feature_bram_douta));

    assign input_feature_bram_ena   = start; 
    assign input_feature_bram_wea   = 0;
    assign input_feature_bram_addra = conv1_input_addra;
    assign input_feature_bram_dina  = 0;
    

    /*** conv1 layer ***/
    conv1_top conv1_top1(
        .clk          (clk),
        .rst          (conv1_rst),
        .start        (conv1_start),
        .input_addra  (conv1_input_addra),
        .idata        (conv1_idata), 
        .odata        (conv1_odata), 
        .output_filter(conv1_output_filter),
        .output_addra (conv1_output_addra),
        .done         (conv1_done)
    );
    
    assign conv1_rst   = rst;
    assign conv1_start = start;
    assign conv1_idata = input_feature_bram_douta;
    
    /*** conv1 feature BRAM ***/
    conv1_feature_bram conv1_feature_bram_0 (.clka(clk), .ena(conv1_feature_bram_ena[ 0]), .wea(conv1_feature_bram_wea[ 0]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 0]));
    conv1_feature_bram conv1_feature_bram_1 (.clka(clk), .ena(conv1_feature_bram_ena[ 1]), .wea(conv1_feature_bram_wea[ 1]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 1]));
    conv1_feature_bram conv1_feature_bram_2 (.clka(clk), .ena(conv1_feature_bram_ena[ 2]), .wea(conv1_feature_bram_wea[ 2]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 2]));
    conv1_feature_bram conv1_feature_bram_3 (.clka(clk), .ena(conv1_feature_bram_ena[ 3]), .wea(conv1_feature_bram_wea[ 3]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 3]));
    conv1_feature_bram conv1_feature_bram_4 (.clka(clk), .ena(conv1_feature_bram_ena[ 4]), .wea(conv1_feature_bram_wea[ 4]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 4]));
    conv1_feature_bram conv1_feature_bram_5 (.clka(clk), .ena(conv1_feature_bram_ena[ 5]), .wea(conv1_feature_bram_wea[ 5]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 5]));
    conv1_feature_bram conv1_feature_bram_6 (.clka(clk), .ena(conv1_feature_bram_ena[ 6]), .wea(conv1_feature_bram_wea[ 6]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 6]));
    conv1_feature_bram conv1_feature_bram_7 (.clka(clk), .ena(conv1_feature_bram_ena[ 7]), .wea(conv1_feature_bram_wea[ 7]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 7]));
    conv1_feature_bram conv1_feature_bram_8 (.clka(clk), .ena(conv1_feature_bram_ena[ 8]), .wea(conv1_feature_bram_wea[ 8]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 8]));
    conv1_feature_bram conv1_feature_bram_9 (.clka(clk), .ena(conv1_feature_bram_ena[ 9]), .wea(conv1_feature_bram_wea[ 9]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[ 9]));
    conv1_feature_bram conv1_feature_bram_10(.clka(clk), .ena(conv1_feature_bram_ena[10]), .wea(conv1_feature_bram_wea[10]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[10]));
    conv1_feature_bram conv1_feature_bram_11(.clka(clk), .ena(conv1_feature_bram_ena[11]), .wea(conv1_feature_bram_wea[11]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[11]));
    conv1_feature_bram conv1_feature_bram_12(.clka(clk), .ena(conv1_feature_bram_ena[12]), .wea(conv1_feature_bram_wea[12]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[12]));
    conv1_feature_bram conv1_feature_bram_13(.clka(clk), .ena(conv1_feature_bram_ena[13]), .wea(conv1_feature_bram_wea[13]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[13]));
    conv1_feature_bram conv1_feature_bram_14(.clka(clk), .ena(conv1_feature_bram_ena[14]), .wea(conv1_feature_bram_wea[14]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[14]));
    conv1_feature_bram conv1_feature_bram_15(.clka(clk), .ena(conv1_feature_bram_ena[15]), .wea(conv1_feature_bram_wea[15]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[15]));
    conv1_feature_bram conv1_feature_bram_16(.clka(clk), .ena(conv1_feature_bram_ena[16]), .wea(conv1_feature_bram_wea[16]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[16]));
    conv1_feature_bram conv1_feature_bram_17(.clka(clk), .ena(conv1_feature_bram_ena[17]), .wea(conv1_feature_bram_wea[17]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[17]));
    conv1_feature_bram conv1_feature_bram_18(.clka(clk), .ena(conv1_feature_bram_ena[18]), .wea(conv1_feature_bram_wea[18]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[18]));
    conv1_feature_bram conv1_feature_bram_19(.clka(clk), .ena(conv1_feature_bram_ena[19]), .wea(conv1_feature_bram_wea[19]), .addra(conv1_feature_bram_addra), .dina(conv1_feature_bram_dina), .douta(conv1_feature_bram_douta[19]));
            
    assign conv1_feature_bram_ena[ 0] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 1] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 2] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 3] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 4] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 5] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 6] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 7] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 8] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[ 9] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[10] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[11] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[12] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[13] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[14] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[15] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[16] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[17] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[18] = (~conv1_done) || (~conv2_bn_done);
    assign conv1_feature_bram_ena[19] = (~conv1_done) || (~conv2_bn_done);
    
    assign conv1_feature_bram_wea[ 0] = (~conv1_done) && conv1_output_filter == 0;
    assign conv1_feature_bram_wea[ 1] = (~conv1_done) && conv1_output_filter == 1;
    assign conv1_feature_bram_wea[ 2] = (~conv1_done) && conv1_output_filter == 2;
    assign conv1_feature_bram_wea[ 3] = (~conv1_done) && conv1_output_filter == 3;
    assign conv1_feature_bram_wea[ 4] = (~conv1_done) && conv1_output_filter == 4;
    assign conv1_feature_bram_wea[ 5] = (~conv1_done) && conv1_output_filter == 5;
    assign conv1_feature_bram_wea[ 6] = (~conv1_done) && conv1_output_filter == 6;
    assign conv1_feature_bram_wea[ 7] = (~conv1_done) && conv1_output_filter == 7;
    assign conv1_feature_bram_wea[ 8] = (~conv1_done) && conv1_output_filter == 8;
    assign conv1_feature_bram_wea[ 9] = (~conv1_done) && conv1_output_filter == 9;
    assign conv1_feature_bram_wea[10] = (~conv1_done) && conv1_output_filter == 10;
    assign conv1_feature_bram_wea[11] = (~conv1_done) && conv1_output_filter == 11;
    assign conv1_feature_bram_wea[12] = (~conv1_done) && conv1_output_filter == 12;
    assign conv1_feature_bram_wea[13] = (~conv1_done) && conv1_output_filter == 13;
    assign conv1_feature_bram_wea[14] = (~conv1_done) && conv1_output_filter == 14;
    assign conv1_feature_bram_wea[15] = (~conv1_done) && conv1_output_filter == 15;
    assign conv1_feature_bram_wea[16] = (~conv1_done) && conv1_output_filter == 16;
    assign conv1_feature_bram_wea[17] = (~conv1_done) && conv1_output_filter == 17;
    assign conv1_feature_bram_wea[18] = (~conv1_done) && conv1_output_filter == 18;
    assign conv1_feature_bram_wea[19] = (~conv1_done) && conv1_output_filter == 19;
    
    assign conv1_feature_bram_addra   = (~conv1_done) ? conv1_output_addra : conv2_bn_input_addra;
    assign conv1_feature_bram_dina    = conv1_odata;
    
    /*** conv2 layer ***/
    
    conv2_bn_top conv2_bn_top_0(
        .clk          (clk),
        .rst          (conv2_bn_rst),
        .start        (conv2_bn_start),
        .input_addra  (conv2_bn_input_addra),
        .idata_0      (conv2_bn_idata[0]), .idata_1(conv2_bn_idata[1]), .idata_2(conv2_bn_idata[2]), .idata_3(conv2_bn_idata[3]), .idata_4(conv2_bn_idata[4]), .idata_5(conv2_bn_idata[5]), .idata_6(conv2_bn_idata[6]), .idata_7(conv2_bn_idata[7]), .idata_8(conv2_bn_idata[8]), .idata_9(conv2_bn_idata[9]), .idata_10(conv2_bn_idata[10]), .idata_11(conv2_bn_idata[11]), .idata_12(conv2_bn_idata[12]), .idata_13(conv2_bn_idata[13]), .idata_14(conv2_bn_idata[14]), .idata_15(conv2_bn_idata[15]), .idata_16(conv2_bn_idata[16]), .idata_17(conv2_bn_idata[17]), .idata_18(conv2_bn_idata[18]), .idata_19(conv2_bn_idata[19]), 
        .odata        (conv2_bn_odata),
        .output_addra (conv2_bn_output_addra),
        .output_filter(conv2_bn_output_filter),
        .done         (conv2_bn_done)
    );
    
    assign conv2_bn_rst       = rst;
    assign conv2_bn_start     = (conv1_done)? 1 : 0;
    assign conv2_bn_idata[ 0] = conv1_feature_bram_douta[ 0];
    assign conv2_bn_idata[ 1] = conv1_feature_bram_douta[ 1];
    assign conv2_bn_idata[ 2] = conv1_feature_bram_douta[ 2];
    assign conv2_bn_idata[ 3] = conv1_feature_bram_douta[ 3];
    assign conv2_bn_idata[ 4] = conv1_feature_bram_douta[ 4];
    assign conv2_bn_idata[ 5] = conv1_feature_bram_douta[ 5];
    assign conv2_bn_idata[ 6] = conv1_feature_bram_douta[ 6];
    assign conv2_bn_idata[ 7] = conv1_feature_bram_douta[ 7];
    assign conv2_bn_idata[ 8] = conv1_feature_bram_douta[ 8];
    assign conv2_bn_idata[ 9] = conv1_feature_bram_douta[ 9];
    assign conv2_bn_idata[10] = conv1_feature_bram_douta[10];
    assign conv2_bn_idata[11] = conv1_feature_bram_douta[11];
    assign conv2_bn_idata[12] = conv1_feature_bram_douta[12];
    assign conv2_bn_idata[13] = conv1_feature_bram_douta[13];
    assign conv2_bn_idata[14] = conv1_feature_bram_douta[14];
    assign conv2_bn_idata[15] = conv1_feature_bram_douta[15];
    assign conv2_bn_idata[16] = conv1_feature_bram_douta[16];
    assign conv2_bn_idata[17] = conv1_feature_bram_douta[17];
    assign conv2_bn_idata[18] = conv1_feature_bram_douta[18];
    assign conv2_bn_idata[19] = conv1_feature_bram_douta[19];
    
    /*** conv2_bn feature BRAM ***/
    conv2_bn_feature_bram conv2_bn_feature_bram_0 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 0]), .wea(conv2_bn_feature_bram_wea[ 0]), .addra(conv2_bn_feature_bram_addra[ 0]), .dina(conv2_bn_feature_bram_dina[ 0]), .douta(conv2_bn_feature_bram_douta[ 0]));
    conv2_bn_feature_bram conv2_bn_feature_bram_1 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 1]), .wea(conv2_bn_feature_bram_wea[ 1]), .addra(conv2_bn_feature_bram_addra[ 1]), .dina(conv2_bn_feature_bram_dina[ 1]), .douta(conv2_bn_feature_bram_douta[ 1]));
    conv2_bn_feature_bram conv2_bn_feature_bram_2 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 2]), .wea(conv2_bn_feature_bram_wea[ 2]), .addra(conv2_bn_feature_bram_addra[ 2]), .dina(conv2_bn_feature_bram_dina[ 2]), .douta(conv2_bn_feature_bram_douta[ 2]));
    conv2_bn_feature_bram conv2_bn_feature_bram_3 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 3]), .wea(conv2_bn_feature_bram_wea[ 3]), .addra(conv2_bn_feature_bram_addra[ 3]), .dina(conv2_bn_feature_bram_dina[ 3]), .douta(conv2_bn_feature_bram_douta[ 3]));
    conv2_bn_feature_bram conv2_bn_feature_bram_4 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 4]), .wea(conv2_bn_feature_bram_wea[ 4]), .addra(conv2_bn_feature_bram_addra[ 4]), .dina(conv2_bn_feature_bram_dina[ 4]), .douta(conv2_bn_feature_bram_douta[ 4]));
    conv2_bn_feature_bram conv2_bn_feature_bram_5 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 5]), .wea(conv2_bn_feature_bram_wea[ 5]), .addra(conv2_bn_feature_bram_addra[ 5]), .dina(conv2_bn_feature_bram_dina[ 5]), .douta(conv2_bn_feature_bram_douta[ 5]));
    conv2_bn_feature_bram conv2_bn_feature_bram_6 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 6]), .wea(conv2_bn_feature_bram_wea[ 6]), .addra(conv2_bn_feature_bram_addra[ 6]), .dina(conv2_bn_feature_bram_dina[ 6]), .douta(conv2_bn_feature_bram_douta[ 6]));
    conv2_bn_feature_bram conv2_bn_feature_bram_7 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 7]), .wea(conv2_bn_feature_bram_wea[ 7]), .addra(conv2_bn_feature_bram_addra[ 7]), .dina(conv2_bn_feature_bram_dina[ 7]), .douta(conv2_bn_feature_bram_douta[ 7]));
    conv2_bn_feature_bram conv2_bn_feature_bram_8 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 8]), .wea(conv2_bn_feature_bram_wea[ 8]), .addra(conv2_bn_feature_bram_addra[ 8]), .dina(conv2_bn_feature_bram_dina[ 8]), .douta(conv2_bn_feature_bram_douta[ 8]));
    conv2_bn_feature_bram conv2_bn_feature_bram_9 (.clka(clk), .ena(conv2_bn_feature_bram_ena[ 9]), .wea(conv2_bn_feature_bram_wea[ 9]), .addra(conv2_bn_feature_bram_addra[ 9]), .dina(conv2_bn_feature_bram_dina[ 9]), .douta(conv2_bn_feature_bram_douta[ 9]));
    conv2_bn_feature_bram conv2_bn_feature_bram_10(.clka(clk), .ena(conv2_bn_feature_bram_ena[10]), .wea(conv2_bn_feature_bram_wea[10]), .addra(conv2_bn_feature_bram_addra[10]), .dina(conv2_bn_feature_bram_dina[10]), .douta(conv2_bn_feature_bram_douta[10]));
    conv2_bn_feature_bram conv2_bn_feature_bram_11(.clka(clk), .ena(conv2_bn_feature_bram_ena[11]), .wea(conv2_bn_feature_bram_wea[11]), .addra(conv2_bn_feature_bram_addra[11]), .dina(conv2_bn_feature_bram_dina[11]), .douta(conv2_bn_feature_bram_douta[11]));
    conv2_bn_feature_bram conv2_bn_feature_bram_12(.clka(clk), .ena(conv2_bn_feature_bram_ena[12]), .wea(conv2_bn_feature_bram_wea[12]), .addra(conv2_bn_feature_bram_addra[12]), .dina(conv2_bn_feature_bram_dina[12]), .douta(conv2_bn_feature_bram_douta[12]));
    conv2_bn_feature_bram conv2_bn_feature_bram_13(.clka(clk), .ena(conv2_bn_feature_bram_ena[13]), .wea(conv2_bn_feature_bram_wea[13]), .addra(conv2_bn_feature_bram_addra[13]), .dina(conv2_bn_feature_bram_dina[13]), .douta(conv2_bn_feature_bram_douta[13]));
    conv2_bn_feature_bram conv2_bn_feature_bram_14(.clka(clk), .ena(conv2_bn_feature_bram_ena[14]), .wea(conv2_bn_feature_bram_wea[14]), .addra(conv2_bn_feature_bram_addra[14]), .dina(conv2_bn_feature_bram_dina[14]), .douta(conv2_bn_feature_bram_douta[14]));
    conv2_bn_feature_bram conv2_bn_feature_bram_15(.clka(clk), .ena(conv2_bn_feature_bram_ena[15]), .wea(conv2_bn_feature_bram_wea[15]), .addra(conv2_bn_feature_bram_addra[15]), .dina(conv2_bn_feature_bram_dina[15]), .douta(conv2_bn_feature_bram_douta[15]));
    conv2_bn_feature_bram conv2_bn_feature_bram_16(.clka(clk), .ena(conv2_bn_feature_bram_ena[16]), .wea(conv2_bn_feature_bram_wea[16]), .addra(conv2_bn_feature_bram_addra[16]), .dina(conv2_bn_feature_bram_dina[16]), .douta(conv2_bn_feature_bram_douta[16]));
    conv2_bn_feature_bram conv2_bn_feature_bram_17(.clka(clk), .ena(conv2_bn_feature_bram_ena[17]), .wea(conv2_bn_feature_bram_wea[17]), .addra(conv2_bn_feature_bram_addra[17]), .dina(conv2_bn_feature_bram_dina[17]), .douta(conv2_bn_feature_bram_douta[17]));
    conv2_bn_feature_bram conv2_bn_feature_bram_18(.clka(clk), .ena(conv2_bn_feature_bram_ena[18]), .wea(conv2_bn_feature_bram_wea[18]), .addra(conv2_bn_feature_bram_addra[18]), .dina(conv2_bn_feature_bram_dina[18]), .douta(conv2_bn_feature_bram_douta[18]));
    conv2_bn_feature_bram conv2_bn_feature_bram_19(.clka(clk), .ena(conv2_bn_feature_bram_ena[19]), .wea(conv2_bn_feature_bram_wea[19]), .addra(conv2_bn_feature_bram_addra[19]), .dina(conv2_bn_feature_bram_dina[19]), .douta(conv2_bn_feature_bram_douta[19]));
    conv2_bn_feature_bram conv2_bn_feature_bram_20(.clka(clk), .ena(conv2_bn_feature_bram_ena[20]), .wea(conv2_bn_feature_bram_wea[20]), .addra(conv2_bn_feature_bram_addra[20]), .dina(conv2_bn_feature_bram_dina[20]), .douta(conv2_bn_feature_bram_douta[20]));
        
    assign conv2_bn_feature_bram_ena[ 0] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 1] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 2] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 3] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 4] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 5] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 6] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 7] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 8] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[ 9] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[10] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[11] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[12] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[13] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[14] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[15] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[16] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[17] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[18] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[19] = (~conv2_bn_done) || (~fusionCAP_done);
    assign conv2_bn_feature_bram_ena[20] = (~conv2_bn_done) || (~fusionCAP_done);
    
    assign conv2_bn_feature_bram_wea[ 0] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd0 );
    assign conv2_bn_feature_bram_wea[ 1] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd1 );
    assign conv2_bn_feature_bram_wea[ 2] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd2 );
    assign conv2_bn_feature_bram_wea[ 3] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd3 );
    assign conv2_bn_feature_bram_wea[ 4] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd4 );
    assign conv2_bn_feature_bram_wea[ 5] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd5 );
    assign conv2_bn_feature_bram_wea[ 6] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd6 );
    assign conv2_bn_feature_bram_wea[ 7] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd7 );
    assign conv2_bn_feature_bram_wea[ 8] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd8 );
    assign conv2_bn_feature_bram_wea[ 9] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd9 );
    assign conv2_bn_feature_bram_wea[10] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd10);
    assign conv2_bn_feature_bram_wea[11] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd11);
    assign conv2_bn_feature_bram_wea[12] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd12);
    assign conv2_bn_feature_bram_wea[13] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd13);
    assign conv2_bn_feature_bram_wea[14] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd14);
    assign conv2_bn_feature_bram_wea[15] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd15);
    assign conv2_bn_feature_bram_wea[16] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd16);
    assign conv2_bn_feature_bram_wea[17] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd17);
    assign conv2_bn_feature_bram_wea[18] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd18);
    assign conv2_bn_feature_bram_wea[19] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd19);
    assign conv2_bn_feature_bram_wea[20] = (~conv2_bn_done) && (conv2_bn_output_addra == 5'd20);
    
    assign conv2_bn_feature_bram_addra[ 0] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 1] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 2] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 3] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 4] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 5] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 6] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 7] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 8] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[ 9] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[10] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[11] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[12] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[13] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[14] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[15] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[16] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[17] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[18] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[19] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    assign conv2_bn_feature_bram_addra[20] = (~conv2_bn_done) ? conv2_bn_output_filter : fusionCAP_input_addra;
    
    assign conv2_bn_feature_bram_dina[ 0] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 1] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 2] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 3] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 4] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 5] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 6] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 7] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 8] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[ 9] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[10] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[11] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[12] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[13] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[14] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[15] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[16] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[17] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[18] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[19] = conv2_bn_odata;
    assign conv2_bn_feature_bram_dina[20] = conv2_bn_odata;
    
    /*** fusionCAP layer ***/
    fusionCAP_top fusionCAP_top0(
        .clk         (clk),
        .rst         (fusionCAP_rst),
        .start       (fusionCAP_start),
        .input_addra (fusionCAP_input_addra),
        .idata_0     (fusionCAP_idata[0]), .idata_1(fusionCAP_idata[1]), .idata_2(fusionCAP_idata[2]), .idata_3(fusionCAP_idata[3]), .idata_4(fusionCAP_idata[4]), .idata_5(fusionCAP_idata[5]), .idata_6(fusionCAP_idata[6]), .idata_7(fusionCAP_idata[7]), .idata_8(fusionCAP_idata[8]), .idata_9(fusionCAP_idata[9]), .idata_10(fusionCAP_idata[10]), .idata_11(fusionCAP_idata[11]), .idata_12(fusionCAP_idata[12]), .idata_13(fusionCAP_idata[13]), .idata_14(fusionCAP_idata[14]), .idata_15(fusionCAP_idata[15]), .idata_16(fusionCAP_idata[16]), .idata_17(fusionCAP_idata[17]), .idata_18(fusionCAP_idata[18]), .idata_19(fusionCAP_idata[19]), .idata_20(fusionCAP_idata[20]), 
        .odata_0     (fusionCAP_odata[0]), .odata_1(fusionCAP_odata[1]), .odata_2(fusionCAP_odata[2]), .odata_3(fusionCAP_odata[3]), .odata_4(fusionCAP_odata[4]), .odata_5(fusionCAP_odata[5]), .odata_6(fusionCAP_odata[6]), .odata_7(fusionCAP_odata[7]), .odata_8(fusionCAP_odata[8]), .odata_9(fusionCAP_odata[9]), .odata_10(fusionCAP_odata[10]), .odata_11(fusionCAP_odata[11]), .odata_12(fusionCAP_odata[12]), .odata_13(fusionCAP_odata[13]), .odata_14(fusionCAP_odata[14]), .odata_15(fusionCAP_odata[15]), .odata_16(fusionCAP_odata[16]), .odata_17(fusionCAP_odata[17]), .odata_18(fusionCAP_odata[18]), .odata_19(fusionCAP_odata[19]), .odata_20(fusionCAP_odata[20]), 
        .output_addra(fusionCAP_output_addra),
        .done        (fusionCAP_done)
    );
    
    assign fusionCAP_rst       = rst;
    assign fusionCAP_start     = (conv2_bn_done)? 1 : 0;
    assign fusionCAP_idata[0 ] = conv2_bn_feature_bram_douta[0 ];
    assign fusionCAP_idata[1 ] = conv2_bn_feature_bram_douta[1 ];
    assign fusionCAP_idata[2 ] = conv2_bn_feature_bram_douta[2 ];
    assign fusionCAP_idata[3 ] = conv2_bn_feature_bram_douta[3 ];
    assign fusionCAP_idata[4 ] = conv2_bn_feature_bram_douta[4 ];
    assign fusionCAP_idata[5 ] = conv2_bn_feature_bram_douta[5 ];
    assign fusionCAP_idata[6 ] = conv2_bn_feature_bram_douta[6 ];
    assign fusionCAP_idata[7 ] = conv2_bn_feature_bram_douta[7 ];
    assign fusionCAP_idata[8 ] = conv2_bn_feature_bram_douta[8 ];
    assign fusionCAP_idata[9 ] = conv2_bn_feature_bram_douta[9 ];
    assign fusionCAP_idata[10] = conv2_bn_feature_bram_douta[10];
    assign fusionCAP_idata[11] = conv2_bn_feature_bram_douta[11];
    assign fusionCAP_idata[12] = conv2_bn_feature_bram_douta[12];
    assign fusionCAP_idata[13] = conv2_bn_feature_bram_douta[13];
    assign fusionCAP_idata[14] = conv2_bn_feature_bram_douta[14];
    assign fusionCAP_idata[15] = conv2_bn_feature_bram_douta[15];
    assign fusionCAP_idata[16] = conv2_bn_feature_bram_douta[16];
    assign fusionCAP_idata[17] = conv2_bn_feature_bram_douta[17];
    assign fusionCAP_idata[18] = conv2_bn_feature_bram_douta[18];
    assign fusionCAP_idata[19] = conv2_bn_feature_bram_douta[19];
    assign fusionCAP_idata[20] = conv2_bn_feature_bram_douta[20];
    
    /*** fusionCAP feature BRAM ***/
    fusionCAP_feature_bram fusionCAP_feature_bram_0 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 0]), .wea(fusionCAP_feature_bram_wea[ 0]),  .addra(fusionCAP_feature_bram_addra[ 0]), .dina(fusionCAP_feature_bram_dina[ 0]), .douta(fusionCAP_feature_bram_douta[ 0]));
    fusionCAP_feature_bram fusionCAP_feature_bram_1 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 1]), .wea(fusionCAP_feature_bram_wea[ 1]),  .addra(fusionCAP_feature_bram_addra[ 1]), .dina(fusionCAP_feature_bram_dina[ 1]), .douta(fusionCAP_feature_bram_douta[ 1]));
    fusionCAP_feature_bram fusionCAP_feature_bram_2 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 2]), .wea(fusionCAP_feature_bram_wea[ 2]),  .addra(fusionCAP_feature_bram_addra[ 2]), .dina(fusionCAP_feature_bram_dina[ 2]), .douta(fusionCAP_feature_bram_douta[ 2]));
    fusionCAP_feature_bram fusionCAP_feature_bram_3 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 3]), .wea(fusionCAP_feature_bram_wea[ 3]),  .addra(fusionCAP_feature_bram_addra[ 3]), .dina(fusionCAP_feature_bram_dina[ 3]), .douta(fusionCAP_feature_bram_douta[ 3]));
    fusionCAP_feature_bram fusionCAP_feature_bram_4 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 4]), .wea(fusionCAP_feature_bram_wea[ 4]),  .addra(fusionCAP_feature_bram_addra[ 4]), .dina(fusionCAP_feature_bram_dina[ 4]), .douta(fusionCAP_feature_bram_douta[ 4]));
    fusionCAP_feature_bram fusionCAP_feature_bram_5 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 5]), .wea(fusionCAP_feature_bram_wea[ 5]),  .addra(fusionCAP_feature_bram_addra[ 5]), .dina(fusionCAP_feature_bram_dina[ 5]), .douta(fusionCAP_feature_bram_douta[ 5]));
    fusionCAP_feature_bram fusionCAP_feature_bram_6 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 6]), .wea(fusionCAP_feature_bram_wea[ 6]),  .addra(fusionCAP_feature_bram_addra[ 6]), .dina(fusionCAP_feature_bram_dina[ 6]), .douta(fusionCAP_feature_bram_douta[ 6]));
    fusionCAP_feature_bram fusionCAP_feature_bram_7 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 7]), .wea(fusionCAP_feature_bram_wea[ 7]),  .addra(fusionCAP_feature_bram_addra[ 7]), .dina(fusionCAP_feature_bram_dina[ 7]), .douta(fusionCAP_feature_bram_douta[ 7]));
    fusionCAP_feature_bram fusionCAP_feature_bram_8 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 8]), .wea(fusionCAP_feature_bram_wea[ 8]),  .addra(fusionCAP_feature_bram_addra[ 8]), .dina(fusionCAP_feature_bram_dina[ 8]), .douta(fusionCAP_feature_bram_douta[ 8]));
    fusionCAP_feature_bram fusionCAP_feature_bram_9 (.clka(clk), .ena(fusionCAP_feature_bram_ena[ 9]), .wea(fusionCAP_feature_bram_wea[ 9]),  .addra(fusionCAP_feature_bram_addra[ 9]), .dina(fusionCAP_feature_bram_dina[ 9]), .douta(fusionCAP_feature_bram_douta[ 9]));
    fusionCAP_feature_bram fusionCAP_feature_bram_10(.clka(clk), .ena(fusionCAP_feature_bram_ena[10]), .wea(fusionCAP_feature_bram_wea[10]),  .addra(fusionCAP_feature_bram_addra[10]), .dina(fusionCAP_feature_bram_dina[10]), .douta(fusionCAP_feature_bram_douta[10]));
    fusionCAP_feature_bram fusionCAP_feature_bram_11(.clka(clk), .ena(fusionCAP_feature_bram_ena[11]), .wea(fusionCAP_feature_bram_wea[11]),  .addra(fusionCAP_feature_bram_addra[11]), .dina(fusionCAP_feature_bram_dina[11]), .douta(fusionCAP_feature_bram_douta[11]));
    fusionCAP_feature_bram fusionCAP_feature_bram_12(.clka(clk), .ena(fusionCAP_feature_bram_ena[12]), .wea(fusionCAP_feature_bram_wea[12]),  .addra(fusionCAP_feature_bram_addra[12]), .dina(fusionCAP_feature_bram_dina[12]), .douta(fusionCAP_feature_bram_douta[12]));
    fusionCAP_feature_bram fusionCAP_feature_bram_13(.clka(clk), .ena(fusionCAP_feature_bram_ena[13]), .wea(fusionCAP_feature_bram_wea[13]),  .addra(fusionCAP_feature_bram_addra[13]), .dina(fusionCAP_feature_bram_dina[13]), .douta(fusionCAP_feature_bram_douta[13]));
    fusionCAP_feature_bram fusionCAP_feature_bram_14(.clka(clk), .ena(fusionCAP_feature_bram_ena[14]), .wea(fusionCAP_feature_bram_wea[14]),  .addra(fusionCAP_feature_bram_addra[14]), .dina(fusionCAP_feature_bram_dina[14]), .douta(fusionCAP_feature_bram_douta[14]));
    fusionCAP_feature_bram fusionCAP_feature_bram_15(.clka(clk), .ena(fusionCAP_feature_bram_ena[15]), .wea(fusionCAP_feature_bram_wea[15]),  .addra(fusionCAP_feature_bram_addra[15]), .dina(fusionCAP_feature_bram_dina[15]), .douta(fusionCAP_feature_bram_douta[15]));
    fusionCAP_feature_bram fusionCAP_feature_bram_16(.clka(clk), .ena(fusionCAP_feature_bram_ena[16]), .wea(fusionCAP_feature_bram_wea[16]),  .addra(fusionCAP_feature_bram_addra[16]), .dina(fusionCAP_feature_bram_dina[16]), .douta(fusionCAP_feature_bram_douta[16]));
    fusionCAP_feature_bram fusionCAP_feature_bram_17(.clka(clk), .ena(fusionCAP_feature_bram_ena[17]), .wea(fusionCAP_feature_bram_wea[17]),  .addra(fusionCAP_feature_bram_addra[17]), .dina(fusionCAP_feature_bram_dina[17]), .douta(fusionCAP_feature_bram_douta[17]));
    fusionCAP_feature_bram fusionCAP_feature_bram_18(.clka(clk), .ena(fusionCAP_feature_bram_ena[18]), .wea(fusionCAP_feature_bram_wea[18]),  .addra(fusionCAP_feature_bram_addra[18]), .dina(fusionCAP_feature_bram_dina[18]), .douta(fusionCAP_feature_bram_douta[18]));
    fusionCAP_feature_bram fusionCAP_feature_bram_19(.clka(clk), .ena(fusionCAP_feature_bram_ena[19]), .wea(fusionCAP_feature_bram_wea[19]),  .addra(fusionCAP_feature_bram_addra[19]), .dina(fusionCAP_feature_bram_dina[19]), .douta(fusionCAP_feature_bram_douta[19]));
    fusionCAP_feature_bram fusionCAP_feature_bram_20(.clka(clk), .ena(fusionCAP_feature_bram_ena[20]), .wea(fusionCAP_feature_bram_wea[20]),  .addra(fusionCAP_feature_bram_addra[20]), .dina(fusionCAP_feature_bram_dina[20]), .douta(fusionCAP_feature_bram_douta[20]));

    assign fusionCAP_feature_bram_ena[ 0] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 1] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 2] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 3] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 4] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 5] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 6] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 7] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 8] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[ 9] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[10] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[11] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[12] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[13] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[14] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[15] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[16] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[17] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[18] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[19] = (~fusionCAP_done) || (~fuzzy_rule_done);
    assign fusionCAP_feature_bram_ena[20] = (~fusionCAP_done) || (~fuzzy_rule_done);
    
    assign fusionCAP_feature_bram_wea[ 0] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 1] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 2] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 3] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 4] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 5] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 6] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 7] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 8] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[ 9] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[10] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[11] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[12] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[13] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[14] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[15] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[16] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[17] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[18] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[19] = (~fusionCAP_done);
    assign fusionCAP_feature_bram_wea[20] = (~fusionCAP_done);
    
    assign fusionCAP_feature_bram_addra[ 0] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 1] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 2] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 3] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 4] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 5] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 6] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 7] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 8] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[ 9] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[10] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[11] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[12] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[13] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[14] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[15] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[16] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[17] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[18] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[19] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;
    assign fusionCAP_feature_bram_addra[20] = (~fusionCAP_done) ? fusionCAP_output_addra : 0;

    assign fusionCAP_feature_bram_dina[ 0] = fusionCAP_odata[ 0];
    assign fusionCAP_feature_bram_dina[ 1] = fusionCAP_odata[ 1];
    assign fusionCAP_feature_bram_dina[ 2] = fusionCAP_odata[ 2];
    assign fusionCAP_feature_bram_dina[ 3] = fusionCAP_odata[ 3];
    assign fusionCAP_feature_bram_dina[ 4] = fusionCAP_odata[ 4];
    assign fusionCAP_feature_bram_dina[ 5] = fusionCAP_odata[ 5];
    assign fusionCAP_feature_bram_dina[ 6] = fusionCAP_odata[ 6];
    assign fusionCAP_feature_bram_dina[ 7] = fusionCAP_odata[ 7];
    assign fusionCAP_feature_bram_dina[ 8] = fusionCAP_odata[ 8];
    assign fusionCAP_feature_bram_dina[ 9] = fusionCAP_odata[ 9];
    assign fusionCAP_feature_bram_dina[10] = fusionCAP_odata[10];
    assign fusionCAP_feature_bram_dina[11] = fusionCAP_odata[11];
    assign fusionCAP_feature_bram_dina[12] = fusionCAP_odata[12];
    assign fusionCAP_feature_bram_dina[13] = fusionCAP_odata[13];
    assign fusionCAP_feature_bram_dina[14] = fusionCAP_odata[14];
    assign fusionCAP_feature_bram_dina[15] = fusionCAP_odata[15];
    assign fusionCAP_feature_bram_dina[16] = fusionCAP_odata[16];
    assign fusionCAP_feature_bram_dina[17] = fusionCAP_odata[17];
    assign fusionCAP_feature_bram_dina[18] = fusionCAP_odata[18];
    assign fusionCAP_feature_bram_dina[19] = fusionCAP_odata[19];
    assign fusionCAP_feature_bram_dina[20] = fusionCAP_odata[20];
    
    /*** fuzzy_rule layer ***/
    fuzzy_rule_top fuzzy_rule_top1(
        .clk           (clk),
        .rst           (fuzzy_rule_rst),
        .start         (fuzzy_rule_start),
        .idata_0       (fuzzy_rule_idata[0]), .idata_1(fuzzy_rule_idata[1]), .idata_2(fuzzy_rule_idata[2]), .idata_3(fuzzy_rule_idata[3]), .idata_4(fuzzy_rule_idata[4]), .idata_5(fuzzy_rule_idata[5]), .idata_6(fuzzy_rule_idata[6]), .idata_7(fuzzy_rule_idata[7]), .idata_8(fuzzy_rule_idata[8]), .idata_9(fuzzy_rule_idata[9]), .idata_10(fuzzy_rule_idata[10]), .idata_11(fuzzy_rule_idata[11]), .idata_12(fuzzy_rule_idata[12]), .idata_13(fuzzy_rule_idata[13]), .idata_14(fuzzy_rule_idata[14]), .idata_15(fuzzy_rule_idata[15]), .idata_16(fuzzy_rule_idata[16]), .idata_17(fuzzy_rule_idata[17]), .idata_18(fuzzy_rule_idata[18]), .idata_19(fuzzy_rule_idata[19]), .idata_20(fuzzy_rule_idata[20]), 
        .output_filter (fuzzy_rule_output_filter),
        .odata         (fuzzy_rule_odata),
        .done          (fuzzy_rule_done)
    );
    
    assign fuzzy_rule_rst       = rst;
    assign fuzzy_rule_start     = (fusionCAP_done)? 1 : 0;
    assign fuzzy_rule_idata[ 0] = fusionCAP_feature_bram_douta[ 0];
    assign fuzzy_rule_idata[ 1] = fusionCAP_feature_bram_douta[ 1];
    assign fuzzy_rule_idata[ 2] = fusionCAP_feature_bram_douta[ 2];
    assign fuzzy_rule_idata[ 3] = fusionCAP_feature_bram_douta[ 3];
    assign fuzzy_rule_idata[ 4] = fusionCAP_feature_bram_douta[ 4];
    assign fuzzy_rule_idata[ 5] = fusionCAP_feature_bram_douta[ 5];
    assign fuzzy_rule_idata[ 6] = fusionCAP_feature_bram_douta[ 6];
    assign fuzzy_rule_idata[ 7] = fusionCAP_feature_bram_douta[ 7];
    assign fuzzy_rule_idata[ 8] = fusionCAP_feature_bram_douta[ 8];
    assign fuzzy_rule_idata[ 9] = fusionCAP_feature_bram_douta[ 9];
    assign fuzzy_rule_idata[10] = fusionCAP_feature_bram_douta[10];
    assign fuzzy_rule_idata[11] = fusionCAP_feature_bram_douta[11];
    assign fuzzy_rule_idata[12] = fusionCAP_feature_bram_douta[12];
    assign fuzzy_rule_idata[13] = fusionCAP_feature_bram_douta[13];
    assign fuzzy_rule_idata[14] = fusionCAP_feature_bram_douta[14];
    assign fuzzy_rule_idata[15] = fusionCAP_feature_bram_douta[15];
    assign fuzzy_rule_idata[16] = fusionCAP_feature_bram_douta[16];
    assign fuzzy_rule_idata[17] = fusionCAP_feature_bram_douta[17];
    assign fuzzy_rule_idata[18] = fusionCAP_feature_bram_douta[18];
    assign fuzzy_rule_idata[19] = fusionCAP_feature_bram_douta[19];
    assign fuzzy_rule_idata[20] = fusionCAP_feature_bram_douta[20];
    
    /*** fuzzy_rule feature BRAM ***/
    fuzzy_rule_feature_bram fuzzy_rule_feature_bram_0(.clka(clk), .ena(fuzzy_rule_feature_bram_ena), .wea(fuzzy_rule_feature_bram_wea),  .addra(fuzzy_rule_feature_bram_addra), .dina(fuzzy_rule_feature_bram_dina), .douta(fuzzy_rule_feature_bram_douta));
    
    assign fuzzy_rule_feature_bram_ena   = (~fuzzy_rule_done) || (~defuzzy_done);
    assign fuzzy_rule_feature_bram_wea   = (~fuzzy_rule_done);
    assign fuzzy_rule_feature_bram_addra = (~fuzzy_rule_done) ? fuzzy_rule_output_filter : defuzzy_input_addra;
    assign fuzzy_rule_feature_bram_dina  = fuzzy_rule_odata;
    
    /*** defuzzy layer ***/
    defuzzy_top defuzzy_top1(
        .clk         (clk),
        .rst         (defuzzy_rst),
        .start       (defuzzy_start),
        .input_addra (defuzzy_input_addra),
        .idata       (defuzzy_idata),         
        .odata       (defuzzy_odata),
        .done        (defuzzy_done)
    );
    
    assign defuzzy_rst   = rst;
    assign defuzzy_start = (fuzzy_rule_done)? 1 : 0;
    assign defuzzy_idata = fuzzy_rule_feature_bram_douta;
    
    /*** output ***/
    assign odata = defuzzy_odata;
    assign done  = defuzzy_done;


    /*========== Test ==========*/
    /*** Test fusionCAP ***/
    /*
    assign fusionCAP_odata_0  = fusionCAP_odata[ 0];
    assign fusionCAP_odata_1  = fusionCAP_odata[ 1];
    assign fusionCAP_odata_2  = fusionCAP_odata[ 2];
    assign fusionCAP_odata_3  = fusionCAP_odata[ 3];
    assign fusionCAP_odata_4  = fusionCAP_odata[ 4];
    assign fusionCAP_odata_5  = fusionCAP_odata[ 5];
    assign fusionCAP_odata_6  = fusionCAP_odata[ 6];
    assign fusionCAP_odata_7  = fusionCAP_odata[ 7];
    assign fusionCAP_odata_8  = fusionCAP_odata[ 8];
    assign fusionCAP_odata_9  = fusionCAP_odata[ 9];
    assign fusionCAP_odata_10 = fusionCAP_odata[10];
    assign fusionCAP_odata_11 = fusionCAP_odata[11];
    assign fusionCAP_odata_12 = fusionCAP_odata[12];
    assign fusionCAP_odata_13 = fusionCAP_odata[13];
    assign fusionCAP_odata_14 = fusionCAP_odata[14];
    assign fusionCAP_odata_15 = fusionCAP_odata[15];
    assign fusionCAP_odata_16 = fusionCAP_odata[16];
    assign fusionCAP_odata_17 = fusionCAP_odata[17];
    assign fusionCAP_odata_18 = fusionCAP_odata[18];
    assign fusionCAP_odata_19 = fusionCAP_odata[19];
    assign fusionCAP_odata_20 = fusionCAP_odata[20];
    */
    
endmodule
