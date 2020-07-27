module adder #(parameter WIDTH=31)(input logic[WIDTH:0] inputA, inputB,
				output logic[WIDTH:0] result);
				

logic [WIDTH-1:0] operA, operB;
logic [WIDTH-1:0] sum;

assign operA = inputA[WIDTH-1:0];
assign operB = inputB[WIDTH-1:0];

always_comb
	if (inputA[WIDTH] == inputB[WIDTH])
		begin
			sum = operA + operB;
			result = {inputA[WIDTH], sum};
		end
	else
		begin
			if(inputA[WIDTH])
				sum = operB - operA;
			else
				sum = operA - operB;
			
			if(sum[WIDTH-1])
				result = {1'b1, ~sum + 1'b1};
			else
				result = {1'b0, sum};
		end
endmodule
			
	