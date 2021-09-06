module codificador(clkBaud, clk1Hz, MODluz, MODbomba, MODelectrov, highLevel, lowLevel, activarB, prenderB, activarEV, regar, datotx, init);
	input wire clkBaud;
	input wire clk1Hz;
	input wire MODluz;
	input wire MODbomba;
	input wire MODelectrov;
	input wire highLevel;
	input wire lowLevel;
	input wire activarB;
	input wire prenderB;
	input wire activarEV;
	input wire regar;
	output reg [7:0] datotx;
	output reg init;

	reg enviarPaquete;
	reg [3:0] enviarByte;
	
	reg [3:0] posPaquete;
	
	reg finPaquete;

	reg [5:0] clkcount; 									// Para enviar el paquete de datos cada 20 seg

	reg aux;


	initial begin
		datotx = 8'd0;
		init = 1'b0;
		enviarPaquete = 1'b0;
		enviarByte = 4'd0;
		posPaquete = 4'd0;
		finPaquete = 1'b0;
		clkcount = 1'b0;
		aux = 1'b0;
	end

	always @(posedge clk1Hz) begin
		if (clkcount == 5'd20) begin
			enviarPaquete <= 1'b1;
			clkcount <= 5'b0;
		end else begin
			clkcount <= clkcount + 5'b1;
			enviarPaquete <= 1'b0;
		end
	end

	always @(posedge clkBaud) begin
		if(!enviarPaquete) aux <= 1'b0;

		if(enviarPaquete && !aux) begin
			finPaquete <= 1'b0;
			aux <= ~aux;
		end

		if(!finPaquete) begin
			init <= (enviarByte == 4'd15) ? 1'b1 : 1'b0;
			if(init)begin
				case (posPaquete)
					4'b0000: datotx <= 8'b00110011; 													// Marca el inicio del paquete de bytes
					4'b0001: datotx <= (MODluz) ? 8'b10110001 : 8'b00110000;
					4'b0010: datotx <= (MODbomba) ? 8'b10110001 : 8'b00110000;
					4'b0011: datotx <= (MODelectrov) ? 8'b10110001 : 8'b00110000;
					4'b0100: datotx <= (highLevel) ? 8'b10110001 : 8'b00110000;
					4'b0101: datotx <= (lowLevel) ? 8'b10110001 : 8'b00110000;
					4'b0110: datotx <= (activarB) ? 8'b10110001 : 8'b00110000;
					4'b0111: datotx <= (prenderB) ? 8'b10110001 : 8'b00110000;
					4'b1000: datotx <= (activarEV) ? 8'b10110001 : 8'b00110000; 
					4'b1001: begin 
							datotx <= (regar) ? 8'b10110001 : 8'b00110000;
							finPaquete <= 1'b1;
						 end
					default: ;
				endcase 
				posPaquete <= (posPaquete < 4'd9) ? posPaquete + 4'd1 : 4'd0;
			end
			enviarByte <= (enviarByte < 4'd15) ? enviarByte + 4'd1 : 4'd0;
		end
	end

endmodule
