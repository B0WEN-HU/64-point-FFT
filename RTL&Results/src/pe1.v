`timescale 1ns/100ps

module pe1 #(parameter WIDTH = 17)(
	input  clk,
	input  rst_n,
	input  s0,
	input  [WIDTH-1:0] data_in_re,
	input  [WIDTH-1:0] data_in_im,
	input  w_en,
	input  r_en,
	output reg [WIDTH-1:0] data_out_re,
	output reg [WIDTH-1:0] data_out_im
);

wire [WIDTH-1:0] bf_data_out_re_0_w;
wire [WIDTH-1:0] bf_data_out_im_0_w;
wire [WIDTH-1:0] bf_data_out_re_1_w;
wire [WIDTH-1:0] bf_data_out_im_1_w;

wire [WIDTH-1:0] fifo_data_in_re_w;
wire [WIDTH-1:0] fifo_data_in_im_w;
wire [WIDTH-1:0] fifo_data_out_re_w;
wire [WIDTH-1:0] fifo_data_out_im_w;

assign fifo_data_in_re_w = s0 ? bf_data_out_re_1_w : data_in_re;
assign fifo_data_in_im_w = s0 ? bf_data_out_im_1_w : data_in_im;

fifo1 re_pe1(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en),
	.r_en(r_en),
	.data_in(fifo_data_in_re_w),
	.data_out(fifo_data_out_re_w)
);

fifo1 im_pe1(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en),
	.r_en(r_en),
	.data_in(fifo_data_in_im_w),
	.data_out(fifo_data_out_im_w)
);


bf1  bf_pe1(
	.data_in_0_re(fifo_data_out_re_w),
	.data_in_0_im(fifo_data_out_im_w),
	.data_in_1_re(data_in_re),
	.data_in_1_im(data_in_im),
	.data_out_0_re(bf_data_out_re_0_w),
	.data_out_0_im(bf_data_out_im_0_w),
	.data_out_1_re(bf_data_out_re_1_w),
	.data_out_1_im(bf_data_out_im_1_w)
);
                                    
always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    data_out_re <= 17'b0;
    data_out_im <= 17'b0;
  end
  else
  begin
    if(s0)
    begin
      data_out_re <= bf_data_out_re_0_w;
      data_out_im <= bf_data_out_im_0_w;
    end
    else
    begin   
      data_out_re <= fifo_data_out_re_w;
      data_out_im <= fifo_data_out_im_w;
    end
  end
end

endmodule

