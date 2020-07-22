module filter_test;

logic clk, rst;
logic[15:0] x, a1, b0, b1, y;

filter DUT(clk, rst, x, a1, b0, b1, y);

initial begin
	clk = 0;
	rst = 1;
	x = 16'b0000001100000000;
	a1 = 16'b1000000011010010;
	b0 = 16'b0000000000010110;
	b1 = 16'b0000000000010110;
	
	#15 rst = 0;
	#10 assert(y === 16'b0000000000001011) else $error("Op 1 failed");
	#5 x = 16'b0000001100110011;
	#15 assert(y === 16'b0000000000100011) else $error("Op 2 failed");
	end

always
	#10 clk = !clk;

endmodule
