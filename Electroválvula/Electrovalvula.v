module Electrovalvula(lowLevel, highLevel, MODelectrov, activarEV);
	input wire lowLevel;		// Nivel de agua del tanque alto (5 %)
	input wire highLevel;		// Nivel de agua del tanque alto (90 %)
	input wire MODelectrov;
	output wire activarEV;		// Indica cuando se activa la electroválvula

	wire alto;
	wire bajo;
	wire onOffEV;
	
	
	//		highLevel == 1 cuando el nivel > 90 %
	//		highLevel == 0 cuando el nivel < 90 %
	//		lowLevel  == 0 cuando el nivel <  5 %
	//		lowLevel  == 1 cuando el nivel >  5 %

	//		if(highLevel && lowLevel)		Tanque lleno, activarEV = 0 
	//		if(highLevel && !lowLevel)		No ocurre porque el nivel no puede ser < 5 % y > 90 %
	//		if(!highLevel && lowLevel)		Si se está vaciando activarEV = 0, si se está llenando activarEV = 1
	//		if(!highLevel && !lowLevel)		Tanque vacío, activarEV = 1


	assign activarEV = (MODelectrov) ? bajo : 1'b0;

	assign bajo = (lowLevel) ? alto : 1'b1;

	assign alto = (highLevel) ? 1'b0: onOffEV;

	assign onOffEV = (activarEV) ? 1'b1 : 1'b0;

endmodule
