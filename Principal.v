module Principal(clk, rx, MODbomba, MODgrifo, MODluz, activarB, melody, Sseg, anodos);
	input wire clk;
	input wire rx;
	
	//Indica qué módulos están conectados
	input wire MODbomba;
	input wire MODgrifo;
	input wire MODluz;
	
	//Para activar bomba de agua
	output wire activarB;
	output wire melody;
	output wire [0:6]Sseg;
	output wire [7:0]anodos;
	
	wire clkBaud;
	wire clk1kHz;
	
	wire [7:0]dato;
	wire hecho;
	
	wire [11:0] humedad;
	wire [15:0] hora;
	wire listo;
	wire [3:0] tipoPlanta;
	
	wire regar;
	wire [2:0]contadorbar;
	
	BaudFreq baudios(clk, clkBaud);
	UARTrx serialRX(rx, clkBaud, dato, hecho);
	decodificador decoder(hecho, dato, humedad, hora, tipoPlanta, listo);
	
	activar (humedad, regar);
	//alarmaN negro(regar, clk, melody);
	//alarmaTOM TakeOnMe(regar, clk, melody);
	alarmaSCOM(regar, clk, melody);
	
	//bomba bomb(listo, humedad, activarB);
	
	divfreq(clk, clk1kHz);
	displays(clk1kHz, humedad, hora, tipoPlanta, Sseg, anodos);

	
endmodule