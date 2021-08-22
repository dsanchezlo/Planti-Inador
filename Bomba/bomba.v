module bomba(regar, maceta, MODbomba, clk, activarB);
	input wire regar; 		// Indica si se debe regar la planta
	input wire MODbomba;		// Indica si el módulo de la bomba está conectado
	input wire [3:0] maceta; 	// Tamaño Maceta
	input clk;
	output reg activarB; 		// Para activar la bomba

	wire [1:0] tiempoRegado;	// Indica el tiempo de regado
	
	reg [63:0] temporizador;	// Contador para el temporizador de regado
	reg activarR;			// Activa el temporizador para empezar a regar la planta

	
	// Si la humedad es menor a 20 %
	
	assign tiempoRegado = (maceta[3:0] == 4'd1) ? 2'd1 :		// Tiempo de regado de 30 seg
			      ((maceta[3:0] == 4'd2) ? 2'd2 :		// Tiempo de regado de 1 min
			      ((maceta[3:0] == 4'd3) ? 2'd3 : 2'd0));	// Tiempo de regado de 1.5 min


	initial begin
		temporizador = 64'd0;
		activarR = 1'd0;
		activarB = 1'd0;
	end

	always @(posedge clk) begin					// 50_000_000*30*tiempoRegado
		if(MODbomba) begin
			if(regar && !activarR) begin
				activarR <= 1'd1;
			end
			if(activarR) begin
				activarB <= 1'd1;
				if(temporizador < 64'd50_000_000 * 64'd30 * tiempoRegado) begin
					temporizador <= temporizador + 64'd1;
				end else begin
					activarR <= 1'd0;
					activarB <= 1'd0;
					temporizador <= 64'd0;
				end
			end
		end else activarB <= 1'd0;
	end
								 
endmodule
