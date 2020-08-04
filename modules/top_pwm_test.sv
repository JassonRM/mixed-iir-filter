`timescale 1 ps/ 1 ps

module top_pwm_test;

logic clk, rst, filter_rst, low_pass, high_pass, lp_old, hp_old;

top_pwm DUT(clk, rst, filter_rst, low_pass, high_pass);

integer low_data, high_data;

initial begin
	$timeformat(-12, 0, "ps", 3);
	clk = 0;
	rst = 1;
	filter_rst = 1;
	#3 rst = 0;
	#260 filter_rst = 0;
	// synthesis translate_off
	low_data = $fopen("A:/mixed-iir-filter/low_pass.txt");
	high_data = $fopen("A:/mixed-iir-filter/high_pass.txt");
	// synthesis translate_on
	end

always
	#2 clk = !clk;

always_ff @(posedge clk)
	begin
		if(low_pass != lp_old)
			begin
				$fdisplay(low_data, " %t %1dV", $time - 2, 5 * lp_old);
				$fdisplay(low_data, " %t %1dV", $time, 5 * low_pass);
			end
		if(high_pass != hp_old)
			begin
				$fdisplay(high_data, " %t %1dV", $time - 2, 5 * lp_old);
				$fdisplay(high_data, " %t %1dV", $time, 5 * high_pass);
			end
			
		lp_old <= low_pass;
		hp_old <= high_pass;
	end
endmodule
