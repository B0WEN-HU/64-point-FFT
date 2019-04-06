`timescale 1ns/100ps
module bf1 #(parameter WIDTH = 17)(
	input  [WIDTH-1:0] data_in_0_re,
	input  [WIDTH-1:0] data_in_0_im,
	input  [WIDTH-1:0] data_in_1_re,
	input  [WIDTH-1:0] data_in_1_im,
	output [WIDTH-1:0] data_out_0_re,
	output [WIDTH-1:0] data_out_0_im,
	output [WIDTH-1:0] data_out_1_re,
	output [WIDTH-1:0] data_out_1_im
);

wire [WIDTH:0] re_0_w;
wire [WIDTH:0] im_0_w;
wire [WIDTH:0] re_1_w;
wire [WIDTH:0] im_1_w;

assign re_0_w = ({data_in_0_re[WIDTH-1],data_in_0_re} + {data_in_1_re[WIDTH-1],data_in_1_re});
assign data_out_0_re = {re_0_w[WIDTH],re_0_w[WIDTH-2:0]};
assign im_0_w = ({data_in_0_im[WIDTH-1],data_in_0_im} + {data_in_1_im[WIDTH-1],data_in_1_im});
assign data_out_0_im = {im_0_w[WIDTH],im_0_w[WIDTH-2:0]};

assign re_1_w = ({data_in_0_re[WIDTH-1],data_in_0_re} - {data_in_1_re[WIDTH-1],data_in_1_re});
assign data_out_1_re = {re_1_w[WIDTH],re_1_w[WIDTH-2:0]};
assign im_1_w = ({data_in_0_im[WIDTH-1],data_in_0_im} - {data_in_1_im[WIDTH-1],data_in_1_im});
assign data_out_1_im = {im_1_w[WIDTH],im_1_w[WIDTH-2:0]};

endmodule
