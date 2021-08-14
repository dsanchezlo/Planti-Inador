module bombillo(luxes, hora, minutos, tipoPlanta, MODluz, prenderB);
	input wire [19:0] luxes;				 // 1 - 65535 lux
	input wire [7:0] hora;					 // Hora del día (0 a 23)
	input wire [7:0] minutos;	 			 // Minutos (de 0 a 59)
	input wire [3:0] tipoPlanta;			 // Selección entre Suculenta, Laurel, y Papa
	input wire MODluz;						 // Indica si el módulo de luz esta conectado
	output reg prenderB; 					 // Para prender el bombillo

	wire [8:0] tiempoIluminacion;			 // Indica el tiempo de iluminación que requiere según el tipo de planta
	
	reg [9:0] contMinLuz;					 // Cuenta los minutos de luz que ha recibido la planta

	parameter Suculenta = 4'd1;
	parameter Laurel = 4'd2;
	parameter Papa = 4'd3;
	parameter limLuxes = 4'd2; 	 		 // Límite de suficiente luz solar (20.000 lx)

	assign tiempoIluminacion = (tipoPlanta[3:0] == Suculenta) ? 9'd0 :		// Suculenta, tiempo de iluminación de 0 min
				   ((tipoPlanta[3:0] == Laurel) ? 9'd240 :							// Laurel, tiempo de iluminación de 240 min (4 horas)
				   ((tipoPlanta[3:0] == Papa) ? 9'd480 : 9'd0));					// Papa, tiempo de iluminación de 480 min (8 horas)

	initial begin
		prenderB = 1'b0;
		contMinLuz = 10'b0;
	end
	
	always @(posedge minutos[0]) begin
		if(hora[7:4] == 4'b0 && hora[3:0] == 4'b0) begin				 			// Reset cada que inicia un nuevo día
			prenderB <= 1'b0;
			contMinLuz <= 10'b0;
		end

		if(MODluz) begin						 // Si el módulo de luz está conectado
		
			if((luxes[19:16] >= limLuxes && ( (hora[7:4] == 4'd0 && hora[3:0] > 4'd7) ||		// 7 < hora < 17
													    (hora[7:4] == 4'd1 && hora[3:0] < 4'd7) )
				) || prenderB) begin
				contMinLuz <= contMinLuz + 10'd2;
			end

			case(tipoPlanta)
				Laurel: begin
					if((hora[7:4] == 4'd1 && hora[3:0] >= 4'd3 && hora[3:0] < 4'd7)				// 13 <= hora < 17
						&& contMinLuz < tiempoIluminacion && luxes[19:16] < limLuxes) begin
						prenderB <= 1'b1;
					end else prenderB <= 1'b0;
				end
				Papa:	begin
					if(( (hora[7:4] == 4'd0 && hora[3:0] >= 4'd9) ||									// 9 <= hora < 17
						  (hora[7:4] == 4'd1 && hora[3:0] < 4'd7) )
						&& contMinLuz < tiempoIluminacion && luxes[19:16] < limLuxes) begin
						prenderB <= 1'b1;
					end else prenderB <= 1'b0;
				end
				default: prenderB <= 1'b0;
			endcase
			
		end else prenderB <= 1'b0;
				
	end

endmodule