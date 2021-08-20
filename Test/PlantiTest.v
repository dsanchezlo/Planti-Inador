`timescale 1ns / 1ns


module PlantiTest;

	// Inputs
	reg clk;
	reg rx;
	reg MODbomba;
	reg MODelectrov;
	reg MODluz;
	reg lowLevel;
	reg highLevel;

	// Outputs
	wire activarB;
	wire prenderB;
	wire activarEV;
	wire tx;
	wire melody;
	wire [0:6] Sseg;
	wire [7:0] anodos;

	// Instantiate the Unit Under Test (UUT)
	Principal uut ( .clk(clk), 
			.rx(rx), 
			.MODbomba(MODbomba),
			.MODelectrov(MODelectrov), 
			.MODluz(MODluz), 
			.lowLevel(lowLevel),
			.highLevel(highLevel),
			.activarB(activarB), 
			.prenderB(prenderB),
			.activarEV(activarEV),
			.tx(tx),
			.melody(melody), 
			.Sseg(Sseg), 
			.anodos(anodos)
	);

	reg aux;	//Variable auxiliar para cambiar los minutos

	initial begin
		// Initialize Inputs
		clk= 0;
		rx = 1;
		MODbomba = 1;
		MODelectrov = 1;
		MODluz = 1;
		lowLevel = 0;
		highLevel = 0;

		aux=0;
      	end


//Este always crea el relog de 50MHz simulando el que usa la FPGA
	always begin 
		#10;
		clk = ~clk;
	end

//Con este always se prueban los 3 casos posibles en los que pueden estar lowLevel y highLevel
	always begin
		lowLevel = 0;
		highLevel = 0;
		#20000;
		lowLevel = 1;
		#20000;
		highLevel = 1;
		#20000;
		highLevel = 0;
		#20000;
	end

//En este always se prueba el funcionamiento del RX
//Se reciben 15 dígitos en el rx
//Se reciben 2 datos corruptos para probar el funcionamiento del bit de paridad par

	always begin
		//                              3         1          1          1         2        2       5
		//Se deben enviar 15 dígitos (humedad / melodía / maceta / tipoplanta / horas / minutos / lux)
		#20000
//////////////////Enviar 0 (centenas humedad)
		rx = 0;	//Bit de start
		#8681
		rx = 0;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato7
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato
		
		#8681
		rx = 0; //Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 6 (Decenas humedad) 
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 0;	//Bit 0 dato
		#8681
		rx = 1;	//Bit 1 dato
		#8681
		rx = 1;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 1;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 5 (Unidades humedad)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 1;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop



//////////////////Enviar 3 (melodía)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 1;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

	

//////////////////Enviar 1 maceta)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 1;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop



//////////////////Enviar 3 (tipoplanta)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 1;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 1;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop



//////////////////Enviar 1 (Decenas hora)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 1;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 0 (Unidades hora)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 0;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 3 (Decenas minutos)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 1;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////En cada paquete de datos, el digito enviado en esta posición cambia
		aux = ~aux;
		if(aux)begin

			//Enviar 2 (Unidades minutos)
			#8681
			rx = 0;	//Bit de start

			#8681
			rx = 0;	//Bit 0 dato
			#8681
			rx = 1;	//Bit 1 dato
			#8681
			rx = 0;	//Bit 2 dato
			#8681
			rx = 0;	//Bit 3 dato
			#8681
			rx = 1;	//Bit 4 dato
			#8681
			rx = 1;	//Bit 5 dato
			#8681
			rx = 0;	//Bit 6 dato

			#8681
			rx = 1;	//Bit paridad par

			#8681
			rx = 1;	//Bit de stop
		end else begin
			//Enviar 3 (Unidades minutos)
			#8681
			rx = 0;	//Bit de start

			#8681
			rx = 1;	//Bit 0 dato
			#8681
			rx = 1;	//Bit 1 dato
			#8681
			rx = 0;	//Bit 2 dato
			#8681
			rx = 0;	//Bit 3 dato
			#8681
			rx = 1;	//Bit 4 dato
			#8681
			rx = 1;	//Bit 5 dato
			#8681
			rx = 0;	//Bit 6 dato

			#8681
			rx = 0;	//Bit paridad par

			#8681
			rx = 1;	//Bit de stop
		end


//////////////////Enviar 1 (dígito 4 lux)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 1;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 0 (dígito 3 lux)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 0;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 4 (dígito 2 lux)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 0;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 1;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 1;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 9 (dígito 1 lux)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 1;	//Bit 0 dato
		#8681
		rx = 0;	//Bit 1 dato
		#8681
		rx = 0;	//Bit 2 dato
		#8681
		rx = 1;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop

//////////////////Enviar 6 (dígito 0 lux)
		#8681
		rx = 0;	//Bit de start

		#8681
		rx = 0;	//Bit 0 dato
		#8681
		rx = 1;	//Bit 1 dato
		#8681
		rx = 1;	//Bit 2 dato
		#8681
		rx = 0;	//Bit 3 dato
		#8681
		rx = 1;	//Bit 4 dato
		#8681
		rx = 1;	//Bit 5 dato
		#8681
		rx = 0;	//Bit 6 dato

		#8681
		rx = 0;	//Bit paridad par

		#8681
		rx = 1;	//Bit de stop



		#868056
		rx = 1;
	end

endmodule