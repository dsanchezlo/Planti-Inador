module activar(humedad, regar);
	
	input wire [11:0] humedad;
	output wire regar;

	assign regar = (humedad[7:4] <= 'd1 && humedad[11:8] < 1)? 1 : 0; // Humedad menor al 19%
	//assign regar = 1;

endmodule