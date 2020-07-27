module multiply#(parameter WIDTH=31)(input logic[WIDTH:0] inputA, inputB,
					output logic[WIDTH:0] result);

logic sign;
logic [WIDTH / 2:0] a, c;
logic [WIDTH / 2 + 1:0] b, d;	
logic [WIDTH:0] high, mid, low;
logic [28*WIDTH:0] mult;	

assign sign = inputA[WIDTH] ^ inputB[WIDTH];
assign a = inputA[WIDTH - 1:WIDTH / 2 + 1];
assign c = inputB[WIDTH - 1:WIDTH / 2 + 1];
assign b = inputA[WIDTH / 2:0];
assign d = inputB[WIDTH / 2:0];

always_comb
	begin
		high = a * c;
		mid = a * d + b * c;
		low = b * d;
		mult = (high << (WIDTH / 2 + 1)) + mid + (low >> (WIDTH / 2 + 1));
		if(mult > 'b111111111111111)
			result = {sign, {WIDTH{1'b1}}};
		else
			result = {sign, mult[WIDTH - 1:0]};
	end
endmodule
