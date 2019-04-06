`timescale 1ns/100ps

module pe16 #(parameter WIDTH = 12)(
	input  clk,
	input  rst_n,
	input  s0,
	input  s1,
	input  w_en,
	input  r_en,
	input  [WIDTH-1:0] data_in_re,
	input  [WIDTH-1:0] data_in_im,
	output reg [WIDTH:0] data_out_re,
	output reg [WIDTH:0] data_out_im
);

wire [WIDTH:0] bf_data_out_re_0_w;
wire [WIDTH:0] bf_data_out_im_0_w;
wire [WIDTH:0] bf_data_out_re_1_w;
wire [WIDTH:0] bf_data_out_im_1_w;

wire [WIDTH:0] fifo_data_in_re_w;
wire [WIDTH:0] fifo_data_in_im_w;
wire [WIDTH:0] fifo_data_out_re_w;
wire [WIDTH:0] fifo_data_out_im_w;

reg [WIDTH:0] tmp_data_re_0_r;
reg [WIDTH:0] tmp_data_im_0_r;

reg s0_r;
reg s1_r;

assign fifo_data_in_re_w = s0_r ? bf_data_out_re_1_w : {data_in_re[WIDTH-1],data_in_re};
assign fifo_data_in_im_w = s0_r ? bf_data_out_im_1_w : {data_in_im[WIDTH-1],data_in_im};

fifo16 re_pe16(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en),
	.r_en(r_en),
	.data_in(fifo_data_in_re_w),
	.data_out(fifo_data_out_re_w)
);

fifo16 im_pe16(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en),
	.r_en(r_en),
	.data_in(fifo_data_in_im_w),
	.data_out(fifo_data_out_im_w)
);

bf16  bf_pe16(
	.data_in_0_re(fifo_data_out_re_w),
	.data_in_0_im(fifo_data_out_im_w),
	.data_in_1_re({data_in_re[WIDTH-1],data_in_re}),
	.data_in_1_im({data_in_im[WIDTH-1],data_in_im}),
	.data_out_0_re(bf_data_out_re_0_w),
	.data_out_0_im(bf_data_out_im_0_w),
	.data_out_1_re(bf_data_out_re_1_w),
	.data_out_1_im(bf_data_out_im_1_w)
);

always@(*)
begin
  case(s1_r)
  1'b0:
  begin
    tmp_data_re_0_r = {fifo_data_out_re_w[WIDTH],fifo_data_out_re_w};
    tmp_data_im_0_r = {fifo_data_out_im_w[WIDTH],fifo_data_out_im_w};
  end
  
  1'b1:
  begin
    tmp_data_re_0_r = {fifo_data_out_im_w[WIDTH],fifo_data_out_im_w};
    tmp_data_im_0_r = - {fifo_data_out_re_w[WIDTH],fifo_data_out_re_w};
  end
  
  default: ;

  endcase 
end   

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    s0_r <= 1'b0;
    s1_r <= 1'b0;
    data_out_re <= 13'b0;
    data_out_im <= 13'b0;
  end
  else
  begin
    s0_r <= s0;
    s1_r <= s1;
    if(s0_r)
    begin
      data_out_re <= bf_data_out_re_0_w;
      data_out_im <= bf_data_out_im_0_w;
    end
    else
    begin
      data_out_re <= tmp_data_re_0_r;
      data_out_im <= tmp_data_im_0_r;
    end
  end
end

endmodule

      