`timescale 1ns / 1ps

module fr_exp_lut(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire        [15:0] addra,
    output reg  signed [15:0] odata,
    output reg                done
);
    
    reg [8:0] exp_LUT [0:391];

    initial begin
        exp_LUT[  0] <= 100; exp_LUT[  1] <=  99; exp_LUT[  2] <=  98; exp_LUT[  3] <=  97; exp_LUT[  4] <=  96; exp_LUT[  5] <=  95; exp_LUT[  6] <=  94; exp_LUT[  7] <=  93; exp_LUT[  8] <=  92; exp_LUT[  9] <=  91; 
        exp_LUT[ 10] <=  90; exp_LUT[ 11] <=  89; exp_LUT[ 12] <=  88; exp_LUT[ 13] <=  87; exp_LUT[ 14] <=  86; exp_LUT[ 15] <=  86; exp_LUT[ 16] <=  85; exp_LUT[ 17] <=  84; exp_LUT[ 18] <=  83; exp_LUT[ 19] <=  82; 
        exp_LUT[ 20] <=  81; exp_LUT[ 21] <=  81; exp_LUT[ 22] <=  80; exp_LUT[ 23] <=  79; exp_LUT[ 24] <=  78; exp_LUT[ 25] <=  77; exp_LUT[ 26] <=  77; exp_LUT[ 27] <=  76; exp_LUT[ 28] <=  75; exp_LUT[ 29] <=  74; 
        exp_LUT[ 30] <=  74; exp_LUT[ 31] <=  73; exp_LUT[ 32] <=  72; exp_LUT[ 33] <=  71; exp_LUT[ 34] <=  71; exp_LUT[ 35] <=  70; exp_LUT[ 36] <=  69; exp_LUT[ 37] <=  69; exp_LUT[ 38] <=  68; exp_LUT[ 39] <=  67; 
        exp_LUT[ 40] <=  67; exp_LUT[ 41] <=  66; exp_LUT[ 42] <=  65; exp_LUT[ 43] <=  65; exp_LUT[ 44] <=  64; exp_LUT[ 45] <=  63; exp_LUT[ 46] <=  63; exp_LUT[ 47] <=  62; exp_LUT[ 48] <=  61; exp_LUT[ 49] <=  61; 
        exp_LUT[ 50] <=  60; exp_LUT[ 51] <=  60; exp_LUT[ 52] <=  59; exp_LUT[ 53] <=  58; exp_LUT[ 54] <=  58; exp_LUT[ 55] <=  57; exp_LUT[ 56] <=  57; exp_LUT[ 57] <=  56; exp_LUT[ 58] <=  55; exp_LUT[ 59] <=  55; 
        exp_LUT[ 60] <=  54; exp_LUT[ 61] <=  54; exp_LUT[ 62] <=  53; exp_LUT[ 63] <=  53; exp_LUT[ 64] <=  52; exp_LUT[ 65] <=  52; exp_LUT[ 66] <=  51; exp_LUT[ 67] <=  51; exp_LUT[ 68] <=  50; exp_LUT[ 69] <=  50; 
        exp_LUT[ 70] <=  49; exp_LUT[ 71] <=  49; exp_LUT[ 72] <=  48; exp_LUT[ 73] <=  48; exp_LUT[ 74] <=  47; exp_LUT[ 75] <=  47; exp_LUT[ 76] <=  46; exp_LUT[ 77] <=  46; exp_LUT[ 78] <=  45; exp_LUT[ 79] <=  45; 
        exp_LUT[ 80] <=  44; exp_LUT[ 81] <=  44; exp_LUT[ 82] <=  44; exp_LUT[ 83] <=  43; exp_LUT[ 84] <=  43; exp_LUT[ 85] <=  42; exp_LUT[ 86] <=  42; exp_LUT[ 87] <=  41; exp_LUT[ 88] <=  41; exp_LUT[ 89] <=  41; 
        exp_LUT[ 90] <=  40; exp_LUT[ 91] <=  40; exp_LUT[ 92] <=  39; exp_LUT[ 93] <=  39; exp_LUT[ 94] <=  39; exp_LUT[ 95] <=  38; exp_LUT[ 96] <=  38; exp_LUT[ 97] <=  37; exp_LUT[ 98] <=  37; exp_LUT[ 99] <=  37; 
        exp_LUT[100] <=  36; exp_LUT[101] <=  36; exp_LUT[102] <=  36; exp_LUT[103] <=  35; exp_LUT[104] <=  35; exp_LUT[105] <=  34; exp_LUT[106] <=  34; exp_LUT[107] <=  34; exp_LUT[108] <=  33; exp_LUT[109] <=  33; 
        exp_LUT[110] <=  33; exp_LUT[111] <=  32; exp_LUT[112] <=  32; exp_LUT[113] <=  32; exp_LUT[114] <=  31; exp_LUT[115] <=  31; exp_LUT[116] <=  31; exp_LUT[117] <=  31; exp_LUT[118] <=  30; exp_LUT[119] <=  30; 
        exp_LUT[120] <=  30; exp_LUT[121] <=  29; exp_LUT[122] <=  29; exp_LUT[123] <=  29; exp_LUT[124] <=  28; exp_LUT[125] <=  28; exp_LUT[126] <=  28; exp_LUT[127] <=  28; exp_LUT[128] <=  27; exp_LUT[129] <=  27; 
        exp_LUT[130] <=  27; exp_LUT[131] <=  26; exp_LUT[132] <=  26; exp_LUT[133] <=  26; exp_LUT[134] <=  26; exp_LUT[135] <=  25; exp_LUT[136] <=  25; exp_LUT[137] <=  25; exp_LUT[138] <=  25; exp_LUT[139] <=  24; 
        exp_LUT[140] <=  24; exp_LUT[141] <=  24; exp_LUT[142] <=  24; exp_LUT[143] <=  23; exp_LUT[144] <=  23; exp_LUT[145] <=  23; exp_LUT[146] <=  23; exp_LUT[147] <=  22; exp_LUT[148] <=  22; exp_LUT[149] <=  22; 
        exp_LUT[150] <=  22; exp_LUT[151] <=  22; exp_LUT[152] <=  21; exp_LUT[153] <=  21; exp_LUT[154] <=  21; exp_LUT[155] <=  21; exp_LUT[156] <=  21; exp_LUT[157] <=  20; exp_LUT[158] <=  20; exp_LUT[159] <=  20; 
        exp_LUT[160] <=  20; exp_LUT[161] <=  19; exp_LUT[162] <=  19; exp_LUT[163] <=  19; exp_LUT[164] <=  19; exp_LUT[165] <=  19; exp_LUT[166] <=  19; exp_LUT[167] <=  18; exp_LUT[168] <=  18; exp_LUT[169] <=  18; 
        exp_LUT[170] <=  18; exp_LUT[171] <=  18; exp_LUT[172] <=  17; exp_LUT[173] <=  17; exp_LUT[174] <=  17; exp_LUT[175] <=  17; exp_LUT[176] <=  17; exp_LUT[177] <=  17; exp_LUT[178] <=  16; exp_LUT[179] <=  16; 
        exp_LUT[180] <=  16; exp_LUT[181] <=  16; exp_LUT[182] <=  16; exp_LUT[183] <=  16; exp_LUT[184] <=  15; exp_LUT[185] <=  15; exp_LUT[186] <=  15; exp_LUT[187] <=  15; exp_LUT[188] <=  15; exp_LUT[189] <=  15; 
        exp_LUT[190] <=  14; exp_LUT[191] <=  14; exp_LUT[192] <=  14; exp_LUT[193] <=  14; exp_LUT[194] <=  14; exp_LUT[195] <=  14; exp_LUT[196] <=  14; exp_LUT[197] <=  13; exp_LUT[198] <=  13; exp_LUT[199] <=  13; 
        exp_LUT[200] <=  13; exp_LUT[201] <=  13; exp_LUT[202] <=  13; exp_LUT[203] <=  13; exp_LUT[204] <=  13; exp_LUT[205] <=  12; exp_LUT[206] <=  12; exp_LUT[207] <=  12; exp_LUT[208] <=  12; exp_LUT[209] <=  12; 
        exp_LUT[210] <=  12; exp_LUT[211] <=  12; exp_LUT[212] <=  12; exp_LUT[213] <=  11; exp_LUT[214] <=  11; exp_LUT[215] <=  11; exp_LUT[216] <=  11; exp_LUT[217] <=  11; exp_LUT[218] <=  11; exp_LUT[219] <=  11; 
        exp_LUT[220] <=  11; exp_LUT[221] <=  10; exp_LUT[222] <=  10; exp_LUT[223] <=  10; exp_LUT[224] <=  10; exp_LUT[225] <=  10; exp_LUT[226] <=  10; exp_LUT[227] <=  10; exp_LUT[228] <=  10; exp_LUT[229] <=  10; 
        exp_LUT[230] <=  10; exp_LUT[231] <=   9; exp_LUT[232] <=   9; exp_LUT[233] <=   9; exp_LUT[234] <=   9; exp_LUT[235] <=   9; exp_LUT[236] <=   9; exp_LUT[237] <=   9; exp_LUT[238] <=   9; exp_LUT[239] <=   9; 
        exp_LUT[240] <=   9; exp_LUT[241] <=   8; exp_LUT[242] <=   8; exp_LUT[243] <=   8; exp_LUT[244] <=   8; exp_LUT[245] <=   8; exp_LUT[246] <=   8; exp_LUT[247] <=   8; exp_LUT[248] <=   8; exp_LUT[249] <=   8; 
        exp_LUT[250] <=   8; exp_LUT[251] <=   8; exp_LUT[252] <=   8; exp_LUT[253] <=   7; exp_LUT[254] <=   7; exp_LUT[255] <=   7; exp_LUT[256] <=   7; exp_LUT[257] <=   7; exp_LUT[258] <=   7; exp_LUT[259] <=   7; 
        exp_LUT[260] <=   7; exp_LUT[261] <=   7; exp_LUT[262] <=   7; exp_LUT[263] <=   7; exp_LUT[264] <=   7; exp_LUT[265] <=   7; exp_LUT[266] <=   6; exp_LUT[267] <=   6; exp_LUT[268] <=   6; exp_LUT[269] <=   6; 
        exp_LUT[270] <=   6; exp_LUT[271] <=   6; exp_LUT[272] <=   6; exp_LUT[273] <=   6; exp_LUT[274] <=   6; exp_LUT[275] <=   6; exp_LUT[276] <=   6; exp_LUT[277] <=   6; exp_LUT[278] <=   6; exp_LUT[279] <=   6; 
        exp_LUT[280] <=   6; exp_LUT[281] <=   6; exp_LUT[282] <=   5; exp_LUT[283] <=   5; exp_LUT[284] <=   5; exp_LUT[285] <=   5; exp_LUT[286] <=   5; exp_LUT[287] <=   5; exp_LUT[288] <=   5; exp_LUT[289] <=   5; 
        exp_LUT[290] <=   5; exp_LUT[291] <=   5; exp_LUT[292] <=   5; exp_LUT[293] <=   5; exp_LUT[294] <=   5; exp_LUT[295] <=   5; exp_LUT[296] <=   5; exp_LUT[297] <=   5; exp_LUT[298] <=   5; exp_LUT[299] <=   5; 
        exp_LUT[300] <=   4; exp_LUT[301] <=   4; exp_LUT[302] <=   4; exp_LUT[303] <=   4; exp_LUT[304] <=   4; exp_LUT[305] <=   4; exp_LUT[306] <=   4; exp_LUT[307] <=   4; exp_LUT[308] <=   4; exp_LUT[309] <=   4; 
        exp_LUT[310] <=   4; exp_LUT[311] <=   4; exp_LUT[312] <=   4; exp_LUT[313] <=   4; exp_LUT[314] <=   4; exp_LUT[315] <=   4; exp_LUT[316] <=   4; exp_LUT[317] <=   4; exp_LUT[318] <=   4; exp_LUT[319] <=   4; 
        exp_LUT[320] <=   4; exp_LUT[321] <=   4; exp_LUT[322] <=   3; exp_LUT[323] <=   3; exp_LUT[324] <=   3; exp_LUT[325] <=   3; exp_LUT[326] <=   3; exp_LUT[327] <=   3; exp_LUT[328] <=   3; exp_LUT[329] <=   3; 
        exp_LUT[330] <=   3; exp_LUT[331] <=   3; exp_LUT[332] <=   3; exp_LUT[333] <=   3; exp_LUT[334] <=   3; exp_LUT[335] <=   3; exp_LUT[336] <=   3; exp_LUT[337] <=   3; exp_LUT[338] <=   3; exp_LUT[339] <=   3; 
        exp_LUT[340] <=   3; exp_LUT[341] <=   3; exp_LUT[342] <=   3; exp_LUT[343] <=   3; exp_LUT[344] <=   3; exp_LUT[345] <=   3; exp_LUT[346] <=   3; exp_LUT[347] <=   3; exp_LUT[348] <=   3; exp_LUT[349] <=   3; 
        exp_LUT[350] <=   3; exp_LUT[351] <=   2; exp_LUT[352] <=   2; exp_LUT[353] <=   2; exp_LUT[354] <=   2; exp_LUT[355] <=   2; exp_LUT[356] <=   2; exp_LUT[357] <=   2; exp_LUT[358] <=   2; exp_LUT[359] <=   2; 
        exp_LUT[360] <=   2; exp_LUT[361] <=   2; exp_LUT[362] <=   2; exp_LUT[363] <=   2; exp_LUT[364] <=   2; exp_LUT[365] <=   2; exp_LUT[366] <=   2; exp_LUT[367] <=   2; exp_LUT[368] <=   2; exp_LUT[369] <=   2; 
        exp_LUT[370] <=   2; exp_LUT[371] <=   2; exp_LUT[372] <=   2; exp_LUT[373] <=   2; exp_LUT[374] <=   2; exp_LUT[375] <=   2; exp_LUT[376] <=   2; exp_LUT[377] <=   2; exp_LUT[378] <=   2; exp_LUT[379] <=   2; 
        exp_LUT[380] <=   2; exp_LUT[381] <=   2; exp_LUT[382] <=   2; exp_LUT[383] <=   2; exp_LUT[384] <=   2; exp_LUT[385] <=   2; exp_LUT[386] <=   2; exp_LUT[387] <=   2; exp_LUT[388] <=   2; exp_LUT[389] <=   2; 
        exp_LUT[390] <=   2; exp_LUT[391] <=   2;
    end

    always @(posedge clk) begin
        if(rst) begin
            odata <= 0;
            done  <= 0;
        end else if(start) begin
            odata <= {7'b0000000, exp_LUT[addra[8:0]]};
            done  <= 1;
        end
    end
    /*
    assign odata = (!start)? 0 :
                   (addra != 0)?   {7'b0000000, exp_LUT[addra[8:0]]}: 0;
    assign done  = (start)? 1 : 0;
    */
   
endmodule