`timescale 1ns/10ps
module reg_sort #(parameter WIDTH = 34)(
	input  clk,
	input  rst_n,
	input  w_en,
	input  r_en,
	input  [2:0] w_addr,
	input  [2:0] r_addr,
	input  [WIDTH-1:0] data_in,
	output reg [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] reg_m [7:0];

always@(*)
begin
  if(r_en)
    data_out = reg_m[r_addr];
  else
    data_out = 34'b0;
end

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    reg_m[0] <= 34'b0;
    reg_m[1] <= 34'b0;
    reg_m[2] <= 34'b0;
    reg_m[3] <= 34'b0;
    reg_m[4] <= 34'b0;
    reg_m[5] <= 34'b0;
    reg_m[6] <= 34'b0;
    reg_m[7] <= 34'b0;
  end
  else if(w_en)
  begin
    case(w_addr)
    3'b000: reg_m[0] <= data_in;
    3'b001: reg_m[4] <= data_in;
    3'b010: reg_m[2] <= data_in;
    3'b011: reg_m[6] <= data_in;
    3'b100: reg_m[1] <= data_in;
    3'b101: reg_m[5] <= data_in;
    3'b110: reg_m[3] <= data_in;
    3'b111: reg_m[7] <= data_in;
    default: ;
    endcase
  end
  else
    ;
end

endmodule

    