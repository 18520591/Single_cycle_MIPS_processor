module IMEM (
	input [31:0] addr,
	output [31:0] instruction
);
	wire [9:0] rom_address = addr[11:2]; 
	reg [31:0] rom[2**10-1:0];

	initial begin
		$readmemb("binary.txt", rom);
	end
	assign instruction = rom[rom_address];
endmodule
