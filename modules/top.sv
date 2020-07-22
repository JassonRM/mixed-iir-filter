module top(input logic clk, rst,
				output logic[15:0] low_pass, high_pass);
				

logic[14:0] address;
				
rom ROM(address, clk, x);
				
filter LowPass(clk, rst, x, 'b1000000011111000, 'b0000000000000011, 'b0000000000000011, low_pass);

filter HighPass(clk, rst, x, 'b1000000011111000, 'b0000000011111100, 'b1000000011111100, high_pass);

always_ff @(posedge clk)
	if(rst)
		address = 'd0;
	else
		address = address + 'd1;
	
endmodule