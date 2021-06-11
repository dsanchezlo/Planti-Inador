module Principal(clk, rx, MODbomba, MODgrifo, MODluz, activarB);
	input wire clk;
	input wire rx;
	
	//Indica qué módulos están conectados
	input wire MODbomba;
	input wire MODgrifo;
	input wire MODluz;
	
	//Para activar bomba de agua
	output wire activarB;
	
	wire clkBaud;
	
	wire [7:0]dato;
	wire hecho;
	
	wire [11:0] humedad;
	wire [15:0] hora;
	wire listo;
	wire [3:0] tipoPlanta;
	
	BaudFreq baudios(clk, clkBaud);
	UARTrx serialRX(rx, clkBaud, dato, hecho);
	decodificador decoder(hecho, dato, humedad, hora, tipoPlanta, listo);
	
	bomba bomb(listo, humedad, activarB);
	
	
	
endmodule 
