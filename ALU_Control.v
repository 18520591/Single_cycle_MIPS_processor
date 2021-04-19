module ALU_Control(ALUControl, ALUOp, Function);
	input [1:0] ALUOp;
	input [5:0] Function;
	output reg [2:0] ALUControl;
	wire[7:0] ALU_control_In;
	
	assign ALU_control_In = {ALUOp, Function};
	
	always @ (*)
	begin
		casex (ALU_control_In)
			8'b11xxxxxx: ALUControl = 3'b000;
			8'b01xxxxxx: ALUControl = 3'b001;
			8'b10xxxxxx: ALUControl = 3'b111;
			8'b00100000: ALUControl = 3'b000;
			8'b00100010: ALUControl = 3'b001;
			8'b00100100: ALUControl = 3'b010;
			8'b00100101: ALUControl = 3'b011;
			8'b00100110: ALUControl = 3'b100;
			8'b00000010: ALUControl = 3'b110;
			8'b00000000: ALUControl = 3'b101;
			8'b00101010: ALUControl = 3'b111;
			default: ALUControl = 3'b000;
		endcase
	end
endmodule

module JR_Control(JRControl, ALUOp, Function);
	input [1:0] ALUOp;
	input [5:0] Function;
	output JRControl;
	
	assign JRControl = ({ALUOp, Function} == 8'b00001000) ? 1'b1 : 1'b0;
	
endmodule