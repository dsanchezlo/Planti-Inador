module UARTtx(init, clkBaud, datotx, tx);
	input wire init;							// Empezar a enviar el byte
	input wire clkBaud;							// Reloj para 115200 Baudios
	input wire [7:0] datotx;						// Incluye el dato a enviar y el bit de paridad
	output reg tx;								// Transmisión de datos
	
	// Estados necesarios para enviar los datos
	parameter INICIAR = 2'b00;
	parameter ENVIAR = 2'b01;

	reg [1:0] estado;							// Máquina de estados
	reg inicio;								// Referencia al estado INICIAR
	reg envio;								// Referencia al estado ENVIAR
	reg [2:0] posicion;							// Contador posición en la que se está enviando

	initial begin
		tx = 1'b1;
		estado = INICIAR;
		inicio = 1'b0;
		envio = 1'b0;
		posicion = 3'b0;
	end


	always @(posedge clkBaud) begin
		if(inicio) tx <= 1'b0;
		if(envio) begin
			tx <= datotx[posicion];					// Leer el bit en la posición actual
			posicion <= posicion + 3'b1;
		end
		if(!inicio && !envio) tx <= 1'b1;
	end

	always @(posedge clkBaud) begin
		case(estado)
			INICIAR: begin
					inicio <= 1'b0;
					envio <= 1'b0;
					if(init) begin
						inicio <= 1'b1;
						estado <= ENVIAR;
					end
				end
			ENVIAR: begin
					inicio <= 1'b0;
					envio <= 1'b1;
					if(posicion == 3'd7) begin		// Si ya se envió todo el dato
						estado <= INICIAR;
						envio <= 1'b0;
					end			
				end
			default: estado <= INICIAR;
		endcase
	end



endmodule
