module MIPS(PC_Out, ALU_Result, Add_Sub_overflow, clock, Reset);
	input clock, Reset;
	output Add_Sub_overflow;
	output [31:0] PC_Out, ALU_Result;
	reg[31:0] PC_Current;
	wire signed [31:0] PC_Next, PC;
	wire[31:0]  sign_extend, sign_extend_shift_2, instruction;
	wire[27:0] jump_shift_left_2;
	wire[31:0] Mem_ReadData, Reg_ReadData_A, Reg_ReadData_B, ReadData_B, Reg_Write_Data, PC_beq, PC_4beq, PC_j, PC_jr;
	wire[4:0] Reg_Write_Address;
	wire[2:0] ALUControl;
	wire [1:0] RegDst, MemtoReg, ALUOp;
	wire ALUSrc, RegWrite, MemRead, MemWrite, Branch, Jump, JRControl, zero;
	
	always @ (posedge clock or posedge Reset)
	begin
		if (Reset)
			PC_Current <= 32'd0;
		else
			PC_Current <= PC_Next;
	end
	//PC + 4
	assign PC = PC_Current + 32'd4;
	//instruction Memory
	IMEM Instruction_Memory(PC_Current, instruction);
	//jump shift left 2
	assign jump_shift_left_2 = {instruction[25:0], 2'b00};
	//control
	control control_unit(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, instruction[31:26], Reset);
	//register
	assign Reg_Write_Address = (RegDst == 2'b10) ? 5'b11111 : ((RegDst == 2'b00) ? instruction[20:16] : instruction[15:11]);
	Register_File register(	Reg_ReadData_A, 
									Reg_ReadData_B, 
									instruction[25:21], 
									instruction[20:16], 
									Reg_Write_Address, 
									Reg_Write_Data, 
									RegWrite, 
									clock, 
									Reset);
	//sign extend
	assign sign_extend = {{16{instruction[15]}}, instruction[15:0]};
	//JR control
	JR_Control JR_Control_unit(JRControl, ALUOp, instruction[5:0]);
	//ALU control
	ALU_Control ALU_Control_unit(ALUControl, ALUOp, instruction[5:0]);
	//mux ALUsrc
	assign ReadData_B = (ALUSrc) ? sign_extend : Reg_ReadData_B;
	//ALU
	ALU ALU_unit(ALU_Result, Add_Sub_overflow, zero, ALUControl, Reg_ReadData_A, ReadData_B);
	//shift left 2
	assign sign_extend_shift_2 = {sign_extend[29:0], 2'b00};
	//PC beq
	assign PC_beq = PC + sign_extend_shift_2;
	//4beq
	assign PC_4beq =(Branch & zero) ? PC_beq : PC;
	//PC j
	assign PC_j = (Jump) ? {PC[31:28], jump_shift_left_2} : PC_4beq;
	//PC jar
	assign PC_jr = Reg_ReadData_A;
	//PC_Next
	assign PC_Next = (JRControl) ? PC_jr : PC_j;
	//data memory
	Data_Memory DataMemory(Mem_ReadData, ALU_Result, Reg_ReadData_B, MemWrite, MemRead, clock);
	//write back
	assign Reg_Write_Data = (MemtoReg == 2'b10) ? PC : (MemtoReg == 2'b00) ? ALU_Result : Mem_ReadData;
	//output
	assign PC_Out = PC_Current;
endmodule
