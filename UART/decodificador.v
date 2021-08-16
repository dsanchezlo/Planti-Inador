module decodificador(hecho, dato, ERRrx, humedad, melodia1, melodia2, maceta, tipoPlanta, hora, minutos, luxes);
	input wire hecho;					// Indica si rx ya leyó el valor de "dato"
	input wire [7:0] dato; 					// Caracter recibido por rx (Dígito)
	input wire ERRrx;					// Indica si hay algún fallo en el dato leído (Paridad)
	output reg [11:0] humedad;				// (3 Dígitos c-d-u)
	output reg [3:0] melodia1; 				// (3 melodías para escoger la alarma que indica que se debe regar la planta)
	output reg [3:0] melodia2; 				// (3 melodías para escoger la alarma que indica que se debe llenar el tanque)
	output reg [3:0] maceta; 				// Tamaño Maceta
	output reg [3:0] tipoPlanta;				// Selección entre Suculenta, Laurel, y Papa
	output reg [7:0] hora;					// Hora del día (0 a 23)
	output reg [7:0] minutos;	 			// Minutos (de 0 a 59)
	output reg [19:0] luxes;				// 1 - 65535 lux
	
	reg [3:0] posicionNum; 					// Debe llegar a 7 (Dígitos)
	
	initial begin
		posicionNum = 4'b0;
	end
	
	always @(posedge hecho) begin
		
		if(!ERRrx) begin
			case(posicionNum)
				4'b0000: humedad[11:8] <= dato[3:0];
				4'b0001: humedad[7:4] <= dato[3:0];
				4'b0010: humedad[3:0] <= dato[3:0];
				4'b0011: melodia1[3:0] <= dato[3:0];
				4'b0100: melodia2[3:0] <= dato[3:0];
				4'b0101: maceta[3:0] <= dato[3:0];
				4'b0110: tipoPlanta <= dato[3:0];
				4'b0111: hora[7:4] <= dato[3:0];
				4'b1000: hora[3:0] <= dato[3:0];
				4'b1001: minutos[7:4] <= dato[3:0];
				4'b1010: minutos[3:0] <= dato[3:0];
				4'b1011: luxes[19:16] <= dato[3:0];
				4'b1100: luxes[15:12] <= dato[3:0];
				4'b1101: luxes[11:8] <= dato[3:0];
				4'b1110: luxes[7:4] <= dato[3:0];
				4'b1111: luxes[3:0] <= dato[3:0];
				default: ;
			endcase
		end
		
		// Reinicia cuando el contador llega a 14
		posicionNum <= (posicionNum < 4'b1111) ? posicionNum + 4'd1 : 4'd0;
		
	end
	
endmodule
