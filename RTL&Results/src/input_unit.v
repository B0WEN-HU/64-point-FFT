`timescale 1ns/10ps

module input_unit #(parameter WIDTH = 10)(
	input  clk,
	input  rst_n,
	input  data_in_en,
	input  [WIDTH-1:0] data_in_re,
	input  [WIDTH-1:0] data_in_im,
	output reg [WIDTH-1:0] data_out_re,
	output reg [WIDTH-1:0] data_out_im
);

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    data_out_re <= 10'b0;
    data_out_im <= 10'b0;
  end
  else if(data_in_en)
  begin
    data_out_re <= data_in_re;
    data_out_im <= data_in_im;
  end
  else
  begin
    data_out_re <= data_out_re;
    data_out_im <= data_out_im;
  end
end

endmodule
