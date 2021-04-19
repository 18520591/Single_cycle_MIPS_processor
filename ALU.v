module ALU(ALU_Result, Add_Sub_overflow, zero, ALU_Control, InA, InB);
	input[2:0] ALU_Control;
	input[31:0] InA, InB;
	output reg[31:0] ALU_Result;
	output reg Add_Sub_overflow;
	output zero;
	
	always @ (*)
	begin
		case(ALU_Control)
			3'b000:
			begin
				ALU_Result = InA + InB;
				if (InA > 0 && InB > 0)
				begin
					if (ALU_Result[31] == 1)
						Add_Sub_overflow <= 1;
					else
						Add_Sub_overflow <= 0;
				end
				if (InA < 0 && InB < 0)
				begin
					if (ALU_Result[31] == 0)
						Add_Sub_overflow <= 1;
					else
						Add_Sub_overflow <= 0;
				end
			end
			3'b001: 
			begin
				ALU_Result <= InA - InB;
				if (InA > 0 && InB < 0)
				begin
					if(ALU_Result[31] == 1)
						Add_Sub_overflow <= 1;
					else
						Add_Sub_overflow <= 0;
				end
				if (InA < 0 && InB > 0)
				begin
					if(ALU_Result[31] == 0)
						Add_Sub_overflow <= 1;
					else
						Add_Sub_overflow <= 0;
				end
			end
			3'b010: ALU_Result <= InA & InB;
			3'b011: ALU_Result <= InA | InB;
			3'b100: ALU_Result <= InA ^ InB;
			3'b101: ALU_Result <= InA << InB;
			3'b110: ALU_Result <= InA >>> InB;
			3'b111: 
			begin
				ALU_Result <= (InA < InB) ? 16'd1 : 16'd0;
			end
			default: ALU_Result = 0;
		endcase
	end
	assign zero = (ALU_Result == 32'd0) ? 1'b1 : 1'b0;
endmodule