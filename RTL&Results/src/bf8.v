`timescale 1ns/100ps
module bf8 #(parameter WIDTH = 14)(
	input  [WIDTH-1:0] data_in_0_re,
	input  [WIDTH-1:0] data_in_0_im,
	input  [WIDTH-1:0] data_in_1_re,
	input  [WIDTH-1:0] data_in_1_im,
	output [WIDTH-1:0] data_out_0_re,
	output [WIDTH-1:0] data_out_0_im,
	output [WIDTH-1:0] data_out_1_re,
	output [WIDTH-1:0] data_out_1_im
);

assign data_out_0_re = data_in_0_re + data_in_1_re;
assign data_out_0_im = data_in_0_im + data_in_1_im;
assign data_out_1_re = data_in_0_re - data_in_1_re;
assign data_out_1_im = data_in_0_im - data_in_1_im;

endmodule