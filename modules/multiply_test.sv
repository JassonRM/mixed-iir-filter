module multiply_test();

logic [15:0] inputA, inputB, result;

multiply DUT(inputA, inputB, result);

initial begin
	inputA = 16'b0000000110000000;
	inputB = 16'b0000001101000000;
	
	#10 assert(result === 16'b0000010011100000) else $error("Op 1 failed");
	
	inputA = 16'b1000000110000000;
	inputB = 16'b0000001101000000;
	
	#10 assert(result === 16'b1000010011100000) else $error("Op 2 failed");
	
	inputA = 16'b0000000110000000;
	inputB = 16'b1000001101000000;
	
	#10 assert(result === 16'b1000010011100000) else $error("Op 3 failed");
	
	inputA = 16'b1000000110000000;
	inputB = 16'b1000001101000000;
	
	#10 assert(result === 16'b0000010011100000) else $error("Op 4 failed");
	
	inputA = 16'b1111111110000000;
	inputB = 16'b1111111101000000;
	
	#10 assert(result === 16'b0111111111111111) else $error("Op 5 failed");
end
endmodule