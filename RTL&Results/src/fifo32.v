`timescale 1ns/100ps
module fifo32 #(parameter WIDTH = 11, parameter INDEX = 5)(
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
    w_index_r <= 5'b0;
    r_index_r <= 5'b0;
    mem[0] <= 11'b0;
    mem[1] <= 11'b0;
    mem[2] <= 11'b0;
    mem[3] <= 11'b0;
    mem[4] <= 11'b0;
    mem[5] <= 11'b0;
    mem[6] <= 11'b0;
    mem[7] <= 11'b0;
    mem[8] <= 11'b0;
    mem[9] <= 11'b0;
    mem[10] <= 11'b0;
    mem[11] <= 11'b0;
    mem[12] <= 11'b0;
    mem[13] <= 11'b0;
    mem[14] <= 11'b0;
    mem[15] <= 11'b0;
    mem[16] <= 11'b0;
    mem[17] <= 11'b0;
    mem[18] <= 11'b0;
    mem[19] <= 11'b0;
    mem[20] <= 11'b0;
    mem[21] <= 11'b0;
    mem[22] <= 11'b0;
    mem[23] <= 11'b0;
    mem[24] <= 11'b0;
    mem[25] <= 11'b0;
    mem[26] <= 11'b0;
    mem[27] <= 11'b0;
    mem[28] <= 11'b0;
    mem[29] <= 11'b0;
    mem[30] <= 11'b0;
    mem[31] <= 11'b0;
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
    data_out = 11'b0;
end

endmodule
      
      
    
      
      
