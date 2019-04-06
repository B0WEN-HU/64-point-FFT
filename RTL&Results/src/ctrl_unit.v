`timescale 1ns/10ps
module ctrl_unit(
	input  clk,
	input  rst_n,
	input  start,
	output reg s0_pe0,
	output reg [1:0] s1_pe0,
	output reg s0_pe1,
	output reg s1_pe1,
	output reg s0_pe2,
	output reg s0_pe3,
	output reg [1:0] s1_pe3,
	output reg s0_pe4,
	output reg s1_pe4,
	output reg s0_pe5,
	output reg w_en_pe0,
	output reg r_en_pe0,
	output reg w_en_pe1,
	output reg r_en_pe1,
	output reg w_en_pe2,
	output reg r_en_pe2,
	output reg w_en_pe3,
	output reg r_en_pe3,
	output reg w_en_pe4,
	output reg r_en_pe4,
	output reg w_en_pe5,
	output reg r_en_pe5,
	output reg [7:0] w_en_out,
	output reg [7:0] r_en_out,
	output reg [2:0] w_addr_output,
	output reg [2:0] r_addr_output,
	output reg start_mult, 
	output reg data_out_en
);

reg [8:0] cnt_r;
reg busy_r;
reg w_r;
reg r_r;

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		s0_pe0 <= 1'b0;
		s1_pe0 <= 2'b0;
		s0_pe1 <= 1'b0;
		s1_pe1 <= 1'b0;
		s0_pe2 <= 1'b0;
		s0_pe3 <= 1'b0;
		s1_pe3 <= 2'b0;
		s0_pe4 <= 1'b0;
		s1_pe4 <= 1'b0;
		s0_pe5 <= 1'b0;
		w_en_pe0 <= 1'b0;
		r_en_pe0 <= 1'b0;
		w_en_pe1 <= 1'b0;
		r_en_pe1 <= 1'b0;
		w_en_pe2 <= 1'b0;
		r_en_pe2 <= 1'b0;
		w_en_pe3 <= 1'b0;
		r_en_pe3 <= 1'b0;
		w_en_pe4 <= 1'b0;
		r_en_pe4 <= 1'b0;
		w_en_pe5 <= 1'b0;
		r_en_pe5 <= 1'b0;
		start_mult <= 1'b0;
		cnt_r <= 9'b0;
		busy_r <= 1'b0;
	end
	else
	begin
		if(start)
			busy_r <= 1'b1;
		else if(cnt_r == 9'd183)
			busy_r <= 1'b0;
		else
			busy_r <= busy_r;
		if(start | busy_r)
			cnt_r <= cnt_r + 1'b1;
		else
			cnt_r <= 9'b0;
		s0_pe0 <= cnt_r[5];
		s1_pe0 <= cnt_r[4:3];
		s0_pe1 <= cnt_r[4];
		s1_pe1 <= cnt_r[3];
		s0_pe2 <= cnt_r[3];
		s0_pe3 <= ~cnt_r[2];
		s1_pe3 <= cnt_r[1:0];
		s0_pe4 <= cnt_r[1];
		s1_pe4 <= cnt_r[0];
		s0_pe5 <= cnt_r[0];
		
		if(cnt_r == 9'd0)
			w_en_pe0 <= (start | busy_r);
		else if(cnt_r == 9'd64)
			w_en_pe0 <= 1'b0;
		else
			w_en_pe0 <= w_en_pe0;
		if(cnt_r == 9'd32)
			r_en_pe0 <= 1'b1;
		else if(cnt_r == 9'd96)
			r_en_pe0 <= 1'b0;
		else
			r_en_pe0 <= r_en_pe0;
		
		if(cnt_r == 9'd33)
			w_en_pe1 <= 1'b1;
		else if(cnt_r == 9'd97)
			w_en_pe1 <= 1'b0;
		else
			w_en_pe1 <= w_en_pe1;
		if(cnt_r == 9'd49)
			r_en_pe1 <= 1'b1;
		else if(cnt_r == 9'd113)
			r_en_pe1 <= 1'b0;
		else
			r_en_pe1 <= r_en_pe1;
		
		if(cnt_r == 9'd50)
			w_en_pe2 <= 1'b1;
		else if(cnt_r == 9'd114)
			w_en_pe2 <= 1'b0;
		else
			w_en_pe2 <= w_en_pe2;
		if(cnt_r == 9'd58)
			r_en_pe2 <= 1'b1;
		else if(cnt_r == 9'd122)
			r_en_pe2 <= 1'b0;
		else
			r_en_pe2 <= r_en_pe2;
		
		if(cnt_r == 9'd60)
			w_en_pe3 <= 1'b1;
		else if(cnt_r == 9'd124)
			w_en_pe3 <= 1'b0;
		else
			w_en_pe3 <= w_en_pe3;
		if(cnt_r == 9'd64)
			r_en_pe3 <= 1'b1;
		else if(cnt_r == 9'd128)
			r_en_pe3 <= 1'b0;
		else
			r_en_pe3 <= r_en_pe3;
		
		if(cnt_r == 9'd65)
			w_en_pe4 <= 1'b1;
		else if(cnt_r == 9'd129)
			w_en_pe4 <= 1'b0;
		else
			w_en_pe4 <= w_en_pe4;
		if(cnt_r == 9'd67)
			r_en_pe4 <= 1'b1;
		else if(cnt_r == 9'd131)
			r_en_pe4 <= 1'b0;
		else
			r_en_pe4 <= r_en_pe4;
		//stage5
		if(cnt_r == 9'd68)
			w_en_pe5 <= 1'b1;
		else if(cnt_r == 9'd132)
			w_en_pe5 <= 1'b0;
		else
			w_en_pe5 <= w_en_pe5;
		if(cnt_r == 9'd69)
			r_en_pe5 <= 1'b1;
		else if(cnt_r == 9'd133)
			r_en_pe5 <= 1'b0;
		else
			r_en_pe5 <= r_en_pe5;

		if(cnt_r == 9'd59)
			start_mult <= 1'b1;
		else
			start_mult <= 1'b0;
	end
end

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		w_r <= 1'b0;
		r_r <= 1'b0;
		w_en_out <= 8'b0;
		r_en_out <= 8'b0;
		w_addr_output <= 3'b0;
		r_addr_output <= 3'b0;	
		data_out_en <= 1'b0;
	end
	else
	begin
		data_out_en <= r_r;
		if(cnt_r == 9'd69)
			w_r <= 1'b1;
		else if(cnt_r == 9'd133)
			w_r <= 1'b0;
		else
			w_r <= w_r;
		case (cnt_r)
		9'd70:	w_en_out <= 8'b00000001;
		9'd78:	w_en_out <= 8'b00010000;
		9'd86:	w_en_out <= 8'b00000100;
		9'd94:	w_en_out <= 8'b01000000;
		9'd102:	w_en_out <= 8'b00000010;
		9'd110:	w_en_out <= 8'b00100000;
		9'd118:	w_en_out <= 8'b00001000;
		9'd126:	w_en_out <= 8'b10000000;
		default:
			if(w_r)
				w_en_out <= w_en_out;
			else
				w_en_out <= 8'b0;
		endcase
		if(w_r)
			w_addr_output <= cnt_r[2:0] + 2'b10;
		else
			w_addr_output <= 3'b0;	
		if(cnt_r == 9'd119)
			r_r <= 1'b1;
		else if(cnt_r == 9'd183)
			r_r <= 1'b0;
		else
			r_r <= r_r;
		if(r_r)
		begin
			case (cnt_r[5:3])
			3'b111:	r_addr_output <= 3'b0;
			3'b000:	r_addr_output <= 3'b1;
			3'b001:	r_addr_output <= 3'b10;
			3'b010:	r_addr_output <= 3'b11;
			3'b011:	r_addr_output <= 3'b100;
			3'b100:	r_addr_output <= 3'b101;
			3'b101:	r_addr_output <= 3'b110;
			3'b110:	r_addr_output <= 3'b111;
			endcase
			case (cnt_r[2:0])
			3'b000:	r_en_out <= 8'b00000001;
			3'b001:	r_en_out <= 8'b00000010;
			3'b010:	r_en_out <= 8'b00000100;
			3'b011:	r_en_out <= 8'b00001000;
			3'b100:	r_en_out <= 8'b00010000;
			3'b101:	r_en_out <= 8'b00100000;
			3'b110:	r_en_out <= 8'b01000000;
			3'b111:	r_en_out <= 8'b10000000;
			endcase
		end
		else
		begin
			r_en_out <= 8'b0;
			r_addr_output <= 3'b0;
		end
	end
end
endmodule