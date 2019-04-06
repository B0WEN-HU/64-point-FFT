`timescale 1ns/10ps
module mult_ctrl_unit(
	input  clk,
	input  rst_n,
	input  start_mult,	
	output reg [5:0] cnt_mult
);
//
reg mult_en;
//
always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		cnt_mult <= 6'b0;
		mult_en <= 1'b0;
	end
	else
	begin
		if(start_mult | mult_en)
			cnt_mult <= cnt_mult + 1'b1;
		else
			cnt_mult <= 6'b0;
		if(start_mult)
			mult_en <= 1'b1;
		else if(cnt_mult == 6'b111111)
			mult_en <= 1'b0;
		else
			mult_en <= mult_en;
	end
end
endmodule
