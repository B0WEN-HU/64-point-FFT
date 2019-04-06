`timescale 1ns/100ps
module fifo1 #(parameter WIDTH = 17)(
	input  clk,
	input  rst_n,
	input  w_en,
	input  r_en,
	input  [WIDTH-1:0] data_in,
	output [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] mem;

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    mem <= 17'b0;
  end
  else
  begin 
    if(w_en)    
      mem <= data_in;
    else
      ;
  end
end

assign data_out = r_en ? mem : 17'b0;

endmodule
