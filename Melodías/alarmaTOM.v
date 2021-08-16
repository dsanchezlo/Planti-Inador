module alarmaTOM(clk, regar, MODbomba, lowLevel, highLevel, melodyTOM);				// Take On Me - a-ha
	input wire clk;
	input wire regar;		// Indica si se debe regar la planta
	input wire MODbomba;		// Indica si el módulo de la bomba está conectado
	input wire lowLevel;		// Nivel de agua del tanque alto (5 %)
	input wire highLevel;		// Nivel de agua del tanque alto (90 %)
	output reg melodyTOM;		// Canción a reproducir en el parlante
	
	reg [19:0] re;
	reg [19:0] mi;
	reg [19:0] fa;
	reg [19:0] sol;
	reg [19:0] la;
	reg [19:0] si;
	reg [63:0] tiempo;
	reg repetir;			// Para repetir la melodía 2 veces

	initial begin
		tiempo = 64'b0;
		re = 20'b0;
		mi = 20'b0;
		fa = 20'b0;
		sol = 20'b0;
		la = 20'b0;
		si = 20'b0;
		repetir = 1'b0;
	end

	always @(posedge clk) begin
		
		
		if(regar && !MODbomba || (!highLevel && !lowLevel && MODbomba)) begin
		
			if(tiempo <= 64'd10_000_000) begin
				if(fa < 20'd33_784) begin
					fa <= fa + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd11_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd21_000_000) begin
				if(fa < 20'd33_784) begin
					fa <= fa + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd22_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd32_000_000) begin
				if(re < 20'd42_566) begin
					re <= re + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					re <= 20'd0;
				end
			end else if(tiempo <= 64'd52_000_000) begin
				if(si < 20'd50_619) begin
					si <= si + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd54_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd74_000_000) begin
				if(si < 20'd50_619) begin
					si <= si + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd76_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd96_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd98_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd118_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end
			
			else if(tiempo <= 64'd120_000_000) begin
					melodyTOM <= 1'd0;
			end
			
			else if(tiempo <= 64'd130_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd140_000_000) begin
				if(sol < 20'd30_098) begin
					sol <= sol + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd141_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd151_000_000) begin
				if(sol < 20'd30_098) begin
					sol <= sol + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd161_000_000) begin
				if(la < 20'd28_409) begin
					la <= la + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					la <= 20'd0;
				end
			end else if(tiempo <= 64'd171_000_000) begin
				if(si < 20'd25_309) begin
					si <= si + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					si <= 20'd0;
				end
			end else if(tiempo <= 64'd181_000_000) begin
				if(la < 20'd28_409) begin
					la <= la + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					la <= 20'd0;
				end
			end else if(tiempo <= 64'd182_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd192_000_000) begin
				if(la < 20'd28_409) begin
					la <= la + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					la <= 20'd0;
				end
			end else if(tiempo <= 64'd193_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd203_000_000) begin
				if(la < 20'd28_409) begin
					la <= la + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					la <= 20'd0;
				end
			end else if(tiempo <= 64'd219_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd224_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd244_000_000) begin
				if(re < 20'd42_566) begin
					re <= re + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					re <= 20'd0;
				end
			end else if(tiempo <= 64'd247_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd263_000_000) begin
				if(fa < 20'd33_784) begin
					fa <= fa + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd268_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd284_000_000) begin
				if(fa < 20'd33_784) begin
					fa <= fa + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					fa <= 20'd0;
				end
			end
			
			else if(tiempo <= 64'd289_000_000) begin
					melodyTOM <= 1'd0;
			end
			
			else if(tiempo <= 64'd299_000_000) begin
				if(fa < 20'd33_784) begin
					fa <= fa + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd309_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd310_000_000) begin
					melodyTOM <= 1'd0;
			end else if(tiempo <= 64'd320_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end else if(tiempo <= 64'd330_000_000) begin
				if(fa < 20'd33_784) begin
					fa <= fa + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd340_000_000) begin
				if(mi < 20'd37_923) begin
					mi <= mi + 20'd1;
				end else begin
					melodyTOM <= !melodyTOM;
					mi <= 20'd0;
				end
			end
			
			tiempo <= tiempo + 64'd1;

			if(tiempo > 64'd342_000_000 && repetir == 1'b0) begin
				tiempo <= 64'd0;						// Reinicio de la canción
				repetir <= repetir + 1'b1;
			end else if(tiempo > 64'd1_842_000_000) begin
				tiempo <= 64'd0;						// Reinicio de la canción después de 30 seg
				repetir <= 1'b0;
			end
		end else begin
			tiempo <= 64'b0;
			re <= 20'b0;
			mi <= 20'b0;
			fa <= 20'b0;
			sol <= 20'b0;
			la <= 20'b0;
			si <= 20'b0;
			repetir <= 1'b0;
		end
		
	end
	
endmodule
