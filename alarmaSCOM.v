module alarmaSCOM(regar, clk, melody);	// Sweet Child O' Mine - Guns N' Roses
	input wire clk;
	input wire regar;
	output reg melody;
	
	reg [19:0] do;
	reg [19:0] do1;
	reg [19:0] re;
	reg [19:0] re1;
	reg [19:0] fa;
	reg [19:0] fa1;
	reg [19:0] fa2;
	reg [19:0] sol;

	reg [51:0]tiempo;
	reg i;
	reg j;

	initial begin
		tiempo = 'b0;
		do = 'b0;
		do1 = 'b0;
		re = 'b0;
		re1 = 'b0;
		fa = 'b0;
		fa1 = 'b0;
		fa2 = 'b0;
		sol = 'b0;
		i = 'b0;
		j = 'b0;
	end

	always @(posedge clk)begin
		
		
		if(regar)begin
		
		
		if(tiempo <= 12_000_000)begin
			if(do < 'd90_193)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 24_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end else if(tiempo <= 36_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 48_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 60_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 72_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 84_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 96_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 108_000_000)begin
			if(do < 'd90_193)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 120_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end else if(tiempo <= 132_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 144_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 156_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 168_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 180_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 192_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 204_000_000)begin
			if(re < 'd80_353)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end else if(tiempo <= 216_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end else if(tiempo <= 228_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 240_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 252_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 264_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 276_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 288_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 300_000_000)begin
			if(re < 'd80_353)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end else if(tiempo <= 312_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end else if(tiempo <= 324_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 336_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 348_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 360_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 372_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 384_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 396_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 408_000_000)begin
			if(fa1 < 'd45_097)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 420_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 432_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 444_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 456_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 468_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 480_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 492_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 504_000_000)begin
			if(fa1 < 'd45_097)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 516_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 528_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 540_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 552_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 564_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 576_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 588_000_000)begin
			if(do < 'd90_193)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 600_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end else if(tiempo <= 612_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 624_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 636_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 648_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 660_000_000)begin
			if(fa2 < 'd35_793)begin
				fa2 <= fa2 + 'd1;
			end else begin
				melody <= !melody;
				fa2 <= 'd0;
			end
		end else if(tiempo <= 672_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end
		
		
		else if(tiempo <= 684_000_000)begin
			if(do < 'd90_193)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 696_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end else if(tiempo <= 708_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 720_000_000)begin
			if(fa < 'd67_569)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 732_000_000)begin
			if(fa1 < 'd33_784)begin
				fa1 <= fa1 + 'd1;
			end else begin
				melody <= !melody;
				fa1 <= 'd0;
			end
		end else if(tiempo <= 744_000_000)begin
			if(sol < 'd60_197)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 758_000_000)begin
			if(do1 < 'd45_097)begin
				do1 <= do1 + 'd1;
			end else begin
				melody <= !melody;
				do1 <= 'd0;
			end
		end
		
		
		
		else begin
			tiempo <= 'b0;
		end
		
		tiempo <= tiempo + 'b1;

		
		if(tiempo > 770_000_000) tiempo <= 'b0;
		
		
		end
		
		
	end
	
endmodule