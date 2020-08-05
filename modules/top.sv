module top(input logic clk, rst, filter_rst,
				output logic[31:0] low_pass, high_pass);
				

logic[14:0] address;
logic[22:0] x;
		
rom ROM(address, clk, x);
				
filter #(31) LowPass(clk, filter_rst, {9'b0, x},  32'b10000000000000001111110000000010, 32'b00000000000000000000000111111110, 32'b00000000000000000000000111111110, low_pass);
filter #(31) HighPass(clk, filter_rst, {9'b0, x}, 32'b10000000000000001101101010100101, 32'b00000000000000001110110101010010, 32'b10000000000000001110110101010010, high_pass);

always_ff @(posedge clk)
	if(rst)
		address = 15'd0;
	else
		address = address + 15'd1;
	
endmodule