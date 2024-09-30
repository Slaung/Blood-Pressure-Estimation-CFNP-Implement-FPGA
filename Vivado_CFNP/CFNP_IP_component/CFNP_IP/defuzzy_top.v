`timescale 1ns / 1ps

module defuzzy_top#(
    parameter DF_INPUT_SIZE = 5
)(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    output reg         [ 2:0] input_addra,
    input  wire signed [15:0] idata,
    output wire signed [15:0] odata,
    output wire               done
);
    /*** variable ***/
    
    wire       all_rst;
    reg  [2:0] done_counter;

    /*** input buffer ***/
    
    reg [2:0] input_buffer_delay;

    wire input_buffer_start;
    wire input_buffer_done;

    wire signed [15:0] x;

    df_input_buffer df_input_buffer_0(.clk(clk), .rst(rst || all_rst), .start(input_buffer_start && input_buffer_delay==2), .idata(idata), .x(x), .done(input_buffer_done));

    assign input_buffer_start = start;

    /*** weights memory ***/
    
    wire weights_memory_start;
    wire weights_memory_done;

    wire signed [15:0] w;

    df_weights_memory df_weights_memory_0(.clk(clk), .rst(rst || all_rst), .start(weights_memory_start), .input_filter(input_addra), .w(w), .done(weights_memory_done));

    assign weights_memory_start = start;

    /*** processing element ***/

    wire pe_start;
    wire pe_done;

    wire signed [15:0] pe_odata;

    df_processing_element df_processing_element_0(.clk(clk), .rst(rst || all_rst), .start(pe_start), .x(x), .w(w), .odata(pe_odata), .done(pe_done));

    assign pe_start = input_buffer_done && weights_memory_done;

    /*** quantify ***/

    wire df_quantify_start;
    reg  df_quantify_done;

    reg signed [15:0] df_quantify;

    always @(posedge clk) begin
        if(rst) begin
            df_quantify_done <= 0;
            df_quantify      <= 0;
        end else if(df_quantify_start) begin
            df_quantify_done <= 1;
            df_quantify      <= pe_odata / 10;
        end
    end

    assign df_quantify_start = pe_done;

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

    /*** input_addra ***/
    always @(posedge clk) begin
        if(rst) begin
            input_addra <= 0;
        end else if(start) begin
            if(input_addra != DF_INPUT_SIZE - 1) begin
                input_addra <= input_addra + 1;
            end else begin
                input_addra <= input_addra;
            end
        end 
    end

    /*** done_counter ***/
    always @(posedge clk) begin
        if(rst) begin
            done_counter <= 0;
        end else if(start) begin
            if(done_counter != DF_INPUT_SIZE - 1 && df_quantify_done==1) begin
                done_counter <= done_counter + 1;
            end else begin
                done_counter <= done_counter;
            end
        end 
    end

    /*** output ***/
    assign all_rst = (done_counter >= DF_INPUT_SIZE - 2)? 1 : 0;
    assign odata   = (df_quantify_done == 1)? df_quantify : 0;
    assign done    = (df_quantify_done == 1 && done_counter == DF_INPUT_SIZE - 1)? 1 : 0;

endmodule