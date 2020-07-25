`timescale 1 ps/ 1 ps
module pwm_test;

	logic clk, rst, eoc, pulse;
	logic[30:0] digital_in;
	
	pwm #(16) DUT (clk, rst, digital_in, eoc, pulse);
	
	
	initial begin
		clk = 0;
		rst = 1;
		#15 rst = 0;
		
		digital_in = 'd10;
		
	
	end
	
	always 
			#10 clk <= !clk;
	
endmodule 