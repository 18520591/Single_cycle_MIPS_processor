`timescale 1ns/1ps
module testbench();
	reg clock, reset;
	wire Add_Sub_overflow;
	wire [31:0] ALU_result, PC_out;
	
	initial begin
		clock <= 1'b0;
		reset <= 1'b1;
		#100
		reset <= 1'b0;
		#5000 $finish;
	end
	
	always @ (clock)
	#50 clock <= ~clock;
	
	MIPS M(PC_out, ALU_result, Add_Sub_overflow, clock, reset);
	
endmodule
