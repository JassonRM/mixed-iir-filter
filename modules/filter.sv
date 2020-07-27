module filter#(parameter WIDTH=31)(input logic clk, rst,
					input logic[WIDTH:0] x, a1, b0, b1,
					output logic[WIDTH:0] y);
					
logic[WIDTH:0] offset, w1, w2, a1w, b0w, b1w, out;

adder #(WIDTH) Adder0(x, {1'b1, {(WIDTH / 2 - 2){1'b0}}, 3'b101, {(WIDTH / 2){1'b0}}}, offset);

multiply #(WIDTH) Multiply1({(a1[WIDTH] ^ 1'b1), a1[WIDTH-1:0]}, w1, a1w);

adder #(WIDTH) Adder1(offset, a1w, w2);

multiply #(WIDTH) Multiply2(b0, w2, b0w);

multiply #(WIDTH) Multiply3(b1, w1, b1w);

adder #(WIDTH) Adder2(b0w, b1w, out);

adder #(WIDTH) Adder3(out, {{(WIDTH / 2 - 1){1'b0}}, 3'b101, {(WIDTH / 2){1'b0}}}, y);

always_ff @(posedge clk)
	if(rst)
		w1 = 0;
	else
		w1 = w2;

endmodule
