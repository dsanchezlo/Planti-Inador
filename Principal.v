module Principal(clk, rx, MODbomba, MODelectrov, MODluz, lowLevel, highLevel, activarB, prenderB, activarEV, tx, melody, Sseg, anodos);
	input wire clk;
	input wire rx;
	
	// Indica qué módulos están conectados
	input wire MODbomba;
	input wire MODelectrov;
	input wire MODluz;

	// Módulo de la electroválvula
	input wire lowLevel;						// Nivel de agua del tanque alto (5 %)
	input wire highLevel;					// Nivel de agua del tanque alto (90 %)
	
	output wire tx;
	
	// Activa bomba, bombillo, electroválvula, reproduce la melodía escogida y muestra en los displays
	output wire activarB;					// Para activar bomba de agua
	output wire prenderB;					// Para activar bombillo
	output wire activarEV;					// Indica cuando se activa la electroválvula
	output wire melody;						// Melodía para la alarma de regar la planta o para llenar el tanque
	output wire [0:6] Sseg;
	output wire [7:0] anodos;
		
	// Relojes correspondientes a los módulos BaudFreq, divfreq, div1Hz e I2C
	wire clkBaud;
	wire clk1kHz;
	wire clk1Hz;
	
	// Variables del módulo UARTrx
	wire [7:0] dato;
	wire hecho;
	wire ERRrx;
	
	// Variables del módulo UARTtx
	wire init;
	wire [7:0] datotx;
	
	// Variables del módulo decodificador
	wire [11:0] humedad;
	wire [3:0] melodia1;
	wire [3:0] melodia2;
	wire [3:0] maceta;
	wire [3:0] tipoPlanta;
	wire [7:0] hora;
	wire [7:0] minutos;
	wire [19:0] luxes;
	
	// Variables del módulo activar
	wire regar;
		
	// Variables de los módulos de las alarmas
	wire melodyN;
	wire melodyTOM;
	wire melodySCOM;
	
	assign melodyRP = (melodia1[3:0] == 4'd1) ? melodyN:	// Canción Negro - J Balvin
			((melodia1[3:0] == 4'd2) ? melodyTOM:			   // Canción Take On Me - a-ha 
			((melodia1[3:0] == 4'd3) ? melodySCOM : 1'd0));	// Canción Sweet Child O' Mine - Guns N' Roses
	
	assign melodyLT = (melodia2[3:0] == 4'd1) ? melodyN:	// Canción Negro - J Balvin
			((melodia2[3:0] == 4'd2) ? melodyTOM:			   // Canción Take On Me - a-ha 
			((melodia2[3:0] == 4'd3) ? melodySCOM : 1'd0));	// Canción Sweet Child O' Mine - Guns N' Roses
	
	assign melody = (!MODbomba) ? melodyRP : melodyLT;
	
	//		Módulos respectivos a la comunicación UART con el módulo WiFi ESP8266
	BaudFreq baudios(clk, clkBaud);
	UARTrx serialRX(rx, clkBaud, dato, hecho, ERRrx);
	decodificador decoder(hecho, dato, ERRrx, humedad, melodia1, melodia2, maceta, tipoPlanta, hora, minutos, luxes);
	UARTtx serialTX(init, clkBaud, datotx, tx);
	codificador coder(clkBaud, clk1Hz, MODluz, MODbomba, MODelectrov, highLevel, lowLevel, activarB, prenderB, activarEV, regar, datotx, init);
	
	//		Módulos de las alarmas
	activar activ(humedad, tipoPlanta, regar);
	alarmaN Negro(clk, regar, MODbomba, lowLevel, highLevel, melodyN);
	alarmaTOM TakeOnMe(clk, regar, MODbomba, lowLevel, highLevel, melodyTOM);
	alarmaSCOM SweetChildOMine(clk, regar, MODbomba, lowLevel, highLevel, melodySCOM);
	
	//		Módulos respectivos al control y manejo del agua
	bomba bomb(regar, maceta, MODbomba, clk, activarB);
	Electrovalvula electrov(lowLevel, highLevel, MODelectrov, activarEV);
	
	//		Módulos respectivos al módulo de luz
	div1Hz div1H(clk, clk1Hz);
	bombillo bombi(luxes, hora, minutos, tipoPlanta, MODluz, prenderB);

	//		Los displays imprimen los datos recibidos del módulo WiFi ESP8266
	divfreq divf(clk, clk1kHz);
	displays disp(clk1kHz, humedad, melodia, maceta, tipoPlanta, hora, minutos, luxes, Sseg, anodos);
	
endmodule