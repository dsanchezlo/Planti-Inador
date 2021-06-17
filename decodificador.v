module decodificador(hecho, dato, humedad, hora, tipoPlanta, listo);
	input wire hecho;			//Indica si rx ya leyó el valor de "dato"
	input wire [7:0] dato; 	//Caracter recibido por rx (Dígito)
	
	output reg [11:0] humedad;	//(3 Dígitos c-d-u)
	output reg [15:0] hora; 	//(4 Dígitos hh-mm)
	output reg [3:0] tipoPlanta;
	output reg listo; //Indica si ya se tomaron los datos de humedad, hora y planta
	reg [2:0] posicionNum; 	//Debe llegar a 7 (Dígitos)
	
	initial begin
		posicionNum = 'b0;
	end
	
	always @(posedge hecho)begin
		case(posicionNum)
			3'b000: begin listo <= 0; humedad[11:8] <= dato[3:0]; end
			3'b001: humedad[7:4] <= dato[3:0];
			3'b010: humedad[3:0] <= dato[3:0];
			3'b011: hora[15:12] <= dato[3:0];
			3'b100: hora[11:8] <= dato[3:0];
			3'b101: hora[7:4] <= dato[3:0];
			3'b110: hora[3:0] <= dato[3:0];
			3'b111: begin tipoPlanta <= dato[3:0]; listo <= 1; end
		endcase
		
		//Reinicia cuando el contador llega a 7
		posicionNum <= (posicionNum <= 3'b111)? posicionNum + 'd1 : 0;
	end
	
endmodule