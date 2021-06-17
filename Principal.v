module Principal(clk, rx, MODbomba, MODgrifo, MODluz, activarB, melody, leds, Sseg, anodos);
	input wire clk;
	input wire rx;
	
	//Indica qué módulos están conectados
	input wire MODbomba;
	input wire MODgrifo;
	input wire MODluz;
	
	//Para activar bomba de agua
	output wire activarB;
	output wire melody;
	output wire [11:0]leds;
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
	alarma negro(regar, clk, melody);
	//alarmaTOM TakeOnMe(regar, clk, melody);
	//alarmaSCOM(regar, clk, melody);
	
	//bomba bomb(listo, humedad, activarB);
	
	divfreq(clk, clk1kHz);
	displays(clk1kHz, humedad, Sseg, anodos);
	
	/*
	input clk;
	output salida;
	
	
	reg [30:0]count;

	initial begin
		count = 'd0;
	end

	always @(posedge clk)begin
		if(count < 'd200_000_000)begin
			count <= count + 'd1;
		end else begin
			salida <= !salida;
			count <= 'd0;
		end
	end*/
	
	assign leds[3:0] = (listo) ? ~humedad[3:0] : 4'b1111;
	assign leds[7:4] = (listo) ? ~humedad[7:4] : 4'b1111;
	assign leds[11:8] = (listo) ? ~humedad[11:8] : 4'b1111;

	
endmodule