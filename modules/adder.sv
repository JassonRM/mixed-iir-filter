module adder(input logic[15:0] inputA, inputB,
				output logic[15:0] result);
				

logic [14:0] operA, operB;
logic [14:0] sum;

assign operA = inputA[14:0];
assign operB = inputB[14:0];

always_comb
	if (inputA[15] == inputB[15])
		begin
			sum = operA + operB;
			result = {inputA[15], sum};
		end
	else
		begin
			if(inputA[15])
				sum = operB - operA;
			else
				sum = operA - operB;
			
			if(sum[14])
				result = {1'b1, ~sum + 1'b1};
			else
				result = {1'b0, sum};
		end
endmodule
			
	