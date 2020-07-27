module pwm #(parameter N = 31) (input logic clk, rst,
											input logic[N-1:0] digital_in,
											output logic eoc, pulse);
											
	logic[N-1:0] count;
											
	always_ff @(posedge clk)
	if (rst)
		begin
			count = 0;
			eoc = 1;
		end
	else 
		begin
			pulse = count < digital_in;// ? 1'b1 : 1'b0;
	//		if count < digital_in
	//			pulse = 1'b1;
	//		else
	//			pulse = 1'b0;	
			count = count + 'b1;
			eoc = count == 'b0; 
		end
	
	
endmodule 