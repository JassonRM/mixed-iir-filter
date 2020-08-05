module top_pwm(input logic clk, rst, filter_rst,
				output logic low_pass_pwm, high_pass_pwm);
				

logic clk_low_pass, clk_high_pass;
logic[14:0] address;
logic[22:0] x;
logic[31:0] low_pass, high_pass;
		
rom ROM(address, clk_low_pass, x);
			
filter #(31) LowPass(clk_low_pass, filter_rst, {9'b0, x},  32'b10000000000000001111110000000010, 32'b00000000000000000000000111111110, 32'b00000000000000000000000111111110, low_pass);
filter #(31) HighPass(clk_high_pass, filter_rst, {9'b0, x}, 32'b10000000000000001101101010100101, 32'b00000000000000001110110101010010, 32'b10000000000000001110110101010010, high_pass);		

pwm #(6) LowPWM (clk, rst, low_pass[18:13], clk_low_pass, low_pass_pwm);

pwm #(6) HighPWM (clk, rst, high_pass[18:13], clk_high_pass, high_pass_pwm);

always_ff @(posedge clk_low_pass)
	if(rst)
		address = 15'd0;
	else
		address = address + 15'd1;
	
endmodule