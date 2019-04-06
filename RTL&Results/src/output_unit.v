`timescale 1ns/10ps
module output_unit #(parameter WIDTH = 17)(
	input  clk,
	input  rst_n,
	input  [7:0] w_en,
	input  [7:0] r_en,
	input  [2:0] w_addr,
	input  [2:0] r_addr,
	input  [2*WIDTH-1:0] data_in,
	output [WIDTH-1:0] data_out_re,
	output [WIDTH-1:0] data_out_im
);

wire [2*WIDTH-1:0] data_out_0_w;
wire [2*WIDTH-1:0] data_out_1_w;
wire [2*WIDTH-1:0] data_out_2_w;                     
wire [2*WIDTH-1:0] data_out_3_w;
wire [2*WIDTH-1:0] data_out_4_w;
wire [2*WIDTH-1:0] data_out_5_w;
wire [2*WIDTH-1:0] data_out_6_w;
wire [2*WIDTH-1:0] data_out_7_w;

assign data_out_re = data_out_0_w[WIDTH-1:0] | data_out_1_w[WIDTH-1:0] | data_out_2_w[WIDTH-1:0] | data_out_3_w[WIDTH-1:0] | data_out_4_w[WIDTH-1:0] | data_out_5_w[WIDTH-1:0] | data_out_6_w[WIDTH-1:0] | data_out_7_w[WIDTH-1:0];
assign data_out_im = data_out_0_w[2*WIDTH-1:WIDTH] | data_out_1_w[2*WIDTH-1:WIDTH] | data_out_2_w[2*WIDTH-1:WIDTH] | data_out_3_w[2*WIDTH-1:WIDTH] | data_out_4_w[2*WIDTH-1:WIDTH] | data_out_5_w[2*WIDTH-1:WIDTH] | data_out_6_w[2*WIDTH-1:WIDTH] | data_out_7_w[2*WIDTH-1:WIDTH];


reg_sort r0(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[0]),
	.r_en(r_en[0]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_0_w)
);

reg_sort r1(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[1]),
	.r_en(r_en[1]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_1_w)
);

reg_sort r2(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[2]),
	.r_en(r_en[2]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_2_w)
);

reg_sort r3(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[3]),
	.r_en(r_en[3]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_3_w)
);

reg_sort r4(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[4]),
	.r_en(r_en[4]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_4_w)
);

reg_sort r5(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[5]),
	.r_en(r_en[5]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_5_w)
);

reg_sort r6(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[6]),
	.r_en(r_en[6]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_6_w)
);

reg_sort r7(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en[7]),
	.r_en(r_en[7]),
	.w_addr(w_addr),
	.r_addr(r_addr),
	.data_in(data_in),
	.data_out(data_out_7_w)
);

endmodule