module top_pwm(input logic clk, rst, filter_rst,
				output logic low_pass_pwm, high_pass_pwm);
				

logic clk_low_pass, clk_high_pass;
logic[14:0] address;
logic[22:0] x;
logic[31:0] low_pass, high_pass;
		
rom ROM(address, clk_low_pass, x);
				
filter LowPass(clk_low_pass, filter_rst, {9'b0, x}, 32'b10000000000000001111100000010101, 32'b1111110101, 32'b1111110101, low_pass);

filter HighPass(clk_high_pass, filter_rst, {9'b0, x}, 32'b10000000000000001111100000010101, 32'b1111110000001010, 32'b100000000000000001111110000001010, high_pass);

pwm #(23) LowPWM (clk, rst, low_pass[22:0], clk_low_pass, low_pass_pwm);

pwm #(23) HighPWM (clk, rst, high_pass[22:0], clk_high_pass, high_pass_pwm);

always_ff @(posedge clk)
	if(rst)
		address = 15'd0;
	else
		address = address + 15'd1;
	
endmodule