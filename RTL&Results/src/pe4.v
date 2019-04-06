`timescale 1ns/100ps

module pe4 #(parameter WIDTH = 16)(
	input  clk,
	input  rst_n,
	input  s0,
	input  [1:0] s1,
	input  w_en,
	input  r_en,
	input  [WIDTH-1:0] data_in_re,
	input  [WIDTH-1:0] data_in_im,
	output reg [WIDTH:0] data_out_re,
	output reg [WIDTH:0] data_out_im
);

wire [WIDTH-1:0] bf_data_out_re_0_w;
wire [WIDTH-1:0] bf_data_out_im_0_w;
wire [WIDTH-1:0] bf_data_out_re_1_w;
wire [WIDTH-1:0] bf_data_out_im_1_w;

wire [WIDTH-1:0] fifo_data_in_re_w;
wire [WIDTH-1:0] fifo_data_in_im_w;
wire [WIDTH-1:0] fifo_data_out_re_w;
wire [WIDTH-1:0] fifo_data_out_im_w;

reg [WIDTH:0] tmp_data_re_0_r;
reg [WIDTH:0] tmp_data_im_0_r;
reg [WIDTH:0] tmp_data_re_1_r;
reg [WIDTH:0] tmp_data_im_1_r;
reg [WIDTH:0] tmp_data_re_2_r;
reg [WIDTH:0] tmp_data_im_2_r;                
reg [WIDTH:0] tmp_data_re_3_r;
reg [WIDTH:0] tmp_data_im_3_r;
reg [WIDTH:0] tmp_data_re_4_r;
reg [WIDTH:0] tmp_data_im_4_r;

assign fifo_data_in_re_w = s0 ? bf_data_out_re_1_w : data_in_re;
assign fifo_data_in_im_w = s0 ? bf_data_out_im_1_w : data_in_im;

fifo4 re_pe4(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en),
	.r_en(r_en),
	.data_in(fifo_data_in_re_w),
	.data_out(fifo_data_out_re_w)
);

fifo4 im_pe4(
	.clk(clk),
	.rst_n(rst_n),
	.w_en(w_en),
	.r_en(r_en),
	.data_in(fifo_data_in_im_w),
	.data_out(fifo_data_out_im_w)
);


bf4  bf_pe4(
	.data_in_0_re(fifo_data_out_re_w),
	.data_in_0_im(fifo_data_out_im_w),
	.data_in_1_re(data_in_re),
	.data_in_1_im(data_in_im),
	.data_out_0_re(bf_data_out_re_0_w),
	.data_out_0_im(bf_data_out_im_0_w),
	.data_out_1_re(bf_data_out_re_1_w),
	.data_out_1_im(bf_data_out_im_1_w)
);
                                    
always@(*)
begin
  case(s1)
  2'b00:
  begin
    tmp_data_re_4_r = {fifo_data_out_re_w[WIDTH-1],fifo_data_out_re_w};
    tmp_data_im_4_r = {fifo_data_out_im_w[WIDTH-1],fifo_data_out_im_w};
  end
  
  2'b01:
  begin
    tmp_data_re_0_r = {fifo_data_out_re_w[WIDTH-1],fifo_data_out_re_w};
    tmp_data_re_1_r = tmp_data_re_0_r + {{2{tmp_data_re_0_r[WIDTH]}},tmp_data_re_0_r[WIDTH:2]};
    tmp_data_re_2_r = {{4{tmp_data_re_1_r[WIDTH]}},tmp_data_re_1_r[WIDTH:4]} - tmp_data_re_1_r;
    tmp_data_re_3_r = tmp_data_re_0_r + {{2{tmp_data_re_2_r[WIDTH]}},tmp_data_re_2_r[WIDTH:2]};
    
    tmp_data_im_0_r = {fifo_data_out_im_w[WIDTH-1],fifo_data_out_im_w};
    tmp_data_im_1_r = tmp_data_im_0_r + {{2{tmp_data_im_0_r[WIDTH]}},tmp_data_im_0_r[WIDTH:2]};
    tmp_data_im_2_r = {{4{tmp_data_im_1_r[WIDTH]}},tmp_data_im_1_r[WIDTH:4]} - tmp_data_im_1_r;
    tmp_data_im_3_r = tmp_data_im_0_r + {{2{tmp_data_im_2_r[WIDTH]}},tmp_data_im_2_r[WIDTH:2]};
    
    
    tmp_data_re_4_r = tmp_data_re_3_r + tmp_data_im_3_r;
    tmp_data_im_4_r = tmp_data_im_3_r - tmp_data_re_3_r;
  end
  
  2'b10:
  begin
    tmp_data_re_4_r = {fifo_data_out_im_w[WIDTH-1],fifo_data_out_im_w};
    tmp_data_im_4_r = - {fifo_data_out_re_w[WIDTH-1],fifo_data_out_re_w};
  end
  
  2'b11:
  begin
    tmp_data_re_0_r = {fifo_data_out_re_w[WIDTH-1],fifo_data_out_re_w};
    tmp_data_re_1_r = tmp_data_re_0_r + {{2{tmp_data_re_0_r[WIDTH]}},tmp_data_re_0_r[WIDTH:2]};
    tmp_data_re_2_r = {{4{tmp_data_re_1_r[WIDTH]}},tmp_data_re_1_r[WIDTH:4]} - tmp_data_re_1_r;
    tmp_data_re_3_r = tmp_data_re_0_r + {{2{tmp_data_re_2_r[WIDTH]}},tmp_data_re_2_r[WIDTH:2]};
    
    tmp_data_im_0_r = {fifo_data_out_im_w[WIDTH-1],fifo_data_out_im_w};
    tmp_data_im_1_r = tmp_data_im_0_r + {{2{tmp_data_im_0_r[WIDTH]}},tmp_data_im_0_r[WIDTH:2]};
    tmp_data_im_2_r = {{4{tmp_data_im_1_r[WIDTH]}},tmp_data_im_1_r[WIDTH:4]} - tmp_data_im_1_r;
    tmp_data_im_3_r = tmp_data_im_0_r + {{2{tmp_data_im_2_r[WIDTH]}},tmp_data_im_2_r[WIDTH:2]}; 
    
    tmp_data_re_4_r = tmp_data_im_3_r - tmp_data_re_3_r;
    tmp_data_im_4_r = - tmp_data_re_3_r - tmp_data_im_3_r;
  end
  
  default: ;

  endcase  
end
 
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
      data_out_re <= {bf_data_out_re_0_w[WIDTH-1],bf_data_out_re_0_w};
      data_out_im <= {bf_data_out_im_0_w[WIDTH-1],bf_data_out_im_0_w};
    end
    else
    begin   
      data_out_re <= tmp_data_re_4_r;
      data_out_im <= tmp_data_im_4_r;
    end
  end
end

endmodule


