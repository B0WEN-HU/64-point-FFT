`timescale 1ns/10ps
module c_m_para_0 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w - {{6{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:6]};
assign tmp_data_re_2_w = {{4{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:4]} + tmp_data_re_0_w;
assign data_out_0 = tmp_data_re_2_w - {{4{tmp_data_re_2_w[LENGTH]}},tmp_data_re_2_w[LENGTH:4]};

assign tmp_data_im_1_w = tmp_data_im_0_w + {{2{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:2]};
assign tmp_data_im_2_w = {{6{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:6]} + tmp_data_im_1_w;
assign tmp_data_im_3_w = {{2{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:2]} + tmp_data_im_1_w;
assign data_out_1 = {{4{tmp_data_im_3_w[LENGTH]}},tmp_data_im_3_w[LENGTH:4]};

endmodule

module c_m_para_1 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w + {{2{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:2]};
assign tmp_data_re_2_w = tmp_data_re_1_w - {{6{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:6]};
assign data_out_0 = tmp_data_re_0_w - {{6{tmp_data_re_2_w[LENGTH]}},tmp_data_re_2_w[LENGTH:6]};

assign tmp_data_im_1_w = tmp_data_im_0_w + {{4{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:4]};
assign tmp_data_im_2_w = tmp_data_im_1_w - {{4{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:4]};
assign tmp_data_im_3_w = {{1{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:1]} + tmp_data_im_1_w;
assign data_out_1 = {{3{tmp_data_im_3_w[LENGTH]}},tmp_data_im_3_w[LENGTH:3]};

endmodule

module c_m_para_2 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;
wire [LENGTH:0] tmp_data_im_4_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w - {{5{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:5]};
assign tmp_data_re_2_w = tmp_data_re_1_w + {{8{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:8]};
assign data_out_0 = tmp_data_re_2_w - {{6{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:6]};

assign tmp_data_im_1_w = tmp_data_im_0_w - {{2{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:2]};
assign tmp_data_im_2_w = tmp_data_im_1_w + {{5{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:5]};
assign tmp_data_im_3_w = tmp_data_im_1_w - {{3{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:3]};
assign tmp_data_im_4_w = tmp_data_im_3_w + {{1{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:1]};
assign data_out_1 = {{2{tmp_data_im_4_w[LENGTH]}},tmp_data_im_4_w[LENGTH:2]};

endmodule

module c_m_para_3 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w - {{3{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:3]};
assign tmp_data_re_2_w = tmp_data_re_0_w + {{2{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:2]};
assign data_out_0 = tmp_data_re_0_w - {{4{tmp_data_re_2_w[LENGTH]}},tmp_data_re_2_w[LENGTH:4]};

assign tmp_data_im_1_w = tmp_data_im_0_w - {{7{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:7]};
assign tmp_data_im_2_w = tmp_data_im_0_w + {{1{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:1]};
assign tmp_data_im_3_w = tmp_data_im_2_w + {{5{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:5]};
assign data_out_1 = {{2{tmp_data_im_3_w[LENGTH]}},tmp_data_im_3_w[LENGTH:2]};

endmodule

module c_m_para_4 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;
wire [LENGTH:0] tmp_data_im_4_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w - {{3{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:3]};
assign data_out_0 = tmp_data_re_1_w + {{7{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:7]};

assign tmp_data_im_1_w = tmp_data_im_0_w + {{3{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:3]};
assign tmp_data_im_2_w = {{6{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:6]} - tmp_data_im_0_w;
assign tmp_data_im_3_w = {{2{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:2]} + tmp_data_im_0_w;
assign tmp_data_im_4_w = {{2{tmp_data_im_3_w[LENGTH]}},tmp_data_im_3_w[LENGTH:2]} + tmp_data_im_3_w;
assign data_out_1 = {{1{tmp_data_im_4_w[LENGTH]}},tmp_data_im_4_w[LENGTH:1]};

endmodule

module c_m_para_5 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_re_3_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w - {{5{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:5]};
assign tmp_data_re_2_w = tmp_data_re_0_w + {{4{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:4]};
assign tmp_data_re_3_w = tmp_data_re_2_w + {{2{tmp_data_re_2_w[LENGTH]}},tmp_data_re_2_w[LENGTH:2]};
assign data_out_0 = {{1{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:1]} + {{2{tmp_data_re_3_w[LENGTH]}},tmp_data_re_3_w[LENGTH:2]};

assign tmp_data_im_1_w = tmp_data_im_0_w - {{3{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:3]};
assign tmp_data_im_2_w = tmp_data_im_1_w + {{6{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:6]};
assign tmp_data_im_3_w = {{3{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:3]} + tmp_data_im_0_w;
assign data_out_1 = {{1{tmp_data_im_3_w[LENGTH]}},tmp_data_im_3_w[LENGTH:1]};

endmodule

module c_m_para_6 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;
wire [LENGTH:0] tmp_data_im_3_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w - {{4{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:4]};
assign tmp_data_re_2_w = tmp_data_re_1_w - {{5{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:5]};
assign data_out_0 = tmp_data_re_0_w - {{2{tmp_data_re_2_w[LENGTH]}},tmp_data_re_2_w[LENGTH:2]};

assign tmp_data_im_1_w = tmp_data_im_0_w + {{4{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:4]};
assign tmp_data_im_2_w = tmp_data_im_0_w + {{7{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:7]};
assign tmp_data_im_3_w = {{3{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:3]} + tmp_data_im_2_w;
assign data_out_1 = tmp_data_im_3_w - {{1{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:1]};

endmodule

module c_m_para_7 #(parameter LENGTH = 14)(
	input  [LENGTH-1:0] data_in_0,
	input  [LENGTH-1:0] data_in_1,
	output [LENGTH:0] data_out_0,
	output [LENGTH:0] data_out_1
);

wire [LENGTH:0] tmp_data_re_0_w;
wire [LENGTH:0] tmp_data_re_1_w;
wire [LENGTH:0] tmp_data_re_2_w;
wire [LENGTH:0] tmp_data_im_0_w;
wire [LENGTH:0] tmp_data_im_1_w;
wire [LENGTH:0] tmp_data_im_2_w;

assign tmp_data_re_0_w = {data_in_0[LENGTH-1],data_in_0};
assign tmp_data_im_0_w = {data_in_1[LENGTH-1],data_in_1};

assign tmp_data_re_1_w = tmp_data_re_0_w + {{2{tmp_data_re_0_w[LENGTH]}},tmp_data_re_0_w[LENGTH:2]};
assign tmp_data_re_2_w = {{4{tmp_data_re_1_w[LENGTH]}},tmp_data_re_1_w[LENGTH:4]} - tmp_data_re_1_w ;
assign data_out_0 = {{2{tmp_data_re_2_w[LENGTH]}},tmp_data_re_2_w[LENGTH:2]} + tmp_data_re_0_w;

assign tmp_data_im_1_w = tmp_data_im_0_w + {{2{tmp_data_im_0_w[LENGTH]}},tmp_data_im_0_w[LENGTH:2]};
assign tmp_data_im_2_w = {{4{tmp_data_im_1_w[LENGTH]}},tmp_data_im_1_w[LENGTH:4]} - tmp_data_im_1_w;
assign data_out_1 = {{2{tmp_data_im_2_w[LENGTH]}},tmp_data_im_2_w[LENGTH:2]} + tmp_data_im_0_w;

endmodule
