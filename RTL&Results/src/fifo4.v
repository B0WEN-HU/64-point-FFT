`timescale 1ns/100ps
module fifo4 #(parameter WIDTH = 16, parameter INDEX = 2)(
	input  clk,
	input  rst_n,
	input  w_en,
	input  r_en,
	input  [WIDTH-1:0] data_in,
	output reg [WIDTH-1:0] data_out
);

reg [INDEX-1:0] w_index_r;
reg [INDEX-1:0] r_index_r;
reg [WIDTH-1:0] mem [(1<<INDEX)-1:0];

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    w_index_r <= 2'b0;
    r_index_r <= 2'b0;
    mem[0] <= 16'b0;
    mem[1] <= 16'b0;
    mem[2] <= 16'b0;
    mem[3] <= 16'b0;
  end
  else
  begin 
    if(w_en)    
    begin
      w_index_r <= w_index_r + 1'b1;
      mem[w_index_r] <= data_in;
    end
    else
      w_index_r <= w_index_r;
    
    if(r_en)
      r_index_r <= r_index_r + 1'b1;
    else
      r_index_r <= r_index_r;
  end
end

always @(*)
begin
  if(r_en)
    data_out = mem[r_index_r];
  else
    data_out = 16'b0;
end

endmodule

