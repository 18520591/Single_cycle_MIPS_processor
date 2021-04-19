module Register_File(Read_Data_A, Read_Data_B, Read_Address_A, Read_Address_B, Write_Address, Write_Data, Read_Write_En, clk, Reset);
	input [31:0] Write_Data;
	input [4:0] Read_Address_A, Read_Address_B, Write_Address;
	input Read_Write_En, clk, Reset;
	output [31:0] Read_Data_A, Read_Data_B;
	
	reg [31:0] register [31:0];
	
	assign Read_Data_A = register[Read_Address_A];
	assign Read_Data_B = register[Read_Address_B];
	always @ (posedge clk or posedge Reset)
	begin
		if(Reset)
		begin
			register[0] <= 32'd0;
			register[1] <= 32'd0;
			register[2] <= 32'd0;
			register[3] <= 32'd0;
			register[4] <= 32'd0;
			register[5] <= 32'd0;
			register[6] <= 32'd0;
			register[7] <= 32'd0;
			register[8] <= 32'd0;
			register[9] <= 32'd0;
			register[10] <= 32'd0;
			register[11] <= 32'd0;
			register[12] <= 32'd0;
			register[13] <= 32'd0;
			register[14] <= 32'd0;
			register[15] <= 32'd0;
			register[16] <= 32'd0;
			register[17] <= 32'd0;
			register[18] <= 32'd0;
			register[19] <= 32'd0;
			register[20] <= 32'd0;
			register[21] <= 32'd0;
			register[22] <= 32'd0;
			register[23] <= 32'd0;
			register[24] <= 32'd0;
			register[25] <= 32'd0;
			register[26] <= 32'd0;
			register[27] <= 32'd0;
			register[28] <= 32'd0;
			register[29] <= 32'd0;
			register[30] <= 32'd0;
			register[31] <= 32'd0;
		end
		else
		begin
		if (Read_Write_En == 1)
			register[Write_Address] <= Write_Data;
		end
	end
endmodule