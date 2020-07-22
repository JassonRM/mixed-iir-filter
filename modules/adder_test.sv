module adder_test();

logic [15:0] inputA, inputB, result;

adder DUT(inputA, inputB, result);

initial begin
	inputA = 16'b0000000110000000;
	inputB = 16'b0000001101000000;
	
	#10 assert(result === 16'b0000010011000000) else $error("Op 1 failed");
	
	inputA = 16'b0000000110000000;
	inputB = 16'b1000001101000000;
	
	#10 assert(result === 16'b1000000111000000) else $error("Op 2 failed");
	
	inputA = 16'b1000000110000000;
	inputB = 16'b0000001101000000;
	
	#10 assert(result === 16'b0000000111000000) else $error("Op 3 failed");
end
endmodule