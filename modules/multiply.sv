module multiply(input logic[15:0] inputA, inputB,
					output logic[15:0] result);

logic sign;
logic [6:0] a, c;
logic [7:0] b, d;
logic [14:0] mult;					
logic [15:0] high, mid, low;

assign sign = inputA[15] ^ inputB[15];
assign a = inputA[14:8];
assign c = inputB[14:8];
assign b = inputA[7:0];
assign d = inputB[7:0];

always_comb
	begin
		high = a * c;
		mid = a * d + b * c;
		low = b * d;
		if(high > 16'b11111111)
			mult = 15'b111111111111111;
		else
			mult = (high << 8) + mid + (low >> 8);
		result = {sign, mult};
	end
endmodule
