`timescale 1ns/10ps
module mult_unit #(parameter WIDTH = 14)(
	input  clk,
	input  rst_n,
	input  [5:0] cnt_mult,
	input  [WIDTH-1:0] data_in_re,
	input  [WIDTH-1:0] data_in_im,
	output reg [WIDTH+1:0] data_out_re,
	output reg [WIDTH+1:0] data_out_im
);


reg [8:0] state;
reg [WIDTH+1:0] data_out_re_1;
reg [WIDTH+1:0] data_out_im_1;

wire [WIDTH:0] data_out_0_0_w, data_out_0_1_w;
wire [WIDTH:0] data_out_0_1_j_w, data_out_0_0_j_w;
wire [WIDTH:0] data_out_1_0_w, data_out_1_1_w;
wire [WIDTH:0] data_out_1_1_j_w, data_out_1_0_j_w;
wire [WIDTH:0] data_out_2_0_w, data_out_2_1_w;
wire [WIDTH:0] data_out_2_1_j_w, data_out_2_0_j_w;
wire [WIDTH:0] data_out_3_0_w, data_out_3_1_w;
wire [WIDTH:0] data_out_3_1_j_w, data_out_3_0_j_w;
wire [WIDTH:0] data_out_4_0_w, data_out_4_1_w;
wire [WIDTH:0] data_out_4_1_j_w, data_out_4_0_j_w;
wire [WIDTH:0] data_out_5_0_w, data_out_5_1_w;
wire [WIDTH:0] data_out_5_1_j_w, data_out_5_0_j_w;
wire [WIDTH:0] data_out_6_0_w, data_out_6_1_w;
wire [WIDTH:0] data_out_6_1_j_w, data_out_6_0_j_w;
wire [WIDTH:0] data_out_7_0_w, data_out_7_1_w;
wire [WIDTH:0] data_out_7_1_j_w, data_out_7_0_j_w;
wire [WIDTH:0] data_out_8_0_w, data_out_8_1_w;
wire [WIDTH:0] data_out_8_1_j_w, data_out_8_0_j_w;

reg [WIDTH:0] tmp_out_0_r, tmp_out_1_r;
reg [WIDTH:0] tmp_out_1_j_r, tmp_out_0_j_r;

wire [WIDTH+1:0] tmp_out_1_w,tmp_out_2_w,tmp_out_3_w,tmp_out_4_w;

assign tmp_out_1_w = {tmp_out_0_r[WIDTH],tmp_out_0_r[WIDTH:0]};
assign tmp_out_2_w = {tmp_out_1_r[WIDTH],tmp_out_1_r[WIDTH:0]};
assign tmp_out_3_w = {tmp_out_1_j_r[WIDTH],tmp_out_1_j_r[WIDTH:0]};
assign tmp_out_4_w = {tmp_out_0_j_r[WIDTH],tmp_out_0_j_r[WIDTH:0]};

assign data_out_0_0_w = {data_in_re[WIDTH-1],data_in_re[WIDTH-1:0]};
assign data_out_0_1_w = {data_in_im[WIDTH-1],data_in_im[WIDTH-1:0]};
assign data_out_0_1_j_w = 0;
assign data_out_0_0_j_w = 0;

c_m_para_0 c0(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_1_0_w), .data_out_1(data_out_1_1_w));
c_m_para_0 c0_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_1_1_j_w), .data_out_1(data_out_1_0_j_w));

c_m_para_1 c1(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_2_0_w), .data_out_1(data_out_2_1_w));
c_m_para_1 c1_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_2_1_j_w), .data_out_1(data_out_2_0_j_w));

c_m_para_2 c2(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_3_0_w), .data_out_1(data_out_3_1_w));
c_m_para_2 c2_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_3_1_j_w), .data_out_1(data_out_3_0_j_w));

c_m_para_3 c3(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_4_0_w), .data_out_1(data_out_4_1_w));
c_m_para_3 c3_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_4_1_j_w), .data_out_1(data_out_4_0_j_w));

c_m_para_4 c4(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_5_0_w), .data_out_1(data_out_5_1_w));
c_m_para_4 c4_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_5_1_j_w), .data_out_1(data_out_5_0_j_w));

c_m_para_5 c5(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_6_0_w), .data_out_1(data_out_6_1_w));
c_m_para_5 c5_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_6_1_j_w), .data_out_1(data_out_6_0_j_w));

c_m_para_6 c6(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_7_0_w), .data_out_1(data_out_7_1_w));
c_m_para_6 c6_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_7_1_j_w), .data_out_1(data_out_7_0_j_w));

c_m_para_7 c7(.data_in_0(data_in_re), .data_in_1(data_in_im), .data_out_0(data_out_8_0_w), .data_out_1(data_out_8_1_w));
c_m_para_7 c7_j(.data_in_0(data_in_im), .data_in_1(data_in_re), .data_out_0(data_out_8_1_j_w), .data_out_1(data_out_8_0_j_w));


always @(*)
begin
  case(state)
  9'b000000001:
  begin
    tmp_out_0_r = data_out_0_0_w;
    tmp_out_1_r = data_out_0_1_w;
    tmp_out_1_j_r = data_out_0_1_j_w;
    tmp_out_0_j_r = data_out_0_0_j_w;
  end
  9'b000000010:
  begin
    tmp_out_0_r = data_out_1_0_w;
    tmp_out_1_r = data_out_1_1_w;
    tmp_out_1_j_r = data_out_1_1_j_w;
    tmp_out_0_j_r = data_out_1_0_j_w;
  end
  9'b000000100:
  begin
    tmp_out_0_r = data_out_2_0_w;
    tmp_out_1_r = data_out_2_1_w;
    tmp_out_1_j_r = data_out_2_1_j_w;
    tmp_out_0_j_r = data_out_2_0_j_w;
  end
  9'b000001000:
  begin
    tmp_out_0_r = data_out_3_0_w;
    tmp_out_1_r = data_out_3_1_w;
    tmp_out_1_j_r = data_out_3_1_j_w;
    tmp_out_0_j_r = data_out_3_0_j_w;
  end
  9'b000010000:
  begin
    tmp_out_0_r = data_out_4_0_w;
    tmp_out_1_r = data_out_4_1_w;
    tmp_out_1_j_r = data_out_4_1_j_w;
    tmp_out_0_j_r = data_out_4_0_j_w;
  end
  9'b000100000:
  begin
    tmp_out_0_r = data_out_5_0_w;
    tmp_out_1_r = data_out_5_1_w;
    tmp_out_1_j_r = data_out_5_1_j_w;
    tmp_out_0_j_r = data_out_5_0_j_w;
  end
  9'b001000000:
  begin
    tmp_out_0_r = data_out_6_0_w;
    tmp_out_1_r = data_out_6_1_w;
    tmp_out_1_j_r = data_out_6_1_j_w;
    tmp_out_0_j_r = data_out_6_0_j_w;
  end
  9'b010000000:
  begin
    tmp_out_0_r = data_out_7_0_w;
    tmp_out_1_r = data_out_7_1_w;
    tmp_out_1_j_r = data_out_7_1_j_w;
    tmp_out_0_j_r = data_out_7_0_j_w;
  end
  9'b100000000:
  begin
    tmp_out_0_r = data_out_8_0_w;
    tmp_out_1_r = data_out_8_1_w;
    tmp_out_1_j_r = data_out_8_1_j_w;
    tmp_out_0_j_r = data_out_8_0_j_w;
  end
  default:
  begin
    tmp_out_0_r = 15'b0;
    tmp_out_1_r = 15'b0;
    tmp_out_1_j_r = 15'b0;
    tmp_out_0_j_r = 15'b0;
  end
  endcase
end

always@(*)
begin
  casex(cnt_mult)
  6'b000xxx:
  begin
    data_out_re_1 = tmp_out_1_w;
    data_out_im_1 = tmp_out_2_w;
  end
  6'bxxx000:
  begin
    data_out_re_1 = tmp_out_1_w;
    data_out_im_1 = tmp_out_2_w;
  end
  6'bxxx001:
  begin
    data_out_re_1 = (cnt_mult==6'b000001)?tmp_out_1_w:(tmp_out_1_w+tmp_out_2_w);
    data_out_im_1 = (cnt_mult==6'b000001)?tmp_out_2_w:(tmp_out_3_w-tmp_out_4_w);
  end
  6'b100xxx:
  begin
    data_out_re_1 = (cnt_mult==6'b100000)?tmp_out_1_w:(tmp_out_1_w+tmp_out_2_w);
    data_out_im_1 = (cnt_mult==6'b100000)?tmp_out_2_w:(tmp_out_3_w-tmp_out_4_w);
  end   
  6'b001010:
  begin
    data_out_re_1 = tmp_out_1_w+tmp_out_2_w;
    data_out_im_1 = tmp_out_3_w-tmp_out_4_w;
  end
  6'b001011:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b001100:
  begin
    data_out_re_1 = tmp_out_2_w;
    data_out_im_1 = -tmp_out_1_w;
  end
  6'b001101:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_1_w-tmp_out_2_w;
  end
  6'b001110:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_1_w-tmp_out_2_w;
  end
  6'b001111:
  begin
    data_out_re_1 = tmp_out_2_w-tmp_out_1_w;
    data_out_im_1 = -tmp_out_3_w-tmp_out_4_w;
  end
  6'b010010:
  begin
    data_out_re_1 = tmp_out_1_w+tmp_out_2_w;
    data_out_im_1 = tmp_out_3_w-tmp_out_4_w;
  end
  6'b010011:
  begin
    data_out_re_1 = tmp_out_1_w+tmp_out_2_w;
    data_out_im_1 = tmp_out_3_w-tmp_out_4_w;
  end
  6'b010100:
  begin
    data_out_re_1 = tmp_out_1_w+tmp_out_2_w;
    data_out_im_1 = tmp_out_3_w-tmp_out_4_w;
  end
  6'b010101:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b010110:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b010111:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b011010:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b011011:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_1_w-tmp_out_2_w;
  end
  6'b011100:
  begin
    data_out_re_1 = tmp_out_2_w-tmp_out_1_w;
    data_out_im_1 = -tmp_out_3_w-tmp_out_4_w;
  end
  6'b011101:
  begin
    data_out_re_1 = tmp_out_2_w-tmp_out_1_w;
    data_out_im_1 = -tmp_out_3_w-tmp_out_4_w;
  end
  6'b011110:
  begin
    data_out_re_1 = -tmp_out_1_w-tmp_out_2_w;
    data_out_im_1 = tmp_out_4_w-tmp_out_3_w;
  end
  6'b011111:
  begin
    data_out_re_1 = -tmp_out_4_w-tmp_out_3_w;
    data_out_im_1 = tmp_out_1_w-tmp_out_2_w;
  end 
  6'b101010:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b101011:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b101100:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_2_w-tmp_out_1_w;
  end
  6'b101101:
  begin
    data_out_re_1 = tmp_out_2_w-tmp_out_1_w;
    data_out_im_1 = -tmp_out_3_w-tmp_out_4_w;
  end
  6'b101110:
  begin
    data_out_re_1 = tmp_out_2_w-tmp_out_1_w;
    data_out_im_1 = -tmp_out_3_w-tmp_out_4_w;
  end
  6'b101111:
  begin
    data_out_re_1 = -tmp_out_1_w-tmp_out_2_w;
    data_out_im_1 = tmp_out_4_w-tmp_out_3_w;
  end
  6'b110010:
  begin
    data_out_re_1 = tmp_out_1_w+tmp_out_2_w;
    data_out_im_1 = tmp_out_3_w-tmp_out_4_w;
  end
  6'b110011:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b110100:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
     data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b110101:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b110110:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_2_w-tmp_out_1_w;
  end
  6'b110111:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_2_w-tmp_out_1_w;
  end   
  6'b111010:
  begin
    data_out_re_1 = tmp_out_3_w+tmp_out_4_w;
    data_out_im_1 = tmp_out_2_w-tmp_out_1_w;
  end
  6'b111011:
  begin
    data_out_re_1 = tmp_out_3_w-tmp_out_4_w;
    data_out_im_1 = -tmp_out_1_w-tmp_out_2_w;
  end
  6'b111100:
  begin
    data_out_re_1 = tmp_out_2_w-tmp_out_1_w;
    data_out_im_1 = -tmp_out_3_w-tmp_out_4_w;
  end
  6'b111101:
  begin
    data_out_re_1 = -tmp_out_1_w-tmp_out_2_w;
    data_out_im_1 = tmp_out_4_w-tmp_out_3_w;
  end
  6'b111110:
  begin
    data_out_re_1 = -tmp_out_4_w-tmp_out_3_w;
    data_out_im_1 = tmp_out_1_w-tmp_out_2_w;
  end
  6'b111111:
  begin
    data_out_re_1 = tmp_out_4_w-tmp_out_3_w;
    data_out_im_1 = tmp_out_2_w+tmp_out_1_w;
  end
  default:
  begin
    data_out_re_1 = 0;
    data_out_im_1 = 0;
  end
  endcase
end

always@(cnt_mult)
begin
  casex(cnt_mult)
  6'b000xxx:
  begin
    state = 9'b000000001;
  end
  6'bxxx000:
  begin
    state = 9'b000000001;
  end
  6'b001001:
  begin
    state = 9'b000010000;
  end
	6'b001010:
  begin
    state = 9'b100000000;
  end
  6'b001011:
  begin
    state = 9'b000010000;
  end
  6'b001100:
  begin
    state = 9'b000000001;
  end
  6'b001101:
  begin
    state = 9'b000010000;
  end
  6'b001110:
  begin
    state = 9'b100000000;
  end
  6'b001111:
  begin
    state = 9'b000010000;
  end
	6'b010001:
  begin
    state = 9'b000000100;
  end
  6'b010010:
  begin
    state = 9'b000010000;
  end
  6'b010011:
  begin
    state = 9'b001000000;
  end
  6'b010100:
  begin
    state = 9'b100000000;
  end
  6'b010101:
  begin
    state = 9'b001000000;
  end
  6'b010110:
  begin
    state = 9'b000010000;
  end
  6'b010111:
  begin
    state = 9'b000000100;
  end
	6'b011001:
  begin
    state = 9'b001000000;
  end
  6'b011010:
  begin
    state = 9'b000010000;
  end
  6'b011011:
  begin
    state = 9'b000000100;
  end
  6'b011100:
  begin
    state = 9'b100000000;
  end
  6'b011101:
  begin
    state = 9'b000000100;
  end
  6'b011110:
  begin
    state = 9'b000010000;
  end
  6'b011111:
  begin
    state = 9'b001000000;
  end
  6'b100001:
  begin
    state = 9'b000000010;
  end
  6'b100010:
  begin
    state = 9'b000000100;
  end
  6'b100011:
  begin
    state = 9'b000001000;
  end
  6'b100100:
  begin
    state = 9'b000010000;
  end
  6'b100101:
  begin
    state = 9'b000100000;
  end
  6'b100110:
  begin
    state = 9'b001000000;
  end
  6'b100111:
  begin
    state = 9'b010000000;
  end
  6'b101001:
  begin
    state = 9'b000100000;
  end
  6'b101010:
  begin
    state = 9'b001000000;
  end
  6'b101011:
  begin
    state = 9'b000000010;
  end
  6'b101100:
  begin
    state = 9'b000010000;
  end
  6'b101101:
  begin
    state = 9'b010000000;
  end
  6'b101110:
  begin
    state = 9'b000000100;
  end
  6'b101111:
  begin
    state = 9'b000001000;
  end
  6'b110001:
  begin
    state = 9'b000001000;
  end
  6'b110010:
  begin
    state = 9'b001000000;
  end
  6'b110011:
  begin
    state = 9'b010000000;
  end
  6'b110100:
  begin
    state = 9'b000010000;
  end
  6'b110101:
  begin
    state = 9'b000000010;
  end
  6'b110110:
  begin
    state = 9'b000000100;
  end
  6'b110111:
  begin
    state = 9'b000100000;
  end
	6'b111001:
  begin
    state = 9'b010000000;
  end
  6'b111010:
  begin
    state = 9'b000000100;
  end
  6'b111011:
  begin
    state = 9'b000100000;
  end
  6'b111100:
  begin
    state = 9'b000010000;
  end
  6'b111101:
  begin
    state = 9'b000001000;
  end
  6'b111110:
  begin
    state = 9'b001000000;
  end
  6'b111111:
  begin
    state = 9'b000000010;
  end
  default:
  begin
    state = 9'b000000000;
  end
  endcase
end    

always@(posedge clk or negedge rst_n)
begin 
  if (!rst_n)
  begin
    data_out_re <= 16'b0;
    data_out_im <= 16'b0;
  end
  else
  begin
    data_out_re <= data_out_re_1;
    data_out_im <= data_out_im_1;
  end
end        
endmodule
