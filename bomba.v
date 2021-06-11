module bomba(listo, humedad, activarB);
	input wire listo; //Indica si ya se puede usar el dato de humedad
	input wire [11:0] humedad; //(3 Dígitos c-d-u)
	
	output wire activarB; //Para activar la bomba

	//Si la humedad es menor o igual a 19%
	assign activarB = (humedad[7:4] <= 'd1)? 1 : 0;

endmodule 