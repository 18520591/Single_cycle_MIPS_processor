module control(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, Opcode, Reset);
	input[5:0] Opcode;
	input Reset;
	output reg [1:0] RegDst, MemtoReg, ALUOp;
	output reg ALUSrc, RegWrite, MemRead, MemWrite, Branch, Jump;
	
	always @ (*)
	begin
		if (Reset)
		begin
			RegDst <= 2'b00;
			ALUSrc <= 1'b0;
			MemtoReg <= 2'b00;
			RegWrite <= 1'b0;
			MemRead <= 1'b0;
			MemWrite <= 1'b0;
			Branch <= 1'b0;
			ALUOp <= 2'b00;
			Jump <= 1'b0;
		end
		else
		begin
			case (Opcode)
				6'h0:		//R_type
				begin
					RegDst <= 2'b01;
					ALUSrc <= 1'b0;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b1;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b00;
					Jump <= 1'b0;
				end
				6'h23:	//LW
				begin
					RegDst <= 2'b00;
					ALUSrc <= 1'b1;
					MemtoReg <= 2'b01;
					RegWrite <= 1'b1;
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b11;
					Jump <= 1'b0;

				end
				6'h2b:	//SW
				begin
					RegDst <= 2'b00;
					ALUSrc <= 1'b1;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b0;
					MemRead <= 1'b0;
					MemWrite <= 1'b1;
					Branch <= 1'b0;
					ALUOp <= 2'b11;
					Jump <= 1'b0;
	
				end
				6'h8:		//addi
				begin
					RegDst <= 2'b00;
					ALUSrc <= 1'b1;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b1;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b11;
					Jump <= 1'b0;

				end
				6'h4:		//beq
				begin
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b0;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b1;
					ALUOp <= 2'b01;
					Jump <= 1'b0;

				end
				6'h2:		//j
				begin
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b0;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b00;
					Jump <= 1'b1;
				end
				6'h3:		//jal
				begin
					RegDst <= 2'b10;
					ALUSrc <= 1'b0;
					MemtoReg <= 2'b10;
					RegWrite <= 1'b1;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b00;
					Jump <= 1'b1;
				end
				6'ha:		//slti
				begin
					RegDst <= 2'b00;
					ALUSrc <= 1'b1;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b1;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b10;
					Jump <= 1'b0;
				end
				default: 
				begin
					RegDst <= 2'b01;
					ALUSrc <= 1'b0;
					MemtoReg <= 2'b00;
					RegWrite <= 1'b1;
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Branch <= 1'b0;
					ALUOp <= 2'b00;
					Jump <= 1'b0;
				end
			endcase
		end
	end
endmodule