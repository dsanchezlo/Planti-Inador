module alarmaN(clk, regar, MODbomba, lowLevel, highLevel, melodyN);					// Negro - J Balvin
	input wire clk;
	input wire regar;				// Indica si se debe regar la planta
	input wire MODbomba;			// Indica si el módulo de la bomba está conectado
	input wire lowLevel;			// Nivel de agua del tanque alto (5 %)
	input wire highLevel;		// Nivel de agua del tanque alto (90 %)
	output reg melodyN;			// Canción a reproducir en el parlante
	
	reg [19:0] do;
	reg [19:0] re;
	reg [19:0] mi;
	reg [19:0] fa;
	reg [19:0] si;
	reg [63:0] tiempo;

	initial begin
		tiempo = 64'd0;
		do = 20'd0;
		re = 20'd0;
		mi = 20'd0;
		fa = 20'd0;
		si = 20'd0;
	end

	always @(posedge clk) begin
		
		
		if(regar && !MODbomba || (!highLevel && !lowLevel && MODbomba)) begin
		
		
			if(tiempo <= 64'd35_000_000) begin
				if(mi < 20'd37_922) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd55_000_000) begin
				if(si < 20'd50_619) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd75_000_000) begin
				if(do < 20'd47_778) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd110_000_000) begin
				if(fa < 20'd35_793) begin
					fa <= fa + 20'd1;
				end else begin
					melodyN <= !melodyN;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd145_000_000) begin
				if(re < 20'd42_566) begin
					re <= re + 20'd1;
				end else begin
					melodyN <= !melodyN;
					re <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd180_000_000) begin
				if(mi < 20'd37_922) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd200_000_000) begin
				if(si < 20'd50_619) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd220_000_000) begin
				if(do < 20'd47_778) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd255_000_000) begin
				if(fa < 20'd35_793) begin
					fa <= fa + 20'd1;
				end else begin
					melodyN <= !melodyN;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd290_000_000) begin
				if(re < 20'd42_566) begin
					re <= re + 20'd1;
				end else begin
					melodyN <= !melodyN;
					re <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd325_000_000) begin
				if(mi < 20'd37_922) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd345_000_000) begin
				if(si < 20'd50_619) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd365_000_000) begin
				if(do < 20'd47_778) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd400_000_000) begin
				if(fa < 20'd35_793) begin
					fa <= fa + 20'd1;
				end else begin
					melodyN <= !melodyN;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd435_000_000) begin
				if(re < 20'd42_566) begin
					re <= re + 20'd1;
				end else begin
					melodyN <= !melodyN;
					re <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd470_000_000) begin
				if(mi < 20'd37_922) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd490_000_000) begin
				if(si < 20'd50_619) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd510_000_000) begin
				if(do < 20'd47_778) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end

			
			else if(tiempo <= 64'd580_000_000) begin
					melodyN <= 1'd0;
			end
			
			
			else if(tiempo <= 64'd615_000_000) begin
				if(mi < 20'd75_843) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd635_000_000) begin
				if(si < 20'd101_238) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd655_000_000) begin
				if(do < 20'd95_556) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd690_000_000) begin
				if(fa < 20'd71_587) begin
					fa <= fa + 20'd1;
				end else begin
					melodyN <= !melodyN;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd725_000_000) begin
				if(re < 20'd85_131) begin
					re <= re + 20'd1;
				end else begin
					melodyN <= !melodyN;
					re <= 20'd0;
				end
			end
			

			else if(tiempo <= 64'd760_000_000) begin
				if(mi < 20'd75_843) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd780_000_000) begin
				if(si < 20'd101_238) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd800_000_000) begin
				if(do < 20'd95_556) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd835_000_000) begin
				if(fa < 20'd71_587) begin
					fa <= fa + 20'd1;
				end else begin
					melodyN <= !melodyN;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd870_000_000) begin
				if(re < 20'd85_131) begin
					re <= re + 20'd1;
				end else begin
					melodyN <= !melodyN;
					re <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd905_000_000) begin
				if(mi < 20'd75_843) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd925_000_000) begin
				if(si < 20'd101_238) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd945_000_000) begin
				if(do < 20'd95_556) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd980_000_000) begin
				if(fa < 20'd71_587) begin
					fa <= fa + 20'd1;
				end else begin
					melodyN <= !melodyN;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd1_015_000_000) begin
				if(re < 20'd85_131) begin
					re <= re + 20'd1;
				end else begin
					melodyN <= !melodyN;
					re <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd1_050_000_000) begin
				if(mi < 20'd75_843) begin
					mi <= mi + 20'd1;
				end else begin
					melodyN <= !melodyN;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd1_070_000_000) begin
				if(si < 20'd101_238) begin
					si <= si + 20'd1;
				end else begin
					melodyN <= !melodyN;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd1_090_000_000) begin
				if(do < 20'd95_556) begin
					do <= do + 20'd1;
				end else begin
					melodyN <= !melodyN;
					do <= 20'd0;
				end
			end
			
			tiempo <= tiempo + 64'd1;

			
			if(tiempo > 64'd2_660_000_000) tiempo <= 64'd0;		// Reinicio de la canción después de 30 seg
		
		end else begin
			tiempo <= 64'b0;
			do <= 20'b0;
			re <= 20'b0;
			mi <= 20'b0;
			fa <= 20'b0;
			si <= 20'b0;
		end
		
	end
	
endmodule
