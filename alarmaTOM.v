module alarmaTOM(regar, clk, melody);	// Take On Me - A-ha
	input wire clk;
	input wire regar;
	output reg melody;
	
	reg [19:0] re;
	reg [19:0] mi;
	reg [19:0] fa;
	reg [19:0] sol;
	reg [19:0] la;
	reg [19:0] si;

	reg [51:0]tiempo;
	reg i;
	reg j;

	initial begin
		tiempo = 'b0;
		re = 'b0;
		mi = 'b0;
		fa = 'b0;
		sol = 'b0;
		la = 'b0;
		si = 'b0;
		i = 'b0;
		j = 'b0;
	end

	always @(posedge clk)begin
		
		
		if(regar)begin
		
		
		if(tiempo <= 10_000_000)begin
			if(fa < 'd33_784)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 11_000_000)begin
				melody <= 0;
		end else if(tiempo <= 21_000_000)begin
			if(fa < 'd33_784)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 22_000_000)begin
				melody <= 0;
		end else if(tiempo <= 32_000_000)begin
			if(re < 'd42_566)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end else if(tiempo <= 52_000_000)begin
			if(si < 'd50_619)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 54_000_000)begin
				melody <= 0;
		end else if(tiempo <= 74_000_000)begin
			if(si < 'd50_619)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 76_000_000)begin
				melody <= 0;
		end else if(tiempo <= 96_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 98_000_000)begin
				melody <= 0;
		end else if(tiempo <= 118_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end
		
		else if(tiempo <= 120_000_000)begin
				melody <= 0;
		end
		
		else if(tiempo <= 130_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 140_000_000)begin
			if(sol < 'd30_098)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 141_000_000)begin
				melody <= 0;
		end else if(tiempo <= 151_000_000)begin
			if(sol < 'd30_098)begin
				sol <= sol + 'd1;
			end else begin
				melody <= !melody;
				sol <= 'd0;
			end
		end else if(tiempo <= 161_000_000)begin
			if(la < 'd28_409)begin
				la <= la + 'd1;
			end else begin
				melody <= !melody;
				la <= 'd0;
			end
		end else if(tiempo <= 171_000_000)begin
			if(si < 'd25_309)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 181_000_000)begin
			if(la < 'd28_409)begin
				la <= la + 'd1;
			end else begin
				melody <= !melody;
				la <= 'd0;
			end
		end else if(tiempo <= 182_000_000)begin
				melody <= 0;
		end else if(tiempo <= 192_000_000)begin
			if(la < 'd28_409)begin
				la <= la + 'd1;
			end else begin
				melody <= !melody;
				la <= 'd0;
			end
		end else if(tiempo <= 193_000_000)begin
				melody <= 0;
		end else if(tiempo <= 203_000_000)begin
			if(la < 'd28_409)begin
				la <= la + 'd1;
			end else begin
				melody <= !melody;
				la <= 'd0;
			end
		end else if(tiempo <= 219_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 224_000_000)begin
				melody <= 0;
		end else if(tiempo <= 244_000_000)begin
			if(re < 'd42_566)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end else if(tiempo <= 247_000_000)begin
				melody <= 0;
		end else if(tiempo <= 263_000_000)begin
			if(fa < 'd33_784)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 268_000_000)begin
				melody <= 0;
		end else if(tiempo <= 284_000_000)begin
			if(fa < 'd33_784)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end
		
		else if(tiempo <= 289_000_000)begin
				melody <= 0;
		end
		
		else if(tiempo <= 299_000_000)begin
			if(fa < 'd33_784)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 309_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 310_000_000)begin
				melody <= 0;
		end else if(tiempo <= 320_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 330_000_000)begin
			if(fa < 'd33_784)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 340_000_000)begin
			if(mi < 'd37_923)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end

		
		else begin
			tiempo <= 'b0;
		end
		
		tiempo <= tiempo + 'b1;

		if(tiempo > 342_000_000) tiempo <= 'b0;
		
		end
		
		
	end
	
endmodule