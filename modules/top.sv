module top(input logic clk, rst, filter_rst,
				output logic[31:0] low_pass, high_pass);
				

logic[14:0] address;
logic[22:0] x;
		
rom ROM(address, clk, x);
				
filter LowPass(clk, filter_rst, {9'b0, x}, 32'b10000000000000001111100000010101, 32'b1111110101, 32'b1111110101, low_pass);

filter HighPass(clk, filter_rst, {9'b0, x}, 32'b10000000000000001111100000010101, 32'b1111110000001010, 32'b100000000000000001111110000001010, high_pass);

always_ff @(posedge clk)
	if(rst)
		address = 15'd0;
	else
		address = address + 15'd1;
	
endmodule