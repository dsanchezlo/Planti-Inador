`timescale 1ns / 1ns


module testUARTrx;

	// Inputs
	reg rx;
	reg clk;
	reg MODbomba;
	reg MODgrifo;
	reg MODluz;

	// Outputs
	wire activarB;
	wire melody;
	wire [0:6] Sseg;
	wire [7:0] anodos;

	// Instantiate the Unit Under Test (UUT)
	Principal uut ( .clk(clk), 
			.rx(rx), 
			.MODbomba(MODbomba),
			.MODgrifo(MODgrifo), 
			.MODluz(MODluz), 
			.activarB(activarB), 
			.melody(melody), 
			.Sseg(Sseg), 
			.anodos(anodos)
	);

	initial begin
		// Initialize Inputs
		clk= 0;
		MODbomba = 0;
		MODgrifo = 0;
		MODluz = 0;
		rx = 1;
	end
      

	always begin 
		#10;
		clk = ~clk;
	end
	always begin
		#20000
		rx = 0;
		#8710
		rx = 1;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 1;
		#8710
		rx = 1;
		#8710
		rx = 0;
		#8710
		rx = 1;
		#8710

		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 1;
		#8710
		rx = 1;
		#8710
		rx = 0;
		#8710
		rx = 0;
		#8710
		rx = 1;
		#534262420
		rx = 1;
	end
endmodule
