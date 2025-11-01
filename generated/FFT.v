module ButterflyUnit(
  input  [31:0] io_x_k_s_real,
  input  [31:0] io_x_k_s_imag,
  input  [31:0] io_x_t_real,
  input  [31:0] io_x_t_imag,
  input  [31:0] io_w_real,
  input  [31:0] io_w_imag,
  output [31:0] io_out_0_real,
  output [31:0] io_out_0_imag,
  output [31:0] io_out_1_real,
  output [31:0] io_out_1_imag
);
  wire [31:0] out_part_real = $signed(io_x_k_s_real) - $signed(io_x_t_real); // @[ButterflyUnit.scala 18:34]
  wire [31:0] out_part_imag = $signed(io_x_k_s_imag) - $signed(io_x_t_imag); // @[ButterflyUnit.scala 19:34]
  wire [63:0] _out_part_withOmega_real_T = $signed(out_part_real) * $signed(io_w_real); // @[ButterflyUnit.scala 21:47]
  wire [63:0] _out_part_withOmega_real_T_1 = $signed(out_part_imag) * $signed(io_w_imag); // @[ButterflyUnit.scala 21:75]
  wire [63:0] out_part_withOmega_real = $signed(_out_part_withOmega_real_T) - $signed(_out_part_withOmega_real_T_1); // @[ButterflyUnit.scala 21:59]
  wire [63:0] _rounded_real_T_3 = $signed(out_part_withOmega_real) + 64'sh8000; // @[ButterflyUnit.scala 22:47]
  wire [47:0] rounded_real = _rounded_real_T_3[63:16]; // @[ButterflyUnit.scala 22:86]
  wire [63:0] _out_part_withOmega_imag_T = $signed(out_part_real) * $signed(io_w_imag); // @[ButterflyUnit.scala 25:47]
  wire [63:0] _out_part_withOmega_imag_T_1 = $signed(out_part_imag) * $signed(io_w_real); // @[ButterflyUnit.scala 25:75]
  wire [63:0] out_part_withOmega_imag = $signed(_out_part_withOmega_imag_T) + $signed(_out_part_withOmega_imag_T_1); // @[ButterflyUnit.scala 25:59]
  wire [63:0] _rounded_imag_T_3 = $signed(out_part_withOmega_imag) + 64'sh8000; // @[ButterflyUnit.scala 26:47]
  wire [47:0] rounded_imag = _rounded_imag_T_3[63:16]; // @[ButterflyUnit.scala 26:86]
  assign io_out_0_real = $signed(io_x_k_s_real) + $signed(io_x_t_real); // @[ButterflyUnit.scala 12:35]
  assign io_out_0_imag = $signed(io_x_k_s_imag) + $signed(io_x_t_imag); // @[ButterflyUnit.scala 13:35]
  assign io_out_1_real = rounded_real[31:0]; // @[ButterflyUnit.scala 23:58]
  assign io_out_1_imag = rounded_imag[31:0]; // @[ButterflyUnit.scala 27:58]
endmodule
module FFTStage(
  input  [31:0] io_in_bits_0_real,
  input  [31:0] io_in_bits_0_imag,
  input  [31:0] io_in_bits_1_real,
  input  [31:0] io_in_bits_1_imag,
  input  [31:0] io_in_bits_2_real,
  input  [31:0] io_in_bits_2_imag,
  input  [31:0] io_in_bits_3_real,
  input  [31:0] io_in_bits_3_imag,
  input  [31:0] io_in_bits_4_real,
  input  [31:0] io_in_bits_4_imag,
  input  [31:0] io_in_bits_5_real,
  input  [31:0] io_in_bits_5_imag,
  input  [31:0] io_in_bits_6_real,
  input  [31:0] io_in_bits_6_imag,
  input  [31:0] io_in_bits_7_real,
  input  [31:0] io_in_bits_7_imag,
  input  [31:0] io_in_bits_8_real,
  input  [31:0] io_in_bits_8_imag,
  input  [31:0] io_in_bits_9_real,
  input  [31:0] io_in_bits_9_imag,
  input  [31:0] io_in_bits_10_real,
  input  [31:0] io_in_bits_10_imag,
  input  [31:0] io_in_bits_11_real,
  input  [31:0] io_in_bits_11_imag,
  input  [31:0] io_in_bits_12_real,
  input  [31:0] io_in_bits_12_imag,
  input  [31:0] io_in_bits_13_real,
  input  [31:0] io_in_bits_13_imag,
  input  [31:0] io_in_bits_14_real,
  input  [31:0] io_in_bits_14_imag,
  input  [31:0] io_in_bits_15_real,
  input  [31:0] io_in_bits_15_imag,
  output [31:0] io_out_bits_0_real,
  output [31:0] io_out_bits_0_imag,
  output [31:0] io_out_bits_1_real,
  output [31:0] io_out_bits_1_imag,
  output [31:0] io_out_bits_2_real,
  output [31:0] io_out_bits_2_imag,
  output [31:0] io_out_bits_3_real,
  output [31:0] io_out_bits_3_imag,
  output [31:0] io_out_bits_4_real,
  output [31:0] io_out_bits_4_imag,
  output [31:0] io_out_bits_5_real,
  output [31:0] io_out_bits_5_imag,
  output [31:0] io_out_bits_6_real,
  output [31:0] io_out_bits_6_imag,
  output [31:0] io_out_bits_7_real,
  output [31:0] io_out_bits_7_imag,
  output [31:0] io_out_bits_8_real,
  output [31:0] io_out_bits_8_imag,
  output [31:0] io_out_bits_9_real,
  output [31:0] io_out_bits_9_imag,
  output [31:0] io_out_bits_10_real,
  output [31:0] io_out_bits_10_imag,
  output [31:0] io_out_bits_11_real,
  output [31:0] io_out_bits_11_imag,
  output [31:0] io_out_bits_12_real,
  output [31:0] io_out_bits_12_imag,
  output [31:0] io_out_bits_13_real,
  output [31:0] io_out_bits_13_imag,
  output [31:0] io_out_bits_14_real,
  output [31:0] io_out_bits_14_imag,
  output [31:0] io_out_bits_15_real,
  output [31:0] io_out_bits_15_imag,
  input  [2:0]  io_stage
);
  wire [31:0] butterflys_0_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_0_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_1_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_2_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_3_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_4_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_5_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_6_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_x_k_s_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_x_k_s_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_x_t_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_x_t_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_w_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_w_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_out_0_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_out_0_imag; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_out_1_real; // @[FFTStage.scala 31:41]
  wire [31:0] butterflys_7_io_out_1_imag; // @[FFTStage.scala 31:41]
  wire [2:0] k_width = 3'h4 - io_stage; // @[FFTStage.scala 33:36]
  wire [7:0] _k_T_2 = 8'h1 << k_width; // @[FFTStage.scala 35:48]
  wire [7:0] _k_T_4 = _k_T_2 - 8'h1; // @[FFTStage.scala 35:60]
  wire  _k_s_T = 1'h0 >> k_width; // @[FFTStage.scala 36:21]
  wire [2:0] _k_s_T_2 = io_stage - 3'h1; // @[FFTStage.scala 36:68]
  wire [2:0] _k_s_T_4 = 3'h4 - _k_s_T_2; // @[FFTStage.scala 36:56]
  wire [7:0] _GEN_0 = {{7'd0}, _k_s_T}; // @[FFTStage.scala 36:33]
  wire [7:0] _k_s_T_5 = _GEN_0 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [8:0] _k_s_T_6 = {{1'd0}, _k_s_T_5}; // @[FFTStage.scala 36:77]
  wire [7:0] k_s = _k_s_T_6[7:0]; // @[FFTStage.scala 36:77]
  wire [4:0] _t_T = 5'h10 >> io_stage; // @[FFTStage.scala 37:24]
  wire [7:0] _GEN_1152 = {{3'd0}, _t_T}; // @[FFTStage.scala 37:17]
  wire [7:0] t = k_s + _GEN_1152; // @[FFTStage.scala 37:17]
  wire [14:0] w_idx = 15'h0 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_1 = 4'h1 == k_s[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_2 = 4'h2 == k_s[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_1); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_3 = 4'h3 == k_s[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_2); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_4 = 4'h4 == k_s[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_3); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_5 = 4'h5 == k_s[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_4); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_6 = 4'h6 == k_s[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_5); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_7 = 4'h7 == k_s[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_6); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_8 = 4'h8 == k_s[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_7); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_9 = 4'h9 == k_s[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_8); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_10 = 4'ha == k_s[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_9); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_11 = 4'hb == k_s[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_10); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_12 = 4'hc == k_s[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_11); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_13 = 4'hd == k_s[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_12); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_14 = 4'he == k_s[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_13); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_17 = 4'h1 == k_s[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_18 = 4'h2 == k_s[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_17); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_19 = 4'h3 == k_s[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_18); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_20 = 4'h4 == k_s[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_19); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_21 = 4'h5 == k_s[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_20); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_22 = 4'h6 == k_s[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_21); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_23 = 4'h7 == k_s[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_22); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_24 = 4'h8 == k_s[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_23); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_25 = 4'h9 == k_s[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_24); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_26 = 4'ha == k_s[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_25); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_27 = 4'hb == k_s[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_26); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_28 = 4'hc == k_s[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_27); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_29 = 4'hd == k_s[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_28); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_30 = 4'he == k_s[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_29); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_33 = 4'h1 == t[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_34 = 4'h2 == t[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_33); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_35 = 4'h3 == t[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_34); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_36 = 4'h4 == t[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_35); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_37 = 4'h5 == t[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_36); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_38 = 4'h6 == t[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_37); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_39 = 4'h7 == t[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_38); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_40 = 4'h8 == t[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_39); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_41 = 4'h9 == t[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_40); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_42 = 4'ha == t[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_41); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_43 = 4'hb == t[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_42); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_44 = 4'hc == t[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_43); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_45 = 4'hd == t[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_44); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_46 = 4'he == t[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_45); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_49 = 4'h1 == t[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_50 = 4'h2 == t[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_49); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_51 = 4'h3 == t[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_50); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_52 = 4'h4 == t[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_51); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_53 = 4'h5 == t[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_52); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_54 = 4'h6 == t[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_53); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_55 = 4'h7 == t[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_54); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_56 = 4'h8 == t[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_55); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_57 = 4'h9 == t[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_56); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_58 = 4'ha == t[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_57); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_59 = 4'hb == t[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_58); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_60 = 4'hc == t[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_59); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_61 = 4'hd == t[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_60); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_62 = 4'he == t[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_61); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_65 = 3'h1 == w_idx[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_66 = 3'h2 == w_idx[2:0] ? $signed(32'shb505) : $signed(_GEN_65); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_67 = 3'h3 == w_idx[2:0] ? $signed(32'shec83) : $signed(_GEN_66); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_68 = 3'h4 == w_idx[2:0] ? $signed(32'sh10000) : $signed(_GEN_67); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_69 = 3'h5 == w_idx[2:0] ? $signed(32'shec83) : $signed(_GEN_68); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_70 = 3'h6 == w_idx[2:0] ? $signed(32'shb505) : $signed(_GEN_69); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_73 = 3'h1 == w_idx[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_74 = 3'h2 == w_idx[2:0] ? $signed(32'shb505) : $signed(_GEN_73); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_75 = 3'h3 == w_idx[2:0] ? $signed(32'sh61f8) : $signed(_GEN_74); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_76 = 3'h4 == w_idx[2:0] ? $signed(32'sh0) : $signed(_GEN_75); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_77 = 3'h5 == w_idx[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_76); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_78 = 3'h6 == w_idx[2:0] ? $signed(-32'shb505) : $signed(_GEN_77); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_real = butterflys_0_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_80 = 4'h0 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_81 = 4'h1 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_82 = 4'h2 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_83 = 4'h3 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_84 = 4'h4 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_85 = 4'h5 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_86 = 4'h6 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_87 = 4'h7 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_88 = 4'h8 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_89 = 4'h9 == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_90 = 4'ha == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_91 = 4'hb == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_92 = 4'hc == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_93 = 4'hd == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_94 = 4'he == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_95 = 4'hf == k_s[3:0] ? $signed(_outVec_T_real) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _outVec_T_imag = butterflys_0_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_96 = 4'h0 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_97 = 4'h1 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_98 = 4'h2 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_99 = 4'h3 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_100 = 4'h4 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_101 = 4'h5 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_102 = 4'h6 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_103 = 4'h7 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_104 = 4'h8 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_105 = 4'h9 == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_106 = 4'ha == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_107 = 4'hb == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_108 = 4'hc == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_109 = 4'hd == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_110 = 4'he == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _GEN_111 = 4'hf == k_s[3:0] ? $signed(_outVec_T_imag) : $signed(32'sh0); // @[FFTStage.scala 18:10 50:{17,17}]
  wire [31:0] _outVec_T_1_real = butterflys_0_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_112 = 4'h0 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_80); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_113 = 4'h1 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_81); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_114 = 4'h2 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_82); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_115 = 4'h3 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_83); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_116 = 4'h4 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_84); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_117 = 4'h5 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_85); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_118 = 4'h6 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_86); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_119 = 4'h7 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_87); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_120 = 4'h8 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_88); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_121 = 4'h9 == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_89); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_122 = 4'ha == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_90); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_123 = 4'hb == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_91); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_124 = 4'hc == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_92); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_125 = 4'hd == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_93); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_126 = 4'he == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_94); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_127 = 4'hf == t[3:0] ? $signed(_outVec_T_1_real) : $signed(_GEN_95); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_1_imag = butterflys_0_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_128 = 4'h0 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_96); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_129 = 4'h1 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_97); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_130 = 4'h2 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_98); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_131 = 4'h3 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_99); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_132 = 4'h4 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_100); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_133 = 4'h5 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_101); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_134 = 4'h6 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_102); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_135 = 4'h7 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_103); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_136 = 4'h8 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_104); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_137 = 4'h9 == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_105); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_138 = 4'ha == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_106); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_139 = 4'hb == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_107); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_140 = 4'hc == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_108); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_141 = 4'hd == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_109); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_142 = 4'he == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_110); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_143 = 4'hf == t[3:0] ? $signed(_outVec_T_1_imag) : $signed(_GEN_111); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_1 = 8'h1 & _k_T_4; // @[FFTStage.scala 35:40]
  wire  _k_s_T_7 = 1'h1 >> k_width; // @[FFTStage.scala 36:21]
  wire [7:0] _GEN_15 = {{7'd0}, _k_s_T_7}; // @[FFTStage.scala 36:33]
  wire [7:0] _k_s_T_12 = _GEN_15 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [7:0] k_s_1 = _k_s_T_12 + k_1; // @[FFTStage.scala 36:77]
  wire [7:0] t_1 = k_s_1 + _GEN_1152; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_16 = {{7'd0}, k_1}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_1 = _GEN_16 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_145 = 4'h1 == k_s_1[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_146 = 4'h2 == k_s_1[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_145); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_147 = 4'h3 == k_s_1[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_146); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_148 = 4'h4 == k_s_1[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_147); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_149 = 4'h5 == k_s_1[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_148); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_150 = 4'h6 == k_s_1[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_149); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_151 = 4'h7 == k_s_1[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_150); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_152 = 4'h8 == k_s_1[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_151); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_153 = 4'h9 == k_s_1[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_152); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_154 = 4'ha == k_s_1[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_153); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_155 = 4'hb == k_s_1[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_154); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_156 = 4'hc == k_s_1[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_155); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_157 = 4'hd == k_s_1[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_156); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_158 = 4'he == k_s_1[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_157); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_161 = 4'h1 == k_s_1[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_162 = 4'h2 == k_s_1[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_161); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_163 = 4'h3 == k_s_1[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_162); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_164 = 4'h4 == k_s_1[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_163); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_165 = 4'h5 == k_s_1[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_164); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_166 = 4'h6 == k_s_1[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_165); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_167 = 4'h7 == k_s_1[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_166); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_168 = 4'h8 == k_s_1[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_167); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_169 = 4'h9 == k_s_1[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_168); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_170 = 4'ha == k_s_1[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_169); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_171 = 4'hb == k_s_1[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_170); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_172 = 4'hc == k_s_1[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_171); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_173 = 4'hd == k_s_1[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_172); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_174 = 4'he == k_s_1[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_173); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_177 = 4'h1 == t_1[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_178 = 4'h2 == t_1[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_177); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_179 = 4'h3 == t_1[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_178); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_180 = 4'h4 == t_1[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_179); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_181 = 4'h5 == t_1[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_180); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_182 = 4'h6 == t_1[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_181); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_183 = 4'h7 == t_1[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_182); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_184 = 4'h8 == t_1[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_183); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_185 = 4'h9 == t_1[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_184); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_186 = 4'ha == t_1[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_185); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_187 = 4'hb == t_1[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_186); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_188 = 4'hc == t_1[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_187); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_189 = 4'hd == t_1[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_188); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_190 = 4'he == t_1[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_189); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_193 = 4'h1 == t_1[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_194 = 4'h2 == t_1[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_193); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_195 = 4'h3 == t_1[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_194); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_196 = 4'h4 == t_1[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_195); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_197 = 4'h5 == t_1[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_196); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_198 = 4'h6 == t_1[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_197); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_199 = 4'h7 == t_1[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_198); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_200 = 4'h8 == t_1[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_199); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_201 = 4'h9 == t_1[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_200); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_202 = 4'ha == t_1[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_201); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_203 = 4'hb == t_1[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_202); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_204 = 4'hc == t_1[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_203); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_205 = 4'hd == t_1[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_204); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_206 = 4'he == t_1[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_205); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_209 = 3'h1 == w_idx_1[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_210 = 3'h2 == w_idx_1[2:0] ? $signed(32'shb505) : $signed(_GEN_209); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_211 = 3'h3 == w_idx_1[2:0] ? $signed(32'shec83) : $signed(_GEN_210); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_212 = 3'h4 == w_idx_1[2:0] ? $signed(32'sh10000) : $signed(_GEN_211); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_213 = 3'h5 == w_idx_1[2:0] ? $signed(32'shec83) : $signed(_GEN_212); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_214 = 3'h6 == w_idx_1[2:0] ? $signed(32'shb505) : $signed(_GEN_213); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_217 = 3'h1 == w_idx_1[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_218 = 3'h2 == w_idx_1[2:0] ? $signed(32'shb505) : $signed(_GEN_217); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_219 = 3'h3 == w_idx_1[2:0] ? $signed(32'sh61f8) : $signed(_GEN_218); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_220 = 3'h4 == w_idx_1[2:0] ? $signed(32'sh0) : $signed(_GEN_219); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_221 = 3'h5 == w_idx_1[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_220); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_222 = 3'h6 == w_idx_1[2:0] ? $signed(-32'shb505) : $signed(_GEN_221); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_2_real = butterflys_1_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_224 = 4'h0 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_112); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_225 = 4'h1 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_113); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_226 = 4'h2 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_114); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_227 = 4'h3 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_115); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_228 = 4'h4 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_116); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_229 = 4'h5 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_117); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_230 = 4'h6 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_118); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_231 = 4'h7 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_119); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_232 = 4'h8 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_120); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_233 = 4'h9 == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_121); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_234 = 4'ha == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_122); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_235 = 4'hb == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_123); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_236 = 4'hc == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_124); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_237 = 4'hd == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_125); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_238 = 4'he == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_126); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_239 = 4'hf == k_s_1[3:0] ? $signed(_outVec_T_2_real) : $signed(_GEN_127); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_2_imag = butterflys_1_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_240 = 4'h0 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_128); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_241 = 4'h1 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_129); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_242 = 4'h2 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_130); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_243 = 4'h3 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_131); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_244 = 4'h4 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_132); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_245 = 4'h5 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_133); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_246 = 4'h6 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_134); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_247 = 4'h7 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_135); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_248 = 4'h8 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_136); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_249 = 4'h9 == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_137); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_250 = 4'ha == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_138); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_251 = 4'hb == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_139); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_252 = 4'hc == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_140); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_253 = 4'hd == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_141); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_254 = 4'he == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_142); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_255 = 4'hf == k_s_1[3:0] ? $signed(_outVec_T_2_imag) : $signed(_GEN_143); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_3_real = butterflys_1_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_256 = 4'h0 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_224); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_257 = 4'h1 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_225); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_258 = 4'h2 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_226); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_259 = 4'h3 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_227); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_260 = 4'h4 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_228); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_261 = 4'h5 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_229); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_262 = 4'h6 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_230); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_263 = 4'h7 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_231); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_264 = 4'h8 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_232); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_265 = 4'h9 == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_233); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_266 = 4'ha == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_234); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_267 = 4'hb == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_235); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_268 = 4'hc == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_236); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_269 = 4'hd == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_237); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_270 = 4'he == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_238); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_271 = 4'hf == t_1[3:0] ? $signed(_outVec_T_3_real) : $signed(_GEN_239); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_3_imag = butterflys_1_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_272 = 4'h0 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_240); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_273 = 4'h1 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_241); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_274 = 4'h2 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_242); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_275 = 4'h3 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_243); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_276 = 4'h4 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_244); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_277 = 4'h5 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_245); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_278 = 4'h6 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_246); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_279 = 4'h7 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_247); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_280 = 4'h8 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_248); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_281 = 4'h9 == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_249); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_282 = 4'ha == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_250); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_283 = 4'hb == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_251); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_284 = 4'hc == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_252); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_285 = 4'hd == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_253); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_286 = 4'he == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_254); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_287 = 4'hf == t_1[3:0] ? $signed(_outVec_T_3_imag) : $signed(_GEN_255); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_2 = 8'h2 & _k_T_4; // @[FFTStage.scala 35:40]
  wire [1:0] _k_s_T_14 = 2'h2 >> k_width; // @[FFTStage.scala 36:21]
  wire [8:0] _GEN_31 = {{7'd0}, _k_s_T_14}; // @[FFTStage.scala 36:33]
  wire [8:0] _k_s_T_19 = _GEN_31 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [8:0] _GEN_1154 = {{1'd0}, k_2}; // @[FFTStage.scala 36:77]
  wire [8:0] k_s_2 = _k_s_T_19 + _GEN_1154; // @[FFTStage.scala 36:77]
  wire [8:0] _GEN_1155 = {{4'd0}, _t_T}; // @[FFTStage.scala 37:17]
  wire [8:0] t_2 = k_s_2 + _GEN_1155; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_32 = {{7'd0}, k_2}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_2 = _GEN_32 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_289 = 4'h1 == k_s_2[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_290 = 4'h2 == k_s_2[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_289); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_291 = 4'h3 == k_s_2[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_290); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_292 = 4'h4 == k_s_2[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_291); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_293 = 4'h5 == k_s_2[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_292); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_294 = 4'h6 == k_s_2[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_293); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_295 = 4'h7 == k_s_2[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_294); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_296 = 4'h8 == k_s_2[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_295); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_297 = 4'h9 == k_s_2[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_296); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_298 = 4'ha == k_s_2[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_297); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_299 = 4'hb == k_s_2[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_298); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_300 = 4'hc == k_s_2[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_299); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_301 = 4'hd == k_s_2[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_300); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_302 = 4'he == k_s_2[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_301); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_305 = 4'h1 == k_s_2[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_306 = 4'h2 == k_s_2[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_305); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_307 = 4'h3 == k_s_2[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_306); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_308 = 4'h4 == k_s_2[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_307); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_309 = 4'h5 == k_s_2[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_308); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_310 = 4'h6 == k_s_2[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_309); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_311 = 4'h7 == k_s_2[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_310); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_312 = 4'h8 == k_s_2[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_311); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_313 = 4'h9 == k_s_2[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_312); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_314 = 4'ha == k_s_2[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_313); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_315 = 4'hb == k_s_2[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_314); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_316 = 4'hc == k_s_2[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_315); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_317 = 4'hd == k_s_2[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_316); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_318 = 4'he == k_s_2[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_317); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_321 = 4'h1 == t_2[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_322 = 4'h2 == t_2[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_321); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_323 = 4'h3 == t_2[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_322); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_324 = 4'h4 == t_2[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_323); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_325 = 4'h5 == t_2[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_324); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_326 = 4'h6 == t_2[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_325); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_327 = 4'h7 == t_2[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_326); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_328 = 4'h8 == t_2[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_327); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_329 = 4'h9 == t_2[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_328); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_330 = 4'ha == t_2[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_329); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_331 = 4'hb == t_2[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_330); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_332 = 4'hc == t_2[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_331); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_333 = 4'hd == t_2[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_332); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_334 = 4'he == t_2[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_333); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_337 = 4'h1 == t_2[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_338 = 4'h2 == t_2[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_337); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_339 = 4'h3 == t_2[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_338); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_340 = 4'h4 == t_2[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_339); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_341 = 4'h5 == t_2[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_340); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_342 = 4'h6 == t_2[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_341); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_343 = 4'h7 == t_2[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_342); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_344 = 4'h8 == t_2[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_343); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_345 = 4'h9 == t_2[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_344); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_346 = 4'ha == t_2[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_345); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_347 = 4'hb == t_2[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_346); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_348 = 4'hc == t_2[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_347); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_349 = 4'hd == t_2[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_348); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_350 = 4'he == t_2[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_349); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_353 = 3'h1 == w_idx_2[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_354 = 3'h2 == w_idx_2[2:0] ? $signed(32'shb505) : $signed(_GEN_353); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_355 = 3'h3 == w_idx_2[2:0] ? $signed(32'shec83) : $signed(_GEN_354); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_356 = 3'h4 == w_idx_2[2:0] ? $signed(32'sh10000) : $signed(_GEN_355); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_357 = 3'h5 == w_idx_2[2:0] ? $signed(32'shec83) : $signed(_GEN_356); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_358 = 3'h6 == w_idx_2[2:0] ? $signed(32'shb505) : $signed(_GEN_357); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_361 = 3'h1 == w_idx_2[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_362 = 3'h2 == w_idx_2[2:0] ? $signed(32'shb505) : $signed(_GEN_361); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_363 = 3'h3 == w_idx_2[2:0] ? $signed(32'sh61f8) : $signed(_GEN_362); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_364 = 3'h4 == w_idx_2[2:0] ? $signed(32'sh0) : $signed(_GEN_363); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_365 = 3'h5 == w_idx_2[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_364); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_366 = 3'h6 == w_idx_2[2:0] ? $signed(-32'shb505) : $signed(_GEN_365); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_4_real = butterflys_2_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_368 = 4'h0 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_256); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_369 = 4'h1 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_257); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_370 = 4'h2 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_258); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_371 = 4'h3 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_259); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_372 = 4'h4 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_260); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_373 = 4'h5 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_261); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_374 = 4'h6 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_262); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_375 = 4'h7 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_263); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_376 = 4'h8 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_264); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_377 = 4'h9 == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_265); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_378 = 4'ha == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_266); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_379 = 4'hb == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_267); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_380 = 4'hc == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_268); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_381 = 4'hd == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_269); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_382 = 4'he == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_270); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_383 = 4'hf == k_s_2[3:0] ? $signed(_outVec_T_4_real) : $signed(_GEN_271); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_4_imag = butterflys_2_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_384 = 4'h0 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_272); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_385 = 4'h1 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_273); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_386 = 4'h2 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_274); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_387 = 4'h3 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_275); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_388 = 4'h4 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_276); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_389 = 4'h5 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_277); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_390 = 4'h6 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_278); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_391 = 4'h7 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_279); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_392 = 4'h8 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_280); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_393 = 4'h9 == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_281); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_394 = 4'ha == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_282); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_395 = 4'hb == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_283); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_396 = 4'hc == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_284); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_397 = 4'hd == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_285); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_398 = 4'he == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_286); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_399 = 4'hf == k_s_2[3:0] ? $signed(_outVec_T_4_imag) : $signed(_GEN_287); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_5_real = butterflys_2_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_400 = 4'h0 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_368); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_401 = 4'h1 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_369); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_402 = 4'h2 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_370); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_403 = 4'h3 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_371); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_404 = 4'h4 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_372); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_405 = 4'h5 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_373); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_406 = 4'h6 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_374); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_407 = 4'h7 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_375); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_408 = 4'h8 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_376); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_409 = 4'h9 == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_377); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_410 = 4'ha == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_378); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_411 = 4'hb == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_379); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_412 = 4'hc == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_380); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_413 = 4'hd == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_381); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_414 = 4'he == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_382); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_415 = 4'hf == t_2[3:0] ? $signed(_outVec_T_5_real) : $signed(_GEN_383); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_5_imag = butterflys_2_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_416 = 4'h0 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_384); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_417 = 4'h1 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_385); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_418 = 4'h2 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_386); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_419 = 4'h3 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_387); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_420 = 4'h4 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_388); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_421 = 4'h5 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_389); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_422 = 4'h6 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_390); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_423 = 4'h7 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_391); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_424 = 4'h8 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_392); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_425 = 4'h9 == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_393); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_426 = 4'ha == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_394); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_427 = 4'hb == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_395); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_428 = 4'hc == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_396); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_429 = 4'hd == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_397); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_430 = 4'he == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_398); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_431 = 4'hf == t_2[3:0] ? $signed(_outVec_T_5_imag) : $signed(_GEN_399); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_3 = 8'h3 & _k_T_4; // @[FFTStage.scala 35:40]
  wire [1:0] _k_s_T_21 = 2'h3 >> k_width; // @[FFTStage.scala 36:21]
  wire [8:0] _GEN_47 = {{7'd0}, _k_s_T_21}; // @[FFTStage.scala 36:33]
  wire [8:0] _k_s_T_26 = _GEN_47 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [8:0] _GEN_1156 = {{1'd0}, k_3}; // @[FFTStage.scala 36:77]
  wire [8:0] k_s_3 = _k_s_T_26 + _GEN_1156; // @[FFTStage.scala 36:77]
  wire [8:0] t_3 = k_s_3 + _GEN_1155; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_48 = {{7'd0}, k_3}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_3 = _GEN_48 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_433 = 4'h1 == k_s_3[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_434 = 4'h2 == k_s_3[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_433); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_435 = 4'h3 == k_s_3[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_434); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_436 = 4'h4 == k_s_3[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_435); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_437 = 4'h5 == k_s_3[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_436); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_438 = 4'h6 == k_s_3[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_437); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_439 = 4'h7 == k_s_3[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_438); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_440 = 4'h8 == k_s_3[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_439); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_441 = 4'h9 == k_s_3[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_440); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_442 = 4'ha == k_s_3[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_441); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_443 = 4'hb == k_s_3[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_442); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_444 = 4'hc == k_s_3[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_443); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_445 = 4'hd == k_s_3[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_444); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_446 = 4'he == k_s_3[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_445); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_449 = 4'h1 == k_s_3[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_450 = 4'h2 == k_s_3[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_449); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_451 = 4'h3 == k_s_3[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_450); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_452 = 4'h4 == k_s_3[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_451); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_453 = 4'h5 == k_s_3[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_452); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_454 = 4'h6 == k_s_3[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_453); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_455 = 4'h7 == k_s_3[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_454); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_456 = 4'h8 == k_s_3[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_455); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_457 = 4'h9 == k_s_3[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_456); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_458 = 4'ha == k_s_3[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_457); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_459 = 4'hb == k_s_3[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_458); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_460 = 4'hc == k_s_3[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_459); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_461 = 4'hd == k_s_3[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_460); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_462 = 4'he == k_s_3[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_461); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_465 = 4'h1 == t_3[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_466 = 4'h2 == t_3[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_465); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_467 = 4'h3 == t_3[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_466); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_468 = 4'h4 == t_3[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_467); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_469 = 4'h5 == t_3[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_468); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_470 = 4'h6 == t_3[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_469); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_471 = 4'h7 == t_3[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_470); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_472 = 4'h8 == t_3[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_471); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_473 = 4'h9 == t_3[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_472); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_474 = 4'ha == t_3[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_473); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_475 = 4'hb == t_3[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_474); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_476 = 4'hc == t_3[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_475); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_477 = 4'hd == t_3[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_476); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_478 = 4'he == t_3[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_477); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_481 = 4'h1 == t_3[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_482 = 4'h2 == t_3[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_481); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_483 = 4'h3 == t_3[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_482); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_484 = 4'h4 == t_3[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_483); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_485 = 4'h5 == t_3[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_484); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_486 = 4'h6 == t_3[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_485); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_487 = 4'h7 == t_3[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_486); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_488 = 4'h8 == t_3[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_487); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_489 = 4'h9 == t_3[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_488); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_490 = 4'ha == t_3[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_489); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_491 = 4'hb == t_3[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_490); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_492 = 4'hc == t_3[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_491); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_493 = 4'hd == t_3[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_492); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_494 = 4'he == t_3[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_493); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_497 = 3'h1 == w_idx_3[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_498 = 3'h2 == w_idx_3[2:0] ? $signed(32'shb505) : $signed(_GEN_497); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_499 = 3'h3 == w_idx_3[2:0] ? $signed(32'shec83) : $signed(_GEN_498); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_500 = 3'h4 == w_idx_3[2:0] ? $signed(32'sh10000) : $signed(_GEN_499); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_501 = 3'h5 == w_idx_3[2:0] ? $signed(32'shec83) : $signed(_GEN_500); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_502 = 3'h6 == w_idx_3[2:0] ? $signed(32'shb505) : $signed(_GEN_501); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_505 = 3'h1 == w_idx_3[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_506 = 3'h2 == w_idx_3[2:0] ? $signed(32'shb505) : $signed(_GEN_505); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_507 = 3'h3 == w_idx_3[2:0] ? $signed(32'sh61f8) : $signed(_GEN_506); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_508 = 3'h4 == w_idx_3[2:0] ? $signed(32'sh0) : $signed(_GEN_507); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_509 = 3'h5 == w_idx_3[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_508); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_510 = 3'h6 == w_idx_3[2:0] ? $signed(-32'shb505) : $signed(_GEN_509); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_6_real = butterflys_3_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_512 = 4'h0 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_400); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_513 = 4'h1 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_401); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_514 = 4'h2 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_402); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_515 = 4'h3 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_403); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_516 = 4'h4 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_404); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_517 = 4'h5 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_405); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_518 = 4'h6 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_406); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_519 = 4'h7 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_407); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_520 = 4'h8 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_408); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_521 = 4'h9 == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_409); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_522 = 4'ha == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_410); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_523 = 4'hb == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_411); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_524 = 4'hc == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_412); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_525 = 4'hd == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_413); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_526 = 4'he == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_414); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_527 = 4'hf == k_s_3[3:0] ? $signed(_outVec_T_6_real) : $signed(_GEN_415); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_6_imag = butterflys_3_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_528 = 4'h0 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_416); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_529 = 4'h1 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_417); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_530 = 4'h2 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_418); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_531 = 4'h3 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_419); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_532 = 4'h4 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_420); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_533 = 4'h5 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_421); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_534 = 4'h6 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_422); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_535 = 4'h7 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_423); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_536 = 4'h8 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_424); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_537 = 4'h9 == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_425); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_538 = 4'ha == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_426); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_539 = 4'hb == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_427); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_540 = 4'hc == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_428); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_541 = 4'hd == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_429); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_542 = 4'he == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_430); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_543 = 4'hf == k_s_3[3:0] ? $signed(_outVec_T_6_imag) : $signed(_GEN_431); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_7_real = butterflys_3_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_544 = 4'h0 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_512); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_545 = 4'h1 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_513); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_546 = 4'h2 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_514); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_547 = 4'h3 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_515); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_548 = 4'h4 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_516); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_549 = 4'h5 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_517); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_550 = 4'h6 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_518); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_551 = 4'h7 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_519); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_552 = 4'h8 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_520); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_553 = 4'h9 == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_521); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_554 = 4'ha == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_522); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_555 = 4'hb == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_523); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_556 = 4'hc == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_524); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_557 = 4'hd == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_525); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_558 = 4'he == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_526); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_559 = 4'hf == t_3[3:0] ? $signed(_outVec_T_7_real) : $signed(_GEN_527); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_7_imag = butterflys_3_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_560 = 4'h0 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_528); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_561 = 4'h1 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_529); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_562 = 4'h2 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_530); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_563 = 4'h3 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_531); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_564 = 4'h4 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_532); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_565 = 4'h5 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_533); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_566 = 4'h6 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_534); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_567 = 4'h7 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_535); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_568 = 4'h8 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_536); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_569 = 4'h9 == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_537); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_570 = 4'ha == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_538); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_571 = 4'hb == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_539); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_572 = 4'hc == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_540); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_573 = 4'hd == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_541); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_574 = 4'he == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_542); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_575 = 4'hf == t_3[3:0] ? $signed(_outVec_T_7_imag) : $signed(_GEN_543); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_4 = 8'h4 & _k_T_4; // @[FFTStage.scala 35:40]
  wire [2:0] _k_s_T_28 = 3'h4 >> k_width; // @[FFTStage.scala 36:21]
  wire [9:0] _GEN_63 = {{7'd0}, _k_s_T_28}; // @[FFTStage.scala 36:33]
  wire [9:0] _k_s_T_33 = _GEN_63 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [9:0] _GEN_1158 = {{2'd0}, k_4}; // @[FFTStage.scala 36:77]
  wire [9:0] k_s_4 = _k_s_T_33 + _GEN_1158; // @[FFTStage.scala 36:77]
  wire [9:0] _GEN_1159 = {{5'd0}, _t_T}; // @[FFTStage.scala 37:17]
  wire [9:0] t_4 = k_s_4 + _GEN_1159; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_64 = {{7'd0}, k_4}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_4 = _GEN_64 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_577 = 4'h1 == k_s_4[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_578 = 4'h2 == k_s_4[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_577); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_579 = 4'h3 == k_s_4[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_578); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_580 = 4'h4 == k_s_4[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_579); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_581 = 4'h5 == k_s_4[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_580); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_582 = 4'h6 == k_s_4[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_581); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_583 = 4'h7 == k_s_4[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_582); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_584 = 4'h8 == k_s_4[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_583); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_585 = 4'h9 == k_s_4[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_584); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_586 = 4'ha == k_s_4[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_585); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_587 = 4'hb == k_s_4[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_586); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_588 = 4'hc == k_s_4[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_587); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_589 = 4'hd == k_s_4[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_588); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_590 = 4'he == k_s_4[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_589); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_593 = 4'h1 == k_s_4[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_594 = 4'h2 == k_s_4[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_593); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_595 = 4'h3 == k_s_4[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_594); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_596 = 4'h4 == k_s_4[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_595); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_597 = 4'h5 == k_s_4[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_596); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_598 = 4'h6 == k_s_4[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_597); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_599 = 4'h7 == k_s_4[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_598); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_600 = 4'h8 == k_s_4[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_599); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_601 = 4'h9 == k_s_4[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_600); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_602 = 4'ha == k_s_4[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_601); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_603 = 4'hb == k_s_4[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_602); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_604 = 4'hc == k_s_4[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_603); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_605 = 4'hd == k_s_4[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_604); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_606 = 4'he == k_s_4[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_605); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_609 = 4'h1 == t_4[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_610 = 4'h2 == t_4[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_609); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_611 = 4'h3 == t_4[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_610); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_612 = 4'h4 == t_4[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_611); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_613 = 4'h5 == t_4[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_612); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_614 = 4'h6 == t_4[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_613); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_615 = 4'h7 == t_4[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_614); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_616 = 4'h8 == t_4[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_615); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_617 = 4'h9 == t_4[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_616); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_618 = 4'ha == t_4[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_617); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_619 = 4'hb == t_4[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_618); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_620 = 4'hc == t_4[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_619); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_621 = 4'hd == t_4[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_620); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_622 = 4'he == t_4[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_621); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_625 = 4'h1 == t_4[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_626 = 4'h2 == t_4[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_625); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_627 = 4'h3 == t_4[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_626); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_628 = 4'h4 == t_4[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_627); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_629 = 4'h5 == t_4[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_628); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_630 = 4'h6 == t_4[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_629); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_631 = 4'h7 == t_4[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_630); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_632 = 4'h8 == t_4[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_631); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_633 = 4'h9 == t_4[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_632); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_634 = 4'ha == t_4[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_633); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_635 = 4'hb == t_4[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_634); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_636 = 4'hc == t_4[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_635); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_637 = 4'hd == t_4[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_636); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_638 = 4'he == t_4[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_637); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_641 = 3'h1 == w_idx_4[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_642 = 3'h2 == w_idx_4[2:0] ? $signed(32'shb505) : $signed(_GEN_641); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_643 = 3'h3 == w_idx_4[2:0] ? $signed(32'shec83) : $signed(_GEN_642); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_644 = 3'h4 == w_idx_4[2:0] ? $signed(32'sh10000) : $signed(_GEN_643); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_645 = 3'h5 == w_idx_4[2:0] ? $signed(32'shec83) : $signed(_GEN_644); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_646 = 3'h6 == w_idx_4[2:0] ? $signed(32'shb505) : $signed(_GEN_645); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_649 = 3'h1 == w_idx_4[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_650 = 3'h2 == w_idx_4[2:0] ? $signed(32'shb505) : $signed(_GEN_649); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_651 = 3'h3 == w_idx_4[2:0] ? $signed(32'sh61f8) : $signed(_GEN_650); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_652 = 3'h4 == w_idx_4[2:0] ? $signed(32'sh0) : $signed(_GEN_651); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_653 = 3'h5 == w_idx_4[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_652); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_654 = 3'h6 == w_idx_4[2:0] ? $signed(-32'shb505) : $signed(_GEN_653); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_8_real = butterflys_4_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_656 = 4'h0 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_544); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_657 = 4'h1 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_545); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_658 = 4'h2 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_546); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_659 = 4'h3 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_547); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_660 = 4'h4 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_548); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_661 = 4'h5 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_549); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_662 = 4'h6 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_550); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_663 = 4'h7 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_551); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_664 = 4'h8 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_552); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_665 = 4'h9 == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_553); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_666 = 4'ha == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_554); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_667 = 4'hb == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_555); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_668 = 4'hc == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_556); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_669 = 4'hd == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_557); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_670 = 4'he == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_558); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_671 = 4'hf == k_s_4[3:0] ? $signed(_outVec_T_8_real) : $signed(_GEN_559); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_8_imag = butterflys_4_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_672 = 4'h0 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_560); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_673 = 4'h1 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_561); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_674 = 4'h2 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_562); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_675 = 4'h3 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_563); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_676 = 4'h4 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_564); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_677 = 4'h5 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_565); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_678 = 4'h6 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_566); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_679 = 4'h7 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_567); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_680 = 4'h8 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_568); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_681 = 4'h9 == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_569); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_682 = 4'ha == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_570); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_683 = 4'hb == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_571); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_684 = 4'hc == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_572); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_685 = 4'hd == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_573); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_686 = 4'he == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_574); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_687 = 4'hf == k_s_4[3:0] ? $signed(_outVec_T_8_imag) : $signed(_GEN_575); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_9_real = butterflys_4_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_688 = 4'h0 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_656); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_689 = 4'h1 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_657); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_690 = 4'h2 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_658); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_691 = 4'h3 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_659); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_692 = 4'h4 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_660); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_693 = 4'h5 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_661); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_694 = 4'h6 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_662); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_695 = 4'h7 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_663); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_696 = 4'h8 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_664); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_697 = 4'h9 == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_665); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_698 = 4'ha == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_666); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_699 = 4'hb == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_667); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_700 = 4'hc == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_668); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_701 = 4'hd == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_669); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_702 = 4'he == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_670); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_703 = 4'hf == t_4[3:0] ? $signed(_outVec_T_9_real) : $signed(_GEN_671); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_9_imag = butterflys_4_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_704 = 4'h0 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_672); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_705 = 4'h1 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_673); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_706 = 4'h2 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_674); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_707 = 4'h3 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_675); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_708 = 4'h4 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_676); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_709 = 4'h5 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_677); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_710 = 4'h6 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_678); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_711 = 4'h7 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_679); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_712 = 4'h8 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_680); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_713 = 4'h9 == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_681); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_714 = 4'ha == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_682); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_715 = 4'hb == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_683); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_716 = 4'hc == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_684); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_717 = 4'hd == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_685); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_718 = 4'he == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_686); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_719 = 4'hf == t_4[3:0] ? $signed(_outVec_T_9_imag) : $signed(_GEN_687); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_5 = 8'h5 & _k_T_4; // @[FFTStage.scala 35:40]
  wire [2:0] _k_s_T_35 = 3'h5 >> k_width; // @[FFTStage.scala 36:21]
  wire [9:0] _GEN_71 = {{7'd0}, _k_s_T_35}; // @[FFTStage.scala 36:33]
  wire [9:0] _k_s_T_40 = _GEN_71 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [9:0] _GEN_1160 = {{2'd0}, k_5}; // @[FFTStage.scala 36:77]
  wire [9:0] k_s_5 = _k_s_T_40 + _GEN_1160; // @[FFTStage.scala 36:77]
  wire [9:0] t_5 = k_s_5 + _GEN_1159; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_72 = {{7'd0}, k_5}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_5 = _GEN_72 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_721 = 4'h1 == k_s_5[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_722 = 4'h2 == k_s_5[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_721); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_723 = 4'h3 == k_s_5[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_722); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_724 = 4'h4 == k_s_5[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_723); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_725 = 4'h5 == k_s_5[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_724); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_726 = 4'h6 == k_s_5[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_725); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_727 = 4'h7 == k_s_5[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_726); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_728 = 4'h8 == k_s_5[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_727); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_729 = 4'h9 == k_s_5[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_728); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_730 = 4'ha == k_s_5[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_729); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_731 = 4'hb == k_s_5[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_730); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_732 = 4'hc == k_s_5[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_731); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_733 = 4'hd == k_s_5[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_732); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_734 = 4'he == k_s_5[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_733); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_737 = 4'h1 == k_s_5[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_738 = 4'h2 == k_s_5[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_737); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_739 = 4'h3 == k_s_5[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_738); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_740 = 4'h4 == k_s_5[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_739); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_741 = 4'h5 == k_s_5[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_740); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_742 = 4'h6 == k_s_5[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_741); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_743 = 4'h7 == k_s_5[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_742); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_744 = 4'h8 == k_s_5[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_743); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_745 = 4'h9 == k_s_5[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_744); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_746 = 4'ha == k_s_5[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_745); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_747 = 4'hb == k_s_5[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_746); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_748 = 4'hc == k_s_5[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_747); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_749 = 4'hd == k_s_5[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_748); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_750 = 4'he == k_s_5[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_749); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_753 = 4'h1 == t_5[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_754 = 4'h2 == t_5[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_753); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_755 = 4'h3 == t_5[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_754); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_756 = 4'h4 == t_5[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_755); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_757 = 4'h5 == t_5[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_756); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_758 = 4'h6 == t_5[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_757); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_759 = 4'h7 == t_5[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_758); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_760 = 4'h8 == t_5[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_759); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_761 = 4'h9 == t_5[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_760); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_762 = 4'ha == t_5[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_761); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_763 = 4'hb == t_5[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_762); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_764 = 4'hc == t_5[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_763); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_765 = 4'hd == t_5[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_764); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_766 = 4'he == t_5[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_765); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_769 = 4'h1 == t_5[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_770 = 4'h2 == t_5[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_769); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_771 = 4'h3 == t_5[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_770); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_772 = 4'h4 == t_5[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_771); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_773 = 4'h5 == t_5[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_772); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_774 = 4'h6 == t_5[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_773); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_775 = 4'h7 == t_5[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_774); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_776 = 4'h8 == t_5[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_775); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_777 = 4'h9 == t_5[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_776); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_778 = 4'ha == t_5[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_777); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_779 = 4'hb == t_5[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_778); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_780 = 4'hc == t_5[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_779); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_781 = 4'hd == t_5[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_780); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_782 = 4'he == t_5[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_781); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_785 = 3'h1 == w_idx_5[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_786 = 3'h2 == w_idx_5[2:0] ? $signed(32'shb505) : $signed(_GEN_785); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_787 = 3'h3 == w_idx_5[2:0] ? $signed(32'shec83) : $signed(_GEN_786); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_788 = 3'h4 == w_idx_5[2:0] ? $signed(32'sh10000) : $signed(_GEN_787); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_789 = 3'h5 == w_idx_5[2:0] ? $signed(32'shec83) : $signed(_GEN_788); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_790 = 3'h6 == w_idx_5[2:0] ? $signed(32'shb505) : $signed(_GEN_789); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_793 = 3'h1 == w_idx_5[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_794 = 3'h2 == w_idx_5[2:0] ? $signed(32'shb505) : $signed(_GEN_793); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_795 = 3'h3 == w_idx_5[2:0] ? $signed(32'sh61f8) : $signed(_GEN_794); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_796 = 3'h4 == w_idx_5[2:0] ? $signed(32'sh0) : $signed(_GEN_795); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_797 = 3'h5 == w_idx_5[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_796); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_798 = 3'h6 == w_idx_5[2:0] ? $signed(-32'shb505) : $signed(_GEN_797); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_10_real = butterflys_5_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_800 = 4'h0 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_688); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_801 = 4'h1 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_689); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_802 = 4'h2 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_690); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_803 = 4'h3 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_691); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_804 = 4'h4 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_692); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_805 = 4'h5 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_693); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_806 = 4'h6 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_694); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_807 = 4'h7 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_695); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_808 = 4'h8 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_696); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_809 = 4'h9 == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_697); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_810 = 4'ha == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_698); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_811 = 4'hb == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_699); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_812 = 4'hc == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_700); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_813 = 4'hd == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_701); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_814 = 4'he == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_702); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_815 = 4'hf == k_s_5[3:0] ? $signed(_outVec_T_10_real) : $signed(_GEN_703); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_10_imag = butterflys_5_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_816 = 4'h0 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_704); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_817 = 4'h1 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_705); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_818 = 4'h2 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_706); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_819 = 4'h3 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_707); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_820 = 4'h4 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_708); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_821 = 4'h5 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_709); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_822 = 4'h6 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_710); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_823 = 4'h7 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_711); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_824 = 4'h8 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_712); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_825 = 4'h9 == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_713); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_826 = 4'ha == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_714); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_827 = 4'hb == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_715); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_828 = 4'hc == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_716); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_829 = 4'hd == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_717); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_830 = 4'he == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_718); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_831 = 4'hf == k_s_5[3:0] ? $signed(_outVec_T_10_imag) : $signed(_GEN_719); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_11_real = butterflys_5_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_832 = 4'h0 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_800); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_833 = 4'h1 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_801); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_834 = 4'h2 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_802); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_835 = 4'h3 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_803); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_836 = 4'h4 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_804); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_837 = 4'h5 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_805); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_838 = 4'h6 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_806); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_839 = 4'h7 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_807); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_840 = 4'h8 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_808); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_841 = 4'h9 == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_809); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_842 = 4'ha == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_810); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_843 = 4'hb == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_811); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_844 = 4'hc == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_812); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_845 = 4'hd == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_813); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_846 = 4'he == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_814); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_847 = 4'hf == t_5[3:0] ? $signed(_outVec_T_11_real) : $signed(_GEN_815); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_11_imag = butterflys_5_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_848 = 4'h0 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_816); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_849 = 4'h1 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_817); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_850 = 4'h2 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_818); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_851 = 4'h3 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_819); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_852 = 4'h4 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_820); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_853 = 4'h5 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_821); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_854 = 4'h6 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_822); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_855 = 4'h7 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_823); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_856 = 4'h8 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_824); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_857 = 4'h9 == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_825); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_858 = 4'ha == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_826); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_859 = 4'hb == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_827); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_860 = 4'hc == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_828); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_861 = 4'hd == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_829); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_862 = 4'he == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_830); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_863 = 4'hf == t_5[3:0] ? $signed(_outVec_T_11_imag) : $signed(_GEN_831); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_6 = 8'h6 & _k_T_4; // @[FFTStage.scala 35:40]
  wire [2:0] _k_s_T_42 = 3'h6 >> k_width; // @[FFTStage.scala 36:21]
  wire [9:0] _GEN_79 = {{7'd0}, _k_s_T_42}; // @[FFTStage.scala 36:33]
  wire [9:0] _k_s_T_47 = _GEN_79 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [9:0] _GEN_1162 = {{2'd0}, k_6}; // @[FFTStage.scala 36:77]
  wire [9:0] k_s_6 = _k_s_T_47 + _GEN_1162; // @[FFTStage.scala 36:77]
  wire [9:0] t_6 = k_s_6 + _GEN_1159; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_144 = {{7'd0}, k_6}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_6 = _GEN_144 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_865 = 4'h1 == k_s_6[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_866 = 4'h2 == k_s_6[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_865); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_867 = 4'h3 == k_s_6[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_866); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_868 = 4'h4 == k_s_6[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_867); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_869 = 4'h5 == k_s_6[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_868); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_870 = 4'h6 == k_s_6[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_869); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_871 = 4'h7 == k_s_6[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_870); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_872 = 4'h8 == k_s_6[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_871); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_873 = 4'h9 == k_s_6[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_872); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_874 = 4'ha == k_s_6[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_873); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_875 = 4'hb == k_s_6[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_874); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_876 = 4'hc == k_s_6[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_875); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_877 = 4'hd == k_s_6[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_876); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_878 = 4'he == k_s_6[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_877); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_881 = 4'h1 == k_s_6[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_882 = 4'h2 == k_s_6[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_881); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_883 = 4'h3 == k_s_6[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_882); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_884 = 4'h4 == k_s_6[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_883); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_885 = 4'h5 == k_s_6[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_884); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_886 = 4'h6 == k_s_6[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_885); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_887 = 4'h7 == k_s_6[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_886); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_888 = 4'h8 == k_s_6[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_887); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_889 = 4'h9 == k_s_6[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_888); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_890 = 4'ha == k_s_6[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_889); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_891 = 4'hb == k_s_6[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_890); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_892 = 4'hc == k_s_6[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_891); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_893 = 4'hd == k_s_6[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_892); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_894 = 4'he == k_s_6[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_893); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_897 = 4'h1 == t_6[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_898 = 4'h2 == t_6[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_897); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_899 = 4'h3 == t_6[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_898); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_900 = 4'h4 == t_6[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_899); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_901 = 4'h5 == t_6[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_900); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_902 = 4'h6 == t_6[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_901); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_903 = 4'h7 == t_6[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_902); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_904 = 4'h8 == t_6[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_903); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_905 = 4'h9 == t_6[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_904); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_906 = 4'ha == t_6[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_905); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_907 = 4'hb == t_6[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_906); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_908 = 4'hc == t_6[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_907); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_909 = 4'hd == t_6[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_908); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_910 = 4'he == t_6[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_909); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_913 = 4'h1 == t_6[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_914 = 4'h2 == t_6[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_913); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_915 = 4'h3 == t_6[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_914); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_916 = 4'h4 == t_6[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_915); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_917 = 4'h5 == t_6[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_916); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_918 = 4'h6 == t_6[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_917); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_919 = 4'h7 == t_6[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_918); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_920 = 4'h8 == t_6[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_919); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_921 = 4'h9 == t_6[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_920); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_922 = 4'ha == t_6[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_921); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_923 = 4'hb == t_6[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_922); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_924 = 4'hc == t_6[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_923); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_925 = 4'hd == t_6[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_924); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_926 = 4'he == t_6[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_925); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_929 = 3'h1 == w_idx_6[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_930 = 3'h2 == w_idx_6[2:0] ? $signed(32'shb505) : $signed(_GEN_929); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_931 = 3'h3 == w_idx_6[2:0] ? $signed(32'shec83) : $signed(_GEN_930); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_932 = 3'h4 == w_idx_6[2:0] ? $signed(32'sh10000) : $signed(_GEN_931); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_933 = 3'h5 == w_idx_6[2:0] ? $signed(32'shec83) : $signed(_GEN_932); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_934 = 3'h6 == w_idx_6[2:0] ? $signed(32'shb505) : $signed(_GEN_933); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_937 = 3'h1 == w_idx_6[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_938 = 3'h2 == w_idx_6[2:0] ? $signed(32'shb505) : $signed(_GEN_937); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_939 = 3'h3 == w_idx_6[2:0] ? $signed(32'sh61f8) : $signed(_GEN_938); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_940 = 3'h4 == w_idx_6[2:0] ? $signed(32'sh0) : $signed(_GEN_939); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_941 = 3'h5 == w_idx_6[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_940); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_942 = 3'h6 == w_idx_6[2:0] ? $signed(-32'shb505) : $signed(_GEN_941); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_12_real = butterflys_6_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_944 = 4'h0 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_832); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_945 = 4'h1 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_833); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_946 = 4'h2 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_834); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_947 = 4'h3 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_835); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_948 = 4'h4 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_836); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_949 = 4'h5 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_837); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_950 = 4'h6 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_838); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_951 = 4'h7 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_839); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_952 = 4'h8 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_840); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_953 = 4'h9 == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_841); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_954 = 4'ha == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_842); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_955 = 4'hb == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_843); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_956 = 4'hc == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_844); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_957 = 4'hd == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_845); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_958 = 4'he == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_846); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_959 = 4'hf == k_s_6[3:0] ? $signed(_outVec_T_12_real) : $signed(_GEN_847); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_12_imag = butterflys_6_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_960 = 4'h0 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_848); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_961 = 4'h1 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_849); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_962 = 4'h2 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_850); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_963 = 4'h3 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_851); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_964 = 4'h4 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_852); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_965 = 4'h5 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_853); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_966 = 4'h6 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_854); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_967 = 4'h7 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_855); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_968 = 4'h8 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_856); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_969 = 4'h9 == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_857); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_970 = 4'ha == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_858); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_971 = 4'hb == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_859); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_972 = 4'hc == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_860); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_973 = 4'hd == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_861); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_974 = 4'he == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_862); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_975 = 4'hf == k_s_6[3:0] ? $signed(_outVec_T_12_imag) : $signed(_GEN_863); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_13_real = butterflys_6_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_976 = 4'h0 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_944); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_977 = 4'h1 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_945); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_978 = 4'h2 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_946); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_979 = 4'h3 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_947); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_980 = 4'h4 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_948); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_981 = 4'h5 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_949); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_982 = 4'h6 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_950); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_983 = 4'h7 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_951); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_984 = 4'h8 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_952); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_985 = 4'h9 == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_953); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_986 = 4'ha == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_954); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_987 = 4'hb == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_955); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_988 = 4'hc == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_956); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_989 = 4'hd == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_957); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_990 = 4'he == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_958); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_991 = 4'hf == t_6[3:0] ? $signed(_outVec_T_13_real) : $signed(_GEN_959); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_13_imag = butterflys_6_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_992 = 4'h0 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_960); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_993 = 4'h1 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_961); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_994 = 4'h2 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_962); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_995 = 4'h3 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_963); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_996 = 4'h4 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_964); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_997 = 4'h5 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_965); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_998 = 4'h6 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_966); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_999 = 4'h7 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_967); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1000 = 4'h8 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_968); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1001 = 4'h9 == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_969); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1002 = 4'ha == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_970); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1003 = 4'hb == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_971); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1004 = 4'hc == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_972); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1005 = 4'hd == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_973); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1006 = 4'he == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_974); // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _GEN_1007 = 4'hf == t_6[3:0] ? $signed(_outVec_T_13_imag) : $signed(_GEN_975); // @[FFTStage.scala 51:{15,15}]
  wire [7:0] k_7 = 8'h7 & _k_T_4; // @[FFTStage.scala 35:40]
  wire [2:0] _k_s_T_49 = 3'h7 >> k_width; // @[FFTStage.scala 36:21]
  wire [9:0] _GEN_159 = {{7'd0}, _k_s_T_49}; // @[FFTStage.scala 36:33]
  wire [9:0] _k_s_T_54 = _GEN_159 << _k_s_T_4; // @[FFTStage.scala 36:33]
  wire [9:0] _GEN_1164 = {{2'd0}, k_7}; // @[FFTStage.scala 36:77]
  wire [9:0] k_s_7 = _k_s_T_54 + _GEN_1164; // @[FFTStage.scala 36:77]
  wire [9:0] t_7 = k_s_7 + _GEN_1159; // @[FFTStage.scala 37:17]
  wire [14:0] _GEN_160 = {{7'd0}, k_7}; // @[FFTStage.scala 38:19]
  wire [14:0] w_idx_7 = _GEN_160 << _k_s_T_2; // @[FFTStage.scala 38:19]
  wire [31:0] _GEN_1009 = 4'h1 == k_s_7[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1010 = 4'h2 == k_s_7[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_1009); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1011 = 4'h3 == k_s_7[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_1010); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1012 = 4'h4 == k_s_7[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_1011); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1013 = 4'h5 == k_s_7[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_1012); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1014 = 4'h6 == k_s_7[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_1013); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1015 = 4'h7 == k_s_7[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_1014); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1016 = 4'h8 == k_s_7[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_1015); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1017 = 4'h9 == k_s_7[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_1016); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1018 = 4'ha == k_s_7[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_1017); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1019 = 4'hb == k_s_7[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_1018); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1020 = 4'hc == k_s_7[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_1019); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1021 = 4'hd == k_s_7[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_1020); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1022 = 4'he == k_s_7[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_1021); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1025 = 4'h1 == k_s_7[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1026 = 4'h2 == k_s_7[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_1025); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1027 = 4'h3 == k_s_7[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_1026); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1028 = 4'h4 == k_s_7[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_1027); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1029 = 4'h5 == k_s_7[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_1028); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1030 = 4'h6 == k_s_7[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_1029); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1031 = 4'h7 == k_s_7[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_1030); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1032 = 4'h8 == k_s_7[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_1031); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1033 = 4'h9 == k_s_7[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_1032); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1034 = 4'ha == k_s_7[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_1033); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1035 = 4'hb == k_s_7[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_1034); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1036 = 4'hc == k_s_7[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_1035); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1037 = 4'hd == k_s_7[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_1036); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1038 = 4'he == k_s_7[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_1037); // @[FFTStage.scala 41:{28,28}]
  wire [31:0] _GEN_1041 = 4'h1 == t_7[3:0] ? $signed(io_in_bits_1_imag) : $signed(io_in_bits_0_imag); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1042 = 4'h2 == t_7[3:0] ? $signed(io_in_bits_2_imag) : $signed(_GEN_1041); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1043 = 4'h3 == t_7[3:0] ? $signed(io_in_bits_3_imag) : $signed(_GEN_1042); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1044 = 4'h4 == t_7[3:0] ? $signed(io_in_bits_4_imag) : $signed(_GEN_1043); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1045 = 4'h5 == t_7[3:0] ? $signed(io_in_bits_5_imag) : $signed(_GEN_1044); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1046 = 4'h6 == t_7[3:0] ? $signed(io_in_bits_6_imag) : $signed(_GEN_1045); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1047 = 4'h7 == t_7[3:0] ? $signed(io_in_bits_7_imag) : $signed(_GEN_1046); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1048 = 4'h8 == t_7[3:0] ? $signed(io_in_bits_8_imag) : $signed(_GEN_1047); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1049 = 4'h9 == t_7[3:0] ? $signed(io_in_bits_9_imag) : $signed(_GEN_1048); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1050 = 4'ha == t_7[3:0] ? $signed(io_in_bits_10_imag) : $signed(_GEN_1049); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1051 = 4'hb == t_7[3:0] ? $signed(io_in_bits_11_imag) : $signed(_GEN_1050); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1052 = 4'hc == t_7[3:0] ? $signed(io_in_bits_12_imag) : $signed(_GEN_1051); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1053 = 4'hd == t_7[3:0] ? $signed(io_in_bits_13_imag) : $signed(_GEN_1052); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1054 = 4'he == t_7[3:0] ? $signed(io_in_bits_14_imag) : $signed(_GEN_1053); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1057 = 4'h1 == t_7[3:0] ? $signed(io_in_bits_1_real) : $signed(io_in_bits_0_real); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1058 = 4'h2 == t_7[3:0] ? $signed(io_in_bits_2_real) : $signed(_GEN_1057); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1059 = 4'h3 == t_7[3:0] ? $signed(io_in_bits_3_real) : $signed(_GEN_1058); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1060 = 4'h4 == t_7[3:0] ? $signed(io_in_bits_4_real) : $signed(_GEN_1059); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1061 = 4'h5 == t_7[3:0] ? $signed(io_in_bits_5_real) : $signed(_GEN_1060); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1062 = 4'h6 == t_7[3:0] ? $signed(io_in_bits_6_real) : $signed(_GEN_1061); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1063 = 4'h7 == t_7[3:0] ? $signed(io_in_bits_7_real) : $signed(_GEN_1062); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1064 = 4'h8 == t_7[3:0] ? $signed(io_in_bits_8_real) : $signed(_GEN_1063); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1065 = 4'h9 == t_7[3:0] ? $signed(io_in_bits_9_real) : $signed(_GEN_1064); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1066 = 4'ha == t_7[3:0] ? $signed(io_in_bits_10_real) : $signed(_GEN_1065); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1067 = 4'hb == t_7[3:0] ? $signed(io_in_bits_11_real) : $signed(_GEN_1066); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1068 = 4'hc == t_7[3:0] ? $signed(io_in_bits_12_real) : $signed(_GEN_1067); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1069 = 4'hd == t_7[3:0] ? $signed(io_in_bits_13_real) : $signed(_GEN_1068); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1070 = 4'he == t_7[3:0] ? $signed(io_in_bits_14_real) : $signed(_GEN_1069); // @[FFTStage.scala 42:{26,26}]
  wire [31:0] _GEN_1073 = 3'h1 == w_idx_7[2:0] ? $signed(32'sh61f8) : $signed(32'sh0); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1074 = 3'h2 == w_idx_7[2:0] ? $signed(32'shb505) : $signed(_GEN_1073); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1075 = 3'h3 == w_idx_7[2:0] ? $signed(32'shec83) : $signed(_GEN_1074); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1076 = 3'h4 == w_idx_7[2:0] ? $signed(32'sh10000) : $signed(_GEN_1075); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1077 = 3'h5 == w_idx_7[2:0] ? $signed(32'shec83) : $signed(_GEN_1076); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1078 = 3'h6 == w_idx_7[2:0] ? $signed(32'shb505) : $signed(_GEN_1077); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1081 = 3'h1 == w_idx_7[2:0] ? $signed(32'shec83) : $signed(32'sh10000); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1082 = 3'h2 == w_idx_7[2:0] ? $signed(32'shb505) : $signed(_GEN_1081); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1083 = 3'h3 == w_idx_7[2:0] ? $signed(32'sh61f8) : $signed(_GEN_1082); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1084 = 3'h4 == w_idx_7[2:0] ? $signed(32'sh0) : $signed(_GEN_1083); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1085 = 3'h5 == w_idx_7[2:0] ? $signed(-32'sh61f8) : $signed(_GEN_1084); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _GEN_1086 = 3'h6 == w_idx_7[2:0] ? $signed(-32'shb505) : $signed(_GEN_1085); // @[FFTStage.scala 43:{24,24}]
  wire [31:0] _outVec_T_14_real = butterflys_7_io_out_0_real; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1088 = 4'h0 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_976); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1089 = 4'h1 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_977); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1090 = 4'h2 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_978); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1091 = 4'h3 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_979); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1092 = 4'h4 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_980); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1093 = 4'h5 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_981); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1094 = 4'h6 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_982); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1095 = 4'h7 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_983); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1096 = 4'h8 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_984); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1097 = 4'h9 == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_985); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1098 = 4'ha == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_986); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1099 = 4'hb == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_987); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1100 = 4'hc == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_988); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1101 = 4'hd == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_989); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1102 = 4'he == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_990); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1103 = 4'hf == k_s_7[3:0] ? $signed(_outVec_T_14_real) : $signed(_GEN_991); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_14_imag = butterflys_7_io_out_0_imag; // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1104 = 4'h0 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_992); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1105 = 4'h1 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_993); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1106 = 4'h2 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_994); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1107 = 4'h3 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_995); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1108 = 4'h4 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_996); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1109 = 4'h5 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_997); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1110 = 4'h6 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_998); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1111 = 4'h7 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_999); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1112 = 4'h8 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1000); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1113 = 4'h9 == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1001); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1114 = 4'ha == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1002); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1115 = 4'hb == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1003); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1116 = 4'hc == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1004); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1117 = 4'hd == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1005); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1118 = 4'he == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1006); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _GEN_1119 = 4'hf == k_s_7[3:0] ? $signed(_outVec_T_14_imag) : $signed(_GEN_1007); // @[FFTStage.scala 50:{17,17}]
  wire [31:0] _outVec_T_15_real = butterflys_7_io_out_1_real; // @[FFTStage.scala 51:{15,15}]
  wire [31:0] _outVec_T_15_imag = butterflys_7_io_out_1_imag; // @[FFTStage.scala 51:{15,15}]
  ButterflyUnit butterflys_0 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_0_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_0_io_x_k_s_imag),
    .io_x_t_real(butterflys_0_io_x_t_real),
    .io_x_t_imag(butterflys_0_io_x_t_imag),
    .io_w_real(butterflys_0_io_w_real),
    .io_w_imag(butterflys_0_io_w_imag),
    .io_out_0_real(butterflys_0_io_out_0_real),
    .io_out_0_imag(butterflys_0_io_out_0_imag),
    .io_out_1_real(butterflys_0_io_out_1_real),
    .io_out_1_imag(butterflys_0_io_out_1_imag)
  );
  ButterflyUnit butterflys_1 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_1_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_1_io_x_k_s_imag),
    .io_x_t_real(butterflys_1_io_x_t_real),
    .io_x_t_imag(butterflys_1_io_x_t_imag),
    .io_w_real(butterflys_1_io_w_real),
    .io_w_imag(butterflys_1_io_w_imag),
    .io_out_0_real(butterflys_1_io_out_0_real),
    .io_out_0_imag(butterflys_1_io_out_0_imag),
    .io_out_1_real(butterflys_1_io_out_1_real),
    .io_out_1_imag(butterflys_1_io_out_1_imag)
  );
  ButterflyUnit butterflys_2 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_2_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_2_io_x_k_s_imag),
    .io_x_t_real(butterflys_2_io_x_t_real),
    .io_x_t_imag(butterflys_2_io_x_t_imag),
    .io_w_real(butterflys_2_io_w_real),
    .io_w_imag(butterflys_2_io_w_imag),
    .io_out_0_real(butterflys_2_io_out_0_real),
    .io_out_0_imag(butterflys_2_io_out_0_imag),
    .io_out_1_real(butterflys_2_io_out_1_real),
    .io_out_1_imag(butterflys_2_io_out_1_imag)
  );
  ButterflyUnit butterflys_3 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_3_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_3_io_x_k_s_imag),
    .io_x_t_real(butterflys_3_io_x_t_real),
    .io_x_t_imag(butterflys_3_io_x_t_imag),
    .io_w_real(butterflys_3_io_w_real),
    .io_w_imag(butterflys_3_io_w_imag),
    .io_out_0_real(butterflys_3_io_out_0_real),
    .io_out_0_imag(butterflys_3_io_out_0_imag),
    .io_out_1_real(butterflys_3_io_out_1_real),
    .io_out_1_imag(butterflys_3_io_out_1_imag)
  );
  ButterflyUnit butterflys_4 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_4_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_4_io_x_k_s_imag),
    .io_x_t_real(butterflys_4_io_x_t_real),
    .io_x_t_imag(butterflys_4_io_x_t_imag),
    .io_w_real(butterflys_4_io_w_real),
    .io_w_imag(butterflys_4_io_w_imag),
    .io_out_0_real(butterflys_4_io_out_0_real),
    .io_out_0_imag(butterflys_4_io_out_0_imag),
    .io_out_1_real(butterflys_4_io_out_1_real),
    .io_out_1_imag(butterflys_4_io_out_1_imag)
  );
  ButterflyUnit butterflys_5 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_5_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_5_io_x_k_s_imag),
    .io_x_t_real(butterflys_5_io_x_t_real),
    .io_x_t_imag(butterflys_5_io_x_t_imag),
    .io_w_real(butterflys_5_io_w_real),
    .io_w_imag(butterflys_5_io_w_imag),
    .io_out_0_real(butterflys_5_io_out_0_real),
    .io_out_0_imag(butterflys_5_io_out_0_imag),
    .io_out_1_real(butterflys_5_io_out_1_real),
    .io_out_1_imag(butterflys_5_io_out_1_imag)
  );
  ButterflyUnit butterflys_6 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_6_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_6_io_x_k_s_imag),
    .io_x_t_real(butterflys_6_io_x_t_real),
    .io_x_t_imag(butterflys_6_io_x_t_imag),
    .io_w_real(butterflys_6_io_w_real),
    .io_w_imag(butterflys_6_io_w_imag),
    .io_out_0_real(butterflys_6_io_out_0_real),
    .io_out_0_imag(butterflys_6_io_out_0_imag),
    .io_out_1_real(butterflys_6_io_out_1_real),
    .io_out_1_imag(butterflys_6_io_out_1_imag)
  );
  ButterflyUnit butterflys_7 ( // @[FFTStage.scala 31:41]
    .io_x_k_s_real(butterflys_7_io_x_k_s_real),
    .io_x_k_s_imag(butterflys_7_io_x_k_s_imag),
    .io_x_t_real(butterflys_7_io_x_t_real),
    .io_x_t_imag(butterflys_7_io_x_t_imag),
    .io_w_real(butterflys_7_io_w_real),
    .io_w_imag(butterflys_7_io_w_imag),
    .io_out_0_real(butterflys_7_io_out_0_real),
    .io_out_0_imag(butterflys_7_io_out_0_imag),
    .io_out_1_real(butterflys_7_io_out_1_real),
    .io_out_1_imag(butterflys_7_io_out_1_imag)
  );
  assign io_out_bits_0_real = 4'h0 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1088); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_0_imag = 4'h0 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1104); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_1_real = 4'h1 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1089); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_1_imag = 4'h1 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1105); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_2_real = 4'h2 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1090); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_2_imag = 4'h2 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1106); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_3_real = 4'h3 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1091); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_3_imag = 4'h3 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1107); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_4_real = 4'h4 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1092); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_4_imag = 4'h4 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1108); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_5_real = 4'h5 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1093); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_5_imag = 4'h5 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1109); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_6_real = 4'h6 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1094); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_6_imag = 4'h6 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1110); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_7_real = 4'h7 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1095); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_7_imag = 4'h7 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1111); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_8_real = 4'h8 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1096); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_8_imag = 4'h8 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1112); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_9_real = 4'h9 == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1097); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_9_imag = 4'h9 == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1113); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_10_real = 4'ha == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1098); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_10_imag = 4'ha == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1114); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_11_real = 4'hb == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1099); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_11_imag = 4'hb == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1115); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_12_real = 4'hc == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1100); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_12_imag = 4'hc == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1116); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_13_real = 4'hd == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1101); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_13_imag = 4'hd == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1117); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_14_real = 4'he == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1102); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_14_imag = 4'he == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1118); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_15_real = 4'hf == t_7[3:0] ? $signed(_outVec_T_15_real) : $signed(_GEN_1103); // @[FFTStage.scala 51:{15,15}]
  assign io_out_bits_15_imag = 4'hf == t_7[3:0] ? $signed(_outVec_T_15_imag) : $signed(_GEN_1119); // @[FFTStage.scala 51:{15,15}]
  assign butterflys_0_io_x_k_s_real = 4'hf == k_s[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_30); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_0_io_x_k_s_imag = 4'hf == k_s[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_14); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_0_io_x_t_real = 4'hf == t[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_62); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_0_io_x_t_imag = 4'hf == t[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_46); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_0_io_w_real = 3'h7 == w_idx[2:0] ? $signed(-32'shec83) : $signed(_GEN_78); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_0_io_w_imag = 3'h7 == w_idx[2:0] ? $signed(32'sh61f8) : $signed(_GEN_70); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_1_io_x_k_s_real = 4'hf == k_s_1[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_174); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_1_io_x_k_s_imag = 4'hf == k_s_1[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_158); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_1_io_x_t_real = 4'hf == t_1[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_206); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_1_io_x_t_imag = 4'hf == t_1[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_190); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_1_io_w_real = 3'h7 == w_idx_1[2:0] ? $signed(-32'shec83) : $signed(_GEN_222); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_1_io_w_imag = 3'h7 == w_idx_1[2:0] ? $signed(32'sh61f8) : $signed(_GEN_214); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_2_io_x_k_s_real = 4'hf == k_s_2[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_318); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_2_io_x_k_s_imag = 4'hf == k_s_2[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_302); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_2_io_x_t_real = 4'hf == t_2[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_350); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_2_io_x_t_imag = 4'hf == t_2[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_334); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_2_io_w_real = 3'h7 == w_idx_2[2:0] ? $signed(-32'shec83) : $signed(_GEN_366); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_2_io_w_imag = 3'h7 == w_idx_2[2:0] ? $signed(32'sh61f8) : $signed(_GEN_358); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_3_io_x_k_s_real = 4'hf == k_s_3[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_462); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_3_io_x_k_s_imag = 4'hf == k_s_3[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_446); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_3_io_x_t_real = 4'hf == t_3[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_494); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_3_io_x_t_imag = 4'hf == t_3[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_478); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_3_io_w_real = 3'h7 == w_idx_3[2:0] ? $signed(-32'shec83) : $signed(_GEN_510); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_3_io_w_imag = 3'h7 == w_idx_3[2:0] ? $signed(32'sh61f8) : $signed(_GEN_502); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_4_io_x_k_s_real = 4'hf == k_s_4[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_606); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_4_io_x_k_s_imag = 4'hf == k_s_4[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_590); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_4_io_x_t_real = 4'hf == t_4[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_638); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_4_io_x_t_imag = 4'hf == t_4[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_622); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_4_io_w_real = 3'h7 == w_idx_4[2:0] ? $signed(-32'shec83) : $signed(_GEN_654); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_4_io_w_imag = 3'h7 == w_idx_4[2:0] ? $signed(32'sh61f8) : $signed(_GEN_646); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_5_io_x_k_s_real = 4'hf == k_s_5[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_750); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_5_io_x_k_s_imag = 4'hf == k_s_5[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_734); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_5_io_x_t_real = 4'hf == t_5[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_782); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_5_io_x_t_imag = 4'hf == t_5[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_766); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_5_io_w_real = 3'h7 == w_idx_5[2:0] ? $signed(-32'shec83) : $signed(_GEN_798); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_5_io_w_imag = 3'h7 == w_idx_5[2:0] ? $signed(32'sh61f8) : $signed(_GEN_790); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_6_io_x_k_s_real = 4'hf == k_s_6[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_894); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_6_io_x_k_s_imag = 4'hf == k_s_6[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_878); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_6_io_x_t_real = 4'hf == t_6[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_926); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_6_io_x_t_imag = 4'hf == t_6[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_910); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_6_io_w_real = 3'h7 == w_idx_6[2:0] ? $signed(-32'shec83) : $signed(_GEN_942); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_6_io_w_imag = 3'h7 == w_idx_6[2:0] ? $signed(32'sh61f8) : $signed(_GEN_934); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_7_io_x_k_s_real = 4'hf == k_s_7[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_1038); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_7_io_x_k_s_imag = 4'hf == k_s_7[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_1022); // @[FFTStage.scala 41:{28,28}]
  assign butterflys_7_io_x_t_real = 4'hf == t_7[3:0] ? $signed(io_in_bits_15_real) : $signed(_GEN_1070); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_7_io_x_t_imag = 4'hf == t_7[3:0] ? $signed(io_in_bits_15_imag) : $signed(_GEN_1054); // @[FFTStage.scala 42:{26,26}]
  assign butterflys_7_io_w_real = 3'h7 == w_idx_7[2:0] ? $signed(-32'shec83) : $signed(_GEN_1086); // @[FFTStage.scala 43:{24,24}]
  assign butterflys_7_io_w_imag = 3'h7 == w_idx_7[2:0] ? $signed(32'sh61f8) : $signed(_GEN_1078); // @[FFTStage.scala 43:{24,24}]
