module alarmaSCOM(clk, regar, MODbomba, lowLevel, highLevel, melodySCOM);		// Sweet Child O' Mine - Guns N' Roses
	input wire clk;
	input wire regar;		// Indica si se debe regar la planta
	input wire MODbomba;		// Indica si el módulo de la bomba está conectado
	input wire lowLevel;		// Nivel de agua del tanque alto (5 %)
	input wire highLevel;		// Nivel de agua del tanque alto (90 %)
	output reg melodySCOM;		// Canción a reproducir en el parlante
	
	reg [19:0] do;
	reg [19:0] do1;
	reg [19:0] re;
	reg [19:0] re1;
	reg [19:0] fa;
	reg [19:0] fa1;
	reg [19:0] fa2;
	reg [19:0] sol;
	reg [63:0] tiempo;

	initial begin
		tiempo = 64'b0;
		do = 20'b0;
		do1 = 20'b0;
		re = 20'b0;
		re1 = 20'b0;
		fa = 20'b0;
		fa1 = 20'b0;
		fa2 = 20'b0;
		sol = 20'b0;
	end

	always @(posedge clk) begin
		
		
		if(regar && !MODbomba || (!highLevel && !lowLevel && MODbomba)) begin
		
		
			if(tiempo <= 64'd12_000_000) begin
				if(do < 20'd90_193) begin
					do <= do + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd24_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end else if(tiempo <= 64'd36_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd48_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd60_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd72_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd84_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd96_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd108_000_000) begin
				if(do < 20'd90_193) begin
					do <= do + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd120_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end else if(tiempo <= 64'd132_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd144_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd156_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd168_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd180_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd192_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd204_000_000) begin
				if(re < 20'd80_353) begin
					re <= re + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					re <= 20'd0;
				end
			end else if(tiempo <= 64'd216_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end else if(tiempo <= 64'd228_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd240_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd252_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd264_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd276_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd288_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd300_000_000) begin
				if(re < 20'd80_353) begin
					re <= re + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					re <= 20'd0;
				end
			end else if(tiempo <= 64'd312_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end else if(tiempo <= 64'd324_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd336_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd348_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd360_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd372_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd384_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd396_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd408_000_000) begin
				if(fa1 < 20'd45_097) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd420_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd432_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd444_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd456_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd468_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd480_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd492_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd504_000_000) begin
				if(fa1 < 20'd45_097) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd516_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd528_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd540_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd552_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd564_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd576_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd588_000_000) begin
				if(do < 20'd90_193) begin
					do <= do + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd600_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end else if(tiempo <= 64'd612_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd624_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd636_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd648_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd660_000_000) begin
				if(fa2 < 20'd35_793) begin
					fa2 <= fa2 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa2 <= 20'd0;
				end
			end else if(tiempo <= 64'd672_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end
			
			
			else if(tiempo <= 64'd684_000_000) begin
				if(do < 20'd90_193) begin
					do <= do + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do <= 20'd0;
				end
			end else if(tiempo <= 64'd696_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end else if(tiempo <= 64'd708_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd720_000_000) begin
				if(fa < 20'd67_569) begin
					fa <= fa + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa <= 20'd0;
				end
			end else if(tiempo <= 64'd732_000_000) begin
				if(fa1 < 20'd33_784) begin
					fa1 <= fa1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					fa1 <= 20'd0;
				end
			end else if(tiempo <= 64'd744_000_000) begin
				if(sol < 20'd60_197) begin
					sol <= sol + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					sol <= 20'd0;
				end
			end else if(tiempo <= 64'd758_000_000) begin
				if(do1 < 20'd45_097) begin
					do1 <= do1 + 20'd1;
				end else begin
					melodySCOM <= !melodySCOM;
					do1 <= 20'd0;
				end
			end
			
			tiempo <= tiempo + 64'd1;

			
			if(tiempo > 64'd2_270_000_000) tiempo <= 64'd0;			 // Reinicio de la canción después de 30 seg
		
		
		end else begin
			tiempo <= 64'd0;
			do <= 20'b0;
			do1 <= 20'b0;
			re <= 20'b0;
			re1 <= 20'b0;
			fa <= 20'b0;
			fa1 <= 20'b0;
			fa2 <= 20'b0;
			sol <= 20'b0;
		end
		
		
	end
	
endmodule
