module top_test;

logic clk, rst;
logic[15:0] low_pass, high_pass;

top DUT(clk, rst, low_pass, high_pass);

initial begin
	clk = 0;
	rst = 1;
	#15 rst = 0;
	end

always
	#10 clk = !clk;

endmodule