endmodule
module FFT(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_0,
  input  [31:0] io_in_bits_1,
  input  [31:0] io_in_bits_2,
  input  [31:0] io_in_bits_3,
  input  [31:0] io_in_bits_4,
  input  [31:0] io_in_bits_5,
  input  [31:0] io_in_bits_6,
  input  [31:0] io_in_bits_7,
  input  [31:0] io_in_bits_8,
  input  [31:0] io_in_bits_9,
  input  [31:0] io_in_bits_10,
  input  [31:0] io_in_bits_11,
  input  [31:0] io_in_bits_12,
  input  [31:0] io_in_bits_13,
  input  [31:0] io_in_bits_14,
  input  [31:0] io_in_bits_15,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_0_real,
  output [31:0] io_out_bits_0_imag,
  output [31:0] io_out_bits_1_real,
  output [31:0] io_out_bits_1_imag,
  output [31:0] io_out_bits_2_real,
  output [31:0] io_out_bits_2_imag,
  output [31:0] io_out_bits_3_real,
  output [31:0] io_out_bits_3_imag,
  output [31:0] io_out_bits_4_real,
  output [31:0] io_out_bits_4_imag,
  output [31:0] io_out_bits_5_real,
  output [31:0] io_out_bits_5_imag,
  output [31:0] io_out_bits_6_real,
  output [31:0] io_out_bits_6_imag,
  output [31:0] io_out_bits_7_real,
  output [31:0] io_out_bits_7_imag,
  output [31:0] io_out_bits_8_real,
  output [31:0] io_out_bits_8_imag,
  output [31:0] io_out_bits_9_real,
  output [31:0] io_out_bits_9_imag,
  output [31:0] io_out_bits_10_real,
  output [31:0] io_out_bits_10_imag,
  output [31:0] io_out_bits_11_real,
  output [31:0] io_out_bits_11_imag,
  output [31:0] io_out_bits_12_real,
  output [31:0] io_out_bits_12_imag,
  output [31:0] io_out_bits_13_real,
  output [31:0] io_out_bits_13_imag,
  output [31:0] io_out_bits_14_real,
  output [31:0] io_out_bits_14_imag,
  output [31:0] io_out_bits_15_real,
  output [31:0] io_out_bits_15_imag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] fftStage_io_in_bits_0_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_0_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_1_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_1_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_2_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_2_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_3_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_3_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_4_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_4_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_5_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_5_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_6_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_6_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_7_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_7_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_8_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_8_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_9_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_9_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_10_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_10_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_11_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_11_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_12_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_12_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_13_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_13_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_14_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_14_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_15_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_in_bits_15_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_0_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_0_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_1_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_1_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_2_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_2_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_3_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_3_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_4_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_4_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_5_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_5_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_6_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_6_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_7_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_7_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_8_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_8_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_9_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_9_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_10_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_10_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_11_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_11_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_12_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_12_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_13_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_13_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_14_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_14_imag; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_15_real; // @[FFT.scala 23:24]
  wire [31:0] fftStage_io_out_bits_15_imag; // @[FFT.scala 23:24]
  wire [2:0] fftStage_io_stage; // @[FFT.scala 23:24]
  reg [31:0] fft_input_reg_0_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_0_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_1_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_1_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_2_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_2_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_3_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_3_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_4_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_4_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_5_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_5_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_6_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_6_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_7_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_7_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_8_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_8_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_9_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_9_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_10_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_10_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_11_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_11_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_12_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_12_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_13_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_13_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_14_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_14_imag; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_15_real; // @[FFT.scala 21:26]
  reg [31:0] fft_input_reg_15_imag; // @[FFT.scala 21:26]
  reg [2:0] stage; // @[FFT.scala 26:22]
  reg [1:0] state; // @[FFT.scala 28:22]
  wire [31:0] fft_out_0_real = fftStage_io_out_bits_0_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_16 = fftStage_io_out_bits_0_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_0_imag = 32'sh0 - $signed(_GEN_16); // @[FFT.scala 39:24]
  wire [31:0] fft_out_1_real = fftStage_io_out_bits_8_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_56 = fftStage_io_out_bits_8_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_1_imag = 32'sh0 - $signed(_GEN_56); // @[FFT.scala 39:24]
  wire [31:0] fft_out_2_real = fftStage_io_out_bits_4_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_84 = fftStage_io_out_bits_4_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_2_imag = 32'sh0 - $signed(_GEN_84); // @[FFT.scala 39:24]
  wire [31:0] fft_out_3_real = fftStage_io_out_bits_12_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_124 = fftStage_io_out_bits_12_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_3_imag = 32'sh0 - $signed(_GEN_124); // @[FFT.scala 39:24]
  wire [31:0] fft_out_4_real = fftStage_io_out_bits_2_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_146 = fftStage_io_out_bits_2_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_4_imag = 32'sh0 - $signed(_GEN_146); // @[FFT.scala 39:24]
  wire [31:0] fft_out_5_real = fftStage_io_out_bits_10_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_186 = fftStage_io_out_bits_10_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_5_imag = 32'sh0 - $signed(_GEN_186); // @[FFT.scala 39:24]
  wire [31:0] fft_out_6_real = fftStage_io_out_bits_6_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_214 = fftStage_io_out_bits_6_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_6_imag = 32'sh0 - $signed(_GEN_214); // @[FFT.scala 39:24]
  wire [31:0] fft_out_7_real = fftStage_io_out_bits_14_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_254 = fftStage_io_out_bits_14_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_7_imag = 32'sh0 - $signed(_GEN_254); // @[FFT.scala 39:24]
  wire [31:0] fft_out_8_real = fftStage_io_out_bits_1_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_273 = fftStage_io_out_bits_1_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_8_imag = 32'sh0 - $signed(_GEN_273); // @[FFT.scala 39:24]
  wire [31:0] fft_out_9_real = fftStage_io_out_bits_9_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_313 = fftStage_io_out_bits_9_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_9_imag = 32'sh0 - $signed(_GEN_313); // @[FFT.scala 39:24]
  wire [31:0] fft_out_10_real = fftStage_io_out_bits_5_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_341 = fftStage_io_out_bits_5_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_10_imag = 32'sh0 - $signed(_GEN_341); // @[FFT.scala 39:24]
  wire [31:0] fft_out_11_real = fftStage_io_out_bits_13_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_381 = fftStage_io_out_bits_13_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_11_imag = 32'sh0 - $signed(_GEN_381); // @[FFT.scala 39:24]
  wire [31:0] fft_out_12_real = fftStage_io_out_bits_3_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_403 = fftStage_io_out_bits_3_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_12_imag = 32'sh0 - $signed(_GEN_403); // @[FFT.scala 39:24]
  wire [31:0] fft_out_13_real = fftStage_io_out_bits_11_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_443 = fftStage_io_out_bits_11_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_13_imag = 32'sh0 - $signed(_GEN_443); // @[FFT.scala 39:24]
  wire [31:0] fft_out_14_real = fftStage_io_out_bits_7_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_471 = fftStage_io_out_bits_7_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_14_imag = 32'sh0 - $signed(_GEN_471); // @[FFT.scala 39:24]
  wire [31:0] fft_out_15_real = fftStage_io_out_bits_15_real; // @[FFT.scala 38:{21,21}]
  wire [31:0] _GEN_511 = fftStage_io_out_bits_15_imag; // @[FFT.scala 39:{24,24}]
  wire [31:0] fft_out_15_imag = 32'sh0 - $signed(_GEN_511); // @[FFT.scala 39:24]
  wire [2:0] _T_3 = 3'h4 - 3'h1; // @[FFT.scala 61:36]
  wire [2:0] _stage_T_1 = stage + 3'h1; // @[FFT.scala 68:22]
  wire [1:0] _GEN_515 = io_out_ready ? 2'h0 : 2'h2; // @[FFT.scala 74:26 75:15 78:15]
  wire [2:0] _GEN_516 = io_out_ready ? 3'h0 : stage; // @[FFT.scala 74:26 76:15 79:15]
  wire  _GEN_521 = 2'h1 == state ? 1'h0 : 2'h2 == state; // @[FFT.scala 47:18 59:20]
  FFTStage fftStage ( // @[FFT.scala 23:24]
    .io_in_bits_0_real(fftStage_io_in_bits_0_real),
    .io_in_bits_0_imag(fftStage_io_in_bits_0_imag),
    .io_in_bits_1_real(fftStage_io_in_bits_1_real),
    .io_in_bits_1_imag(fftStage_io_in_bits_1_imag),
    .io_in_bits_2_real(fftStage_io_in_bits_2_real),
    .io_in_bits_2_imag(fftStage_io_in_bits_2_imag),
    .io_in_bits_3_real(fftStage_io_in_bits_3_real),
    .io_in_bits_3_imag(fftStage_io_in_bits_3_imag),
    .io_in_bits_4_real(fftStage_io_in_bits_4_real),
    .io_in_bits_4_imag(fftStage_io_in_bits_4_imag),
    .io_in_bits_5_real(fftStage_io_in_bits_5_real),
    .io_in_bits_5_imag(fftStage_io_in_bits_5_imag),
    .io_in_bits_6_real(fftStage_io_in_bits_6_real),
    .io_in_bits_6_imag(fftStage_io_in_bits_6_imag),
    .io_in_bits_7_real(fftStage_io_in_bits_7_real),
    .io_in_bits_7_imag(fftStage_io_in_bits_7_imag),
    .io_in_bits_8_real(fftStage_io_in_bits_8_real),
    .io_in_bits_8_imag(fftStage_io_in_bits_8_imag),
    .io_in_bits_9_real(fftStage_io_in_bits_9_real),
    .io_in_bits_9_imag(fftStage_io_in_bits_9_imag),
    .io_in_bits_10_real(fftStage_io_in_bits_10_real),
    .io_in_bits_10_imag(fftStage_io_in_bits_10_imag),
    .io_in_bits_11_real(fftStage_io_in_bits_11_real),
    .io_in_bits_11_imag(fftStage_io_in_bits_11_imag),
    .io_in_bits_12_real(fftStage_io_in_bits_12_real),
    .io_in_bits_12_imag(fftStage_io_in_bits_12_imag),
    .io_in_bits_13_real(fftStage_io_in_bits_13_real),
    .io_in_bits_13_imag(fftStage_io_in_bits_13_imag),
    .io_in_bits_14_real(fftStage_io_in_bits_14_real),
    .io_in_bits_14_imag(fftStage_io_in_bits_14_imag),
    .io_in_bits_15_real(fftStage_io_in_bits_15_real),
    .io_in_bits_15_imag(fftStage_io_in_bits_15_imag),
    .io_out_bits_0_real(fftStage_io_out_bits_0_real),
    .io_out_bits_0_imag(fftStage_io_out_bits_0_imag),
    .io_out_bits_1_real(fftStage_io_out_bits_1_real),
    .io_out_bits_1_imag(fftStage_io_out_bits_1_imag),
    .io_out_bits_2_real(fftStage_io_out_bits_2_real),
    .io_out_bits_2_imag(fftStage_io_out_bits_2_imag),
    .io_out_bits_3_real(fftStage_io_out_bits_3_real),
    .io_out_bits_3_imag(fftStage_io_out_bits_3_imag),
    .io_out_bits_4_real(fftStage_io_out_bits_4_real),
    .io_out_bits_4_imag(fftStage_io_out_bits_4_imag),
    .io_out_bits_5_real(fftStage_io_out_bits_5_real),
    .io_out_bits_5_imag(fftStage_io_out_bits_5_imag),
    .io_out_bits_6_real(fftStage_io_out_bits_6_real),
    .io_out_bits_6_imag(fftStage_io_out_bits_6_imag),
    .io_out_bits_7_real(fftStage_io_out_bits_7_real),
    .io_out_bits_7_imag(fftStage_io_out_bits_7_imag),
    .io_out_bits_8_real(fftStage_io_out_bits_8_real),
    .io_out_bits_8_imag(fftStage_io_out_bits_8_imag),
    .io_out_bits_9_real(fftStage_io_out_bits_9_real),
    .io_out_bits_9_imag(fftStage_io_out_bits_9_imag),
    .io_out_bits_10_real(fftStage_io_out_bits_10_real),
    .io_out_bits_10_imag(fftStage_io_out_bits_10_imag),
    .io_out_bits_11_real(fftStage_io_out_bits_11_real),
    .io_out_bits_11_imag(fftStage_io_out_bits_11_imag),
    .io_out_bits_12_real(fftStage_io_out_bits_12_real),
    .io_out_bits_12_imag(fftStage_io_out_bits_12_imag),
    .io_out_bits_13_real(fftStage_io_out_bits_13_real),
    .io_out_bits_13_imag(fftStage_io_out_bits_13_imag),
    .io_out_bits_14_real(fftStage_io_out_bits_14_real),
    .io_out_bits_14_imag(fftStage_io_out_bits_14_imag),
    .io_out_bits_15_real(fftStage_io_out_bits_15_real),
    .io_out_bits_15_imag(fftStage_io_out_bits_15_imag),
    .io_stage(fftStage_io_stage)
  );
  assign io_in_ready = 2'h0 == state; // @[FFT.scala 47:18]
  assign io_out_valid = 2'h0 == state ? 1'h0 : _GEN_521; // @[FFT.scala 47:18 50:20]
  assign io_out_bits_0_real = io_out_valid ? $signed(fft_out_0_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_0_imag = io_out_valid ? $signed(fft_out_0_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_1_real = io_out_valid ? $signed(fft_out_1_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_1_imag = io_out_valid ? $signed(fft_out_1_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_2_real = io_out_valid ? $signed(fft_out_2_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_2_imag = io_out_valid ? $signed(fft_out_2_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_3_real = io_out_valid ? $signed(fft_out_3_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_3_imag = io_out_valid ? $signed(fft_out_3_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_4_real = io_out_valid ? $signed(fft_out_4_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_4_imag = io_out_valid ? $signed(fft_out_4_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_5_real = io_out_valid ? $signed(fft_out_5_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_5_imag = io_out_valid ? $signed(fft_out_5_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_6_real = io_out_valid ? $signed(fft_out_6_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_6_imag = io_out_valid ? $signed(fft_out_6_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_7_real = io_out_valid ? $signed(fft_out_7_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_7_imag = io_out_valid ? $signed(fft_out_7_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_8_real = io_out_valid ? $signed(fft_out_8_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_8_imag = io_out_valid ? $signed(fft_out_8_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_9_real = io_out_valid ? $signed(fft_out_9_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_9_imag = io_out_valid ? $signed(fft_out_9_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_10_real = io_out_valid ? $signed(fft_out_10_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_10_imag = io_out_valid ? $signed(fft_out_10_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_11_real = io_out_valid ? $signed(fft_out_11_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_11_imag = io_out_valid ? $signed(fft_out_11_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_12_real = io_out_valid ? $signed(fft_out_12_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_12_imag = io_out_valid ? $signed(fft_out_12_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_13_real = io_out_valid ? $signed(fft_out_13_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_13_imag = io_out_valid ? $signed(fft_out_13_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_14_real = io_out_valid ? $signed(fft_out_14_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_14_imag = io_out_valid ? $signed(fft_out_14_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_15_real = io_out_valid ? $signed(fft_out_15_real) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign io_out_bits_15_imag = io_out_valid ? $signed(fft_out_15_imag) : $signed(32'sh0); // @[FFT.scala 41:26]
  assign fftStage_io_in_bits_0_real = fft_input_reg_0_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_0_imag = fft_input_reg_0_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_1_real = fft_input_reg_1_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_1_imag = fft_input_reg_1_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_2_real = fft_input_reg_2_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_2_imag = fft_input_reg_2_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_3_real = fft_input_reg_3_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_3_imag = fft_input_reg_3_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_4_real = fft_input_reg_4_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_4_imag = fft_input_reg_4_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_5_real = fft_input_reg_5_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_5_imag = fft_input_reg_5_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_6_real = fft_input_reg_6_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_6_imag = fft_input_reg_6_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_7_real = fft_input_reg_7_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_7_imag = fft_input_reg_7_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_8_real = fft_input_reg_8_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_8_imag = fft_input_reg_8_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_9_real = fft_input_reg_9_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_9_imag = fft_input_reg_9_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_10_real = fft_input_reg_10_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_10_imag = fft_input_reg_10_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_11_real = fft_input_reg_11_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_11_imag = fft_input_reg_11_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_12_real = fft_input_reg_12_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_12_imag = fft_input_reg_12_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_13_real = fft_input_reg_13_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_13_imag = fft_input_reg_13_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_14_real = fft_input_reg_14_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_14_imag = fft_input_reg_14_imag; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_15_real = fft_input_reg_15_real; // @[FFT.scala 36:23]
  assign fftStage_io_in_bits_15_imag = fft_input_reg_15_imag; // @[FFT.scala 36:23]
  assign fftStage_io_stage = stage; // @[FFT.scala 43:21]
  always @(posedge clock) begin
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_0_real <= io_in_bits_0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_0_real <= fftStage_io_out_bits_0_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_0_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_0_imag <= fftStage_io_out_bits_0_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_1_real <= io_in_bits_1;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_1_real <= fftStage_io_out_bits_1_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_1_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_1_imag <= fftStage_io_out_bits_1_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_2_real <= io_in_bits_2;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_2_real <= fftStage_io_out_bits_2_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_2_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_2_imag <= fftStage_io_out_bits_2_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_3_real <= io_in_bits_3;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_3_real <= fftStage_io_out_bits_3_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_3_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_3_imag <= fftStage_io_out_bits_3_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_4_real <= io_in_bits_4;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_4_real <= fftStage_io_out_bits_4_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_4_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_4_imag <= fftStage_io_out_bits_4_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_5_real <= io_in_bits_5;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_5_real <= fftStage_io_out_bits_5_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_5_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_5_imag <= fftStage_io_out_bits_5_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_6_real <= io_in_bits_6;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_6_real <= fftStage_io_out_bits_6_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_6_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_6_imag <= fftStage_io_out_bits_6_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_7_real <= io_in_bits_7;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_7_real <= fftStage_io_out_bits_7_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_7_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_7_imag <= fftStage_io_out_bits_7_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_8_real <= io_in_bits_8;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_8_real <= fftStage_io_out_bits_8_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_8_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_8_imag <= fftStage_io_out_bits_8_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_9_real <= io_in_bits_9;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_9_real <= fftStage_io_out_bits_9_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_9_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_9_imag <= fftStage_io_out_bits_9_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_10_real <= io_in_bits_10;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_10_real <= fftStage_io_out_bits_10_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_10_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_10_imag <= fftStage_io_out_bits_10_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_11_real <= io_in_bits_11;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_11_real <= fftStage_io_out_bits_11_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_11_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_11_imag <= fftStage_io_out_bits_11_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_12_real <= io_in_bits_12;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_12_real <= fftStage_io_out_bits_12_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_12_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_12_imag <= fftStage_io_out_bits_12_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_13_real <= io_in_bits_13;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_13_real <= fftStage_io_out_bits_13_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_13_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_13_imag <= fftStage_io_out_bits_13_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_14_real <= io_in_bits_14;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_14_real <= fftStage_io_out_bits_14_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_14_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_14_imag <= fftStage_io_out_bits_14_imag;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_15_real <= io_in_bits_15;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_15_real <= fftStage_io_out_bits_15_real;
    end
    if (stage == 3'h0) begin // @[FFT.scala 40:28]
      fft_input_reg_15_imag <= 32'sh0;
    end else if (!(io_out_valid)) begin // @[FFT.scala 40:61]
      fft_input_reg_15_imag <= fftStage_io_out_bits_15_imag;
    end
    if (reset) begin // @[FFT.scala 26:22]
      stage <= 3'h0; // @[FFT.scala 26:22]
    end else if (2'h0 == state) begin // @[FFT.scala 47:18]
      if (io_in_valid) begin // @[FFT.scala 52:25]
        stage <= 3'h1; // @[FFT.scala 54:15]
      end
    end else if (2'h1 == state) begin // @[FFT.scala 47:18]
      stage <= _stage_T_1; // @[FFT.scala 68:13]
    end else if (2'h2 == state) begin // @[FFT.scala 47:18]
      stage <= _GEN_516;
    end
    if (reset) begin // @[FFT.scala 28:22]
      state <= 2'h0; // @[FFT.scala 28:22]
    end else if (2'h0 == state) begin // @[FFT.scala 47:18]
      if (io_in_valid) begin // @[FFT.scala 52:25]
        state <= 2'h1; // @[FFT.scala 53:15]
      end
    end else if (2'h1 == state) begin // @[FFT.scala 47:18]
      if (stage != _T_3) begin // @[FFT.scala 61:43]
        state <= 2'h1; // @[FFT.scala 63:15]
      end else begin
        state <= 2'h2; // @[FFT.scala 66:15]
      end
    end else if (2'h2 == state) begin // @[FFT.scala 47:18]
      state <= _GEN_515;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  fft_input_reg_0_real = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  fft_input_reg_0_imag = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  fft_input_reg_1_real = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  fft_input_reg_1_imag = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  fft_input_reg_2_real = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  fft_input_reg_2_imag = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  fft_input_reg_3_real = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  fft_input_reg_3_imag = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  fft_input_reg_4_real = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  fft_input_reg_4_imag = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  fft_input_reg_5_real = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  fft_input_reg_5_imag = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  fft_input_reg_6_real = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  fft_input_reg_6_imag = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  fft_input_reg_7_real = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  fft_input_reg_7_imag = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  fft_input_reg_8_real = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  fft_input_reg_8_imag = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  fft_input_reg_9_real = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  fft_input_reg_9_imag = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  fft_input_reg_10_real = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  fft_input_reg_10_imag = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  fft_input_reg_11_real = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  fft_input_reg_11_imag = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  fft_input_reg_12_real = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  fft_input_reg_12_imag = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  fft_input_reg_13_real = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  fft_input_reg_13_imag = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  fft_input_reg_14_real = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  fft_input_reg_14_imag = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  fft_input_reg_15_real = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  fft_input_reg_15_imag = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stage = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  state = _RAND_33[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
