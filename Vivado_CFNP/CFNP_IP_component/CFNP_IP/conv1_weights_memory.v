`timescale 1ns / 1ps

module conv1_weights_memory(
    input  wire                clk,
    input  wire                rst,
    input  wire                start,
    input  wire        [4: 0]  input_filter,
    output wire signed [15: 0] w0, w1,
    output wire signed [31: 0] b,
    output wire                done
);
    reg signed [15: 0] weights0 [0:19];
    reg signed [15: 0] weights1 [0:19];
    reg signed [31: 0] bias     [0:19];
    
    initial begin
        weights0[0] <=  -551; weights0[1] <=   -35; weights0[2] <=  -460; weights0[3] <=    -1; weights0[4] <=    -6; weights0[5] <=    -4; weights0[6] <=  -542; weights0[7] <=   267; weights0[8] <=  -474; weights0[9] <=  -637; weights0[10] <=   -16; weights0[11] <=  -485; weights0[12] <=     0; weights0[13] <=   978; weights0[14] <=   -15; weights0[15] <=  -497; weights0[16] <=    11; weights0[17] <=   395; weights0[18] <=  -953; weights0[19] <=  -647; 
        weights1[0] <=   577; weights1[1] <=    12; weights1[2] <=  -737; weights1[3] <=   -13; weights1[4] <=   590; weights1[5] <=     4; weights1[6] <=   609; weights1[7] <= -1219; weights1[8] <=  -630; weights1[9] <=  -460; weights1[10] <=    -9; weights1[11] <= -1330; weights1[12] <=   -12; weights1[13] <=  -942; weights1[14] <=    18; weights1[15] <= -1270; weights1[16] <=    60; weights1[17] <= -1709; weights1[18] <=    70; weights1[19] <=   658; 
        bias[0] <= 477383; bias[1] <= -808036; bias[2] <= -1332065; bias[3] <= -531149; bias[4] <= -1745857; bias[5] <= -74238; bias[6] <= 527788; bias[7] <= 747790; bias[8] <= 459118; bias[9] <= -1312600; bias[10] <= -272469; bias[11] <= 733043; bias[12] <= -234679; bias[13] <= -780901; bias[14] <= -340703; bias[15] <= 743281; bias[16] <= -272248; bias[17] <= 683411; bias[18] <= -805462; bias[19] <= -1882176; 
    end
    
    assign w0   = weights0[input_filter];
    assign w1   = weights1[input_filter];
    assign b    = bias[input_filter];
    assign done = (start == 1) ? 1 : 0;
    
    /*
    always @(posedge clk) begin
        if(rst) begin
            w0 <= 0; w1 <= 0; b <= 0;
            done <= 0;
        end
        else if(start) begin
            case(input_filter)
                0:  begin w0 <=  -551; w1 <=   577; b <=    477383; end
                1:  begin w0 <=   -35; w1 <=    12; b <=   -808036; end
                2:  begin w0 <=  -460; w1 <=  -737; b <=  -1332065; end
                3:  begin w0 <=    -1; w1 <=   -13; b <=   -531149; end
                4:  begin w0 <=    -6; w1 <=   590; b <=  -1745857; end
                5:  begin w0 <=    -4; w1 <=     4; b <=    -74238; end
                6:  begin w0 <=  -542; w1 <=   609; b <=    527788; end
                7:  begin w0 <=   267; w1 <= -1219; b <=    747790; end
                8:  begin w0 <=  -474; w1 <=  -630; b <=    459118; end
                9:  begin w0 <=  -637; w1 <=  -460; b <=  -1312600; end
                10: begin w0 <=   -16; w1 <=    -9; b <=   -272469; end
                11: begin w0 <=  -485; w1 <= -1330; b <=    733043; end
                12: begin w0 <=     0; w1 <=   -12; b <=   -234679; end
                13: begin w0 <=   978; w1 <=  -942; b <=   -780901; end
                14: begin w0 <=   -15; w1 <=    18; b <=   -340703; end
                15: begin w0 <=  -497; w1 <= -1270; b <=    743281; end
                16: begin w0 <=    11; w1 <=    60; b <=   -272248; end
                17: begin w0 <=   395; w1 <= -1709; b <=    683411; end
                18: begin w0 <=  -953; w1 <=    70; b <=   -805462; end
                19: begin w0 <=  -647; w1 <=   658; b <=  -1882176; end
            endcase
            done <= 1;
        end
    end
    */
endmodule