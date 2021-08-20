//		Características:
//		Velocidad de transmisión Baudios 115200
//		Número de bits 8
//		Bit de inicio 0

module UARTrx(rx, clkBaud, dato, hecho, ERRrx);
	input wire rx;										// Datos comunicacón serial
	input wire clkBaud;									// Reloj para 115200 Baudios
	output reg [7:0] dato;									// Dato leído
	output reg hecho;									// Indica si ya se leyó el dato recibido
	output reg ERRrx;									// Indica si hay algún fallo en el dato leído (Paridad)
	
	// Estados necesarios para recibir los datos
	parameter ESPERAR = 2'b00;
	parameter RECIBIR = 2'b01;
	
	reg [1:0] estado;									// Máquina de estados
	reg recibido;										// Referencia al estado RECIBIR
	reg [2:0] bitActual;									// Contador posición en la que se está leyendo
	
	initial begin
		estado = ESPERAR;
		recibido = 1'b0;
		bitActual = 3'd0;
		dato = 8'd0;
		hecho = 1'b0;
		ERRrx = 1'b0;
	end
	
	
	always @(posedge clkBaud) begin
		if(recibido)
			dato[bitActual] <= rx;							// Leer el bit en la posición actual
		else if (!rx)
			dato <= 8'd0;
	end
	
	always @(posedge clkBaud) begin
		case(estado)
			ESPERAR: begin
							if (!rx) begin				// Se activa con el primer bit de la señal (cero)
								hecho <= 1'b0;
								ERRrx <= 1'b0;
								bitActual <= 3'd0;
								estado <= RECIBIR;
								recibido <= 1'b1;
							end
						end
			RECIBIR: begin
							if(bitActual == 3'd7) begin		// Si ya se leyeron todos los bits
								recibido <= 1'b0;
								ERRrx <= ((rx && 		// Números que requieren que el bit de paridad sea 1
									dato[6:0] != 7'd49 && 	// 1 en ASCII
									dato[6:0] != 7'd50 && 	// 2 en ASCII
									dato[6:0] != 7'd52 && 	// 4 en ASCII
									dato[6:0] != 7'd55 &&	// 7 en ASCII
									dato[6:0] != 7'd56) || 	// 8 en ASCII
									(!rx && 		// Números que requieren que el bit de paridad sea 0
									dato[6:0] != 7'd48 && 	// 0 en ASCII
									dato[6:0] != 7'd51 && 	// 3 en ASCII
									dato[6:0] != 7'd53 && 	// 5 en ASCII
									dato[6:0] != 7'd54 && 	// 6 en ASCII
									dato[6:0] != 7'd57 ))	// 9 en ASCII
									? 1'b1 : 1'b0;
								hecho <= 1'b1;
								estado <= ESPERAR;
							end
							bitActual <= bitActual + 3'b1;
						end
			default: estado <= ESPERAR;
		endcase
	end
	
endmodule
