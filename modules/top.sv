module top(input logic clk, rst, filter_rst,
				output logic[15:0] low_pass, high_pass);
				

logic[14:0] address;
logic[15:0] x;
				
rom ROM(address, clk, x);
				
filter LowPass(clk, filter_rst, x, 16'b1000000011111000, 16'b0000000000000011, 16'b0000000000000011, low_pass);

filter HighPass(clk, filter_rst, x, 16'b1000000011111000, 16'b0000000011111100, 16'b1000000011111100, high_pass);

always_ff @(posedge clk)
	if(rst)
		address = 15'd0;
	else
		address = address + 15'd1;
	
endmodule