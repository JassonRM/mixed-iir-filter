`timescale 1 ps/ 1 ps

module top_pwm_test;

logic clk, rst, filter_rst, low_pass, high_pass;

top_pwm DUT(clk, rst, filter_rst, low_pass, high_pass);

integer low_data, high_data;

initial begin
	clk = 0;
	rst = 1;
	filter_rst = 1;
	#15 rst = 0;
	#20 filter_rst = 0;
	// synthesis translate_off
	low_data = $fopen("A:/mixed-iir-filter/low_pass.txt");
	high_data = $fopen("A:/mixed-iir-filter/high_pass.txt");
	// synthesis translate_on
	end

always
	#10 clk = !clk;

always_ff @(posedge clk)
	begin
	$fdisplay(low_data, "%b", low_pass);
	$fdisplay(high_data, "%b", high_pass);
	end
endmodule
