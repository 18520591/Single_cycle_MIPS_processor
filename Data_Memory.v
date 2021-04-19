module Data_Memory(Read_Data, Address, Write_Data, Write_Enable, Read_Enable, clk);
	input clk, Read_Enable, Write_Enable;
	input [31:0] Address, Write_Data;
	output[31:0] Read_Data;

	reg [31:0] ram [127:0];
	wire [9:0] ram_address = Address[11:2];
	assign Read_Data = (Read_Enable) ? ram[ram_address] : 32'd0;
	always @ (posedge clk)
	begin
		if (Write_Enable)
			ram[ram_address] <= Write_Data;
	end	
endmodule