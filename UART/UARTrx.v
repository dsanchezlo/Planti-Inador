//Características:
//		Velocidad de transmisión Baudios 115200
//		Número de bits 8
//		Bit de inicio 0

module UARTrx(rx, clkBaud, dato, hecho);
	input wire rx;			//Datos comunicación serial
	input wire clkBaud;	//Reloj para 115200 Baudios
	output reg [7:0]dato;//Dato leído
	output reg hecho;		//Indica si ya se leyó el valor correcto
	
	//Estados necesarios para recibir los datos
	parameter ESPERAR = 2'b00;
	parameter RECIBIR = 2'b01;
	
	reg [1:0]estado;
	reg recibido;			//Referencia al estado RECIBIR
	reg [2:0]bitActual;	//Contador posición en la que se está leyendo

	initial begin
		estado = ESPERAR;
		recibido = 'b0;
		bitActual = 'd0;
		dato = 'd0;
		hecho = 'b0;
	end
	
	
	always @(posedge clkBaud)begin
		if(recibido)
			dato[bitActual] <= rx;	//Leer el bit en la posición actual
		else if (!rx)
			dato <= 'd0;
	end
	
	always @(posedge clkBaud)begin
		case(estado)
			ESPERAR: begin
							if (!rx)begin	//Se activa con el primer bit de la señal (Cero)
								hecho <= 'd0;
								bitActual <= 'd0;
								estado <= RECIBIR;
								recibido <= 'b1;
							end
						end
			RECIBIR: begin
							if(bitActual == 'd7)begin	//Si ya se leyeron todos los bits
								recibido <= 'b0;
								hecho <= 1;
								estado <= ESPERAR;
							end
							bitActual <= bitActual + 1'd1;
						end
			default: estado <= ESPERAR;
		endcase
	end
	
endmodule
