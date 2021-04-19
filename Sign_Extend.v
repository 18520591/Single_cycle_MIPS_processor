module Sign_Extend(Out, In);
	input[15:0] In;
	output[31:0] Out;
	
	assign Out = (In[15]) ? (In | 32'hFFFF0000) : (In | 32'h00000000);
endmodule
