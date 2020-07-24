module filter(input logic clk, rst,
					input logic[15:0] x, a1, b0, b1,
					output logic[15:0] y);
					
logic[15:0] offset, w1, w2, a1w, b0w, b1w;

adder Adder0(x, 16'b1000001010000000, offset);

multiply Multiply1({(a1[15] ^ 1'b1), a1[14:0]}, w1, a1w);

adder Adder1(offset, a1w, w2);

multiply Multiply2(b0, w2, b0w);

multiply Multiply3(b1, w1, b1w);

adder Adder2(b0w, b1w, y);

always_ff @(posedge clk)
	if(rst)
		w1 = 0;
	else
		w1 = w2;

endmodule
