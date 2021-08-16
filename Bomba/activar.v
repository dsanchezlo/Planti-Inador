module activar(humedad, tipoPlanta, regar);
	input wire [11:0] humedad;
	input wire [3:0] tipoPlanta;
	output wire regar;				// Indica si se debe regar la planta

	wire [3:0] porcentajeUmbral;

	assign regar = (humedad[7:4] < porcentajeUmbral && humedad[11:8] < 4'd1) ? 1'd1 : 1'd0; 	// Humedad menor al porcentaje umbral
	assign porcentajeUmbral = (tipoPlanta[3:0] == 4'd1) ? 4'd1 :					// Porcentaje umbral de 10 %
				  ((tipoPlanta[3:0] == 4'd2) ? 4'd2 :					// Porcentaje umbral de 20 %
				  ((tipoPlanta[3:0] == 4'd3) ? 4'd3 : 4'd0));				// Porcentaje umbral de 30 %
									  
endmodule
