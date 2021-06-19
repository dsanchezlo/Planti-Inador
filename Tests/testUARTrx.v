`timescale 1ns / 1ns


module testUARTrx;

	// Inputs
	reg rx;
	reg clk;

	// Outputs
	wire [7:0] dato;

	// Instantiate the Unit Under Test (UUT)
	Principal uut (
		.clk(clk), 
		.rx(rx), 
		.dato(dato)
	);

	initial begin
		// Initialize Inputs
		clk= 0;
		rx = 1;
	end
      

	always begin 
		#10;
		clk = ~clk;
	end
	always begin
		#53426242
		rx = 0;
		#4608030
		rx = 1;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 1;
		#4608030
		rx = 1;
		#4608030
		rx = 0;
		#4608030
		rx = 1;
		#4608030

		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 1;
		#4608030
		rx = 1;
		#4608030
		rx = 0;
		#4608030
		rx = 0;
		#4608030
		rx = 1;
		#534262420
		rx = 1;
	end
endmodule