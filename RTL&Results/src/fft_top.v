`timescale 1ns/100ps
module fft_top(
	input  clk,
	input  rst_n,
	input  data_in_en,
	input  [9:0] data_in_re,
	input  [9:0] data_in_im,
	output reg data_out_en,
	output reg [16:0] data_out_re,
	output reg [16:0] data_out_im
);

wire s0_pe0_w;
wire [1:0] s1_pe0_w;
wire s0_pe1_w;
wire s1_pe1_w;
wire s0_pe2_w;
wire s0_pe3_w;
wire [1:0] s1_pe3_w;
wire s0_pe4_w;
wire s1_pe4_w;
wire s0_pe5_w;
wire w_en_pe0_w;
wire r_en_pe0_w;
wire w_en_pe1_w;
wire r_en_pe1_w;
wire w_en_pe2_w;
wire r_en_pe2_w;
wire w_en_pe3_w;
wire r_en_pe3_w;
wire w_en_pe4_w;
wire r_en_pe4_w;
wire w_en_pe5_w;
wire r_en_pe5_w;
wire [7:0] w_en_out_w;
wire [7:0] r_en_out_w;
wire [2:0] w_addr_output_w;
wire [2:0] r_addr_output_w;
wire start_mult_w; 

wire [9:0] in_data_out_re_w;
wire [9:0] in_data_out_im_w;

wire [11:0] data_out_re_0_w;
wire [11:0] data_out_im_0_w;
wire [12:0] data_out_re_1_w;
wire [12:0] data_out_im_1_w;
wire [13:0] data_out_re_2_w;
wire [13:0] data_out_im_2_w;
wire [15:0] data_out_re_3_w;
wire [15:0] data_out_im_3_w;
wire [16:0] data_out_re_4_w;
wire [16:0] data_out_im_4_w;
wire [16:0] data_out_re_5_w;
wire [16:0] data_out_im_5_w;
wire [16:0] data_out_re_6_w;
wire [16:0] data_out_im_6_w;

wire [16:0] data_out_re_w;
wire [16:0] data_out_im_w;
wire data_out_en_w;

wire [5:0] cnt_mult_w;

input_unit i0(
	.clk(clk),
	.rst_n(rst_n),
	.data_in_en(data_in_en),
	.data_in_re(data_in_re),
	.data_in_im(data_in_im),
	.data_out_re(in_data_out_re_w),
	.data_out_im(in_data_out_im_w)
);

ctrl_unit c0(
	.clk(clk),
	.rst_n(rst_n),
	.start(data_in_en),
	.s0_pe0(s0_pe0_w),
	.s1_pe0(s1_pe0_w),
	.s0_pe1(s0_pe1_w),
	.s1_pe1(s1_pe1_w),
	.s0_pe2(s0_pe2_w),
	.s0_pe3(s0_pe3_w),
	.s1_pe3(s1_pe3_w),
	.s0_pe4(s0_pe4_w),
	.s1_pe4(s1_pe4_w),
	.s0_pe5(s0_pe5_w),
	.w_en_pe0(w_en_pe0_w),
	.r_en_pe0(r_en_pe0_w),
	.w_en_pe1(w_en_pe1_w),
	.r_en_pe1(r_en_pe1_w),
	.w_en_pe2(w_en_pe2_w),
	.r_en_pe2(r_en_pe2_w),
	.w_en_pe3(w_en_pe3_w),
	.r_en_pe3(r_en_pe3_w),
	.w_en_pe4(w_en_pe4_w),
	.r_en_pe4(r_en_pe4_w),
	.w_en_pe5(w_en_pe5_w),
	.r_en_pe5(r_en_pe5_w),
	.w_en_out(w_en_out_w),
	.r_en_out(r_en_out_w),
	.w_addr_output(w_addr_output_w),
	.r_addr_output(r_addr_output_w),
	.start_mult(start_mult_w), 
	.data_out_en(data_out_en_w)
);

pe32 p0(
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0_pe0_w),
	.s1(s1_pe0_w),
	.data_in_re(in_data_out_re_w),
	.data_in_im(in_data_out_im_w),
	.w_en(w_en_pe0_w),
	.r_en(r_en_pe0_w),
	.data_out_re(data_out_re_0_w),
	.data_out_im(data_out_im_0_w)
);

pe16 p1(
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0_pe1_w),
	.s1(s1_pe1_w),
	.data_in_re(data_out_re_0_w),
	.data_in_im(data_out_im_0_w),
	.w_en(w_en_pe1_w),
	.r_en(r_en_pe1_w),
	.data_out_re(data_out_re_1_w),
	.data_out_im(data_out_im_1_w)
);           

pe8 p2(
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0_pe2_w),
	.data_in_re(data_out_re_1_w),
	.data_in_im(data_out_im_1_w),
	.w_en(w_en_pe2_w),
	.r_en(r_en_pe2_w),
	.data_out_re(data_out_re_2_w),
	.data_out_im(data_out_im_2_w)
);           

mult_unit m0(
	.clk(clk),
	.rst_n(rst_n),
	.cnt_mult(cnt_mult_w),
	.data_in_re(data_out_re_2_w),
	.data_in_im(data_out_im_2_w),
	.data_out_re(data_out_re_3_w),
	.data_out_im(data_out_im_3_w)
);

mult_ctrl_unit mc0(
	.clk(clk),
	.rst_n(rst_n),
	.start_mult(start_mult_w),
	.cnt_mult(cnt_mult_w)
);
          
pe4 p3(
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0_pe3_w),
	.s1(s1_pe3_w),
	.data_in_re(data_out_re_3_w),
	.data_in_im(data_out_im_3_w),
	.w_en(w_en_pe3_w),
	.r_en(r_en_pe3_w),
	.data_out_re(data_out_re_4_w),
	.data_out_im(data_out_im_4_w)
);
            
pe2 p4(
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0_pe4_w),
	.s1(s1_pe4_w),
	.data_in_re(data_out_re_4_w),
	.data_in_im(data_out_im_4_w),
	.w_en(w_en_pe4_w),
	.r_en(r_en_pe4_w),
	.data_out_re(data_out_re_5_w),
	.data_out_im(data_out_im_5_w)
);

pe1 p5(
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0_pe5_w),
	.data_in_re(data_out_re_5_w),
	.data_in_im(data_out_im_5_w),
	.w_en(w_en_pe5_w),
	.r_en(r_en_pe5_w),
	.data_out_re(data_out_re_6_w),
	.data_out_im(data_out_im_6_w)
);

output_unit o0(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en_out_w),
	.r_en(r_en_out_w),
	.w_addr(w_addr_output_w),
	.r_addr(r_addr_output_w),
	.data_in({data_out_im_6_w,data_out_re_6_w}),
	.data_out_re(data_out_re_w),
	.data_out_im(data_out_im_w)
);
               
always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    data_out_re <= 17'b0;
    data_out_im <= 17'b0;
    data_out_en <= 1'b0;
  end
  else
  begin
    data_out_re <= data_out_re_w;
    data_out_im <= data_out_im_w;
    data_out_en <= data_out_en_w;
  end
end
    
endmodule           
