module alarma(regar, clk, melody);		// Negro -J Balvin
	input wire clk;
	input wire regar;
	output reg melody;
	
	reg [19:0] do;
	reg [19:0] re;
	reg [19:0] mi;
	reg [19:0] fa;
	reg [19:0] si;

	reg [51:0]tiempo;
	reg i;
	reg j;

	initial begin
		tiempo = 'b0;
		do = 'b0;
		re = 'b0;
		mi = 'b0;
		fa = 'b0;
		si = 'b0;
		i = 'b0;
		j = 'b0;
	end

	always @(posedge clk)begin
		
		
		if(regar)begin
		
		
		
		if(tiempo <= 35_000_000)begin
			if(mi < 'd37_922)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 55_000_000)begin
			if(si < 'd50_619)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 75_000_000)begin
			if(do < 'd47_778)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 110_000_000)begin
			if(fa < 'd35_793)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 145_000_000)begin
			if(re < 'd42_566)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end
		
		
		else if(tiempo <= 180_000_000)begin
			if(mi < 'd37_922)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 200_000_000)begin
			if(si < 'd50_619)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 220_000_000)begin
			if(do < 'd47_778)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 255_000_000)begin
			if(fa < 'd35_793)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 290_000_000)begin
			if(re < 'd42_566)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end
		
		
		else if(tiempo <= 325_000_000)begin
			if(mi < 'd37_922)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 345_000_000)begin
			if(si < 'd50_619)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 365_000_000)begin
			if(do < 'd47_778)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 400_000_000)begin
			if(fa < 'd35_793)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 435_000_000)begin
			if(re < 'd42_566)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end
		
		
		else if(tiempo <= 470_000_000)begin
			if(mi < 'd37_922)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 490_000_000)begin
			if(si < 'd50_619)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 510_000_000)begin
			if(do < 'd47_778)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end

		
		else if(tiempo <= 580_000_000)begin
				melody <= 0;
		end
		
		
		else if(tiempo <= 615_000_000)begin
			if(mi < 'd75_843)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 635_000_000)begin
			if(si < 'd101_238)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 655_000_000)begin
			if(do < 'd95_556)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 690_000_000)begin
			if(fa < 'd71_587)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 725_000_000)begin
			if(re < 'd85_131)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end
		

		else if(tiempo <= 760_000_000)begin
			if(mi < 'd75_843)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 780_000_000)begin
			if(si < 'd101_238)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 800_000_000)begin
			if(do < 'd95_556)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 835_000_000)begin
			if(fa < 'd71_587)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 870_000_000)begin
			if(re < 'd85_131)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end
		
		
		else if(tiempo <= 905_000_000)begin
			if(mi < 'd75_843)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 925_000_000)begin
			if(si < 'd101_238)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 945_000_000)begin
			if(do < 'd95_556)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else if(tiempo <= 980_000_000)begin
			if(fa < 'd71_587)begin
				fa <= fa + 'd1;
			end else begin
				melody <= !melody;
				fa <= 'd0;
			end
		end else if(tiempo <= 1_015_000_000)begin
			if(re < 'd85_131)begin
				re <= re + 'd1;
			end else begin
				melody <= !melody;
				re <= 'd0;
			end
		end
		
		
		else if(tiempo <= 1_050_000_000)begin
			if(mi < 'd75_843)begin
				mi <= mi + 'd1;
			end else begin
				melody <= !melody;
				mi <= 'd0;
			end
		end else if(tiempo <= 1_070_000_000)begin
			if(si < 'd101_238)begin
				si <= si + 'd1;
			end else begin
				melody <= !melody;
				si <= 'd0;
			end
		end else if(tiempo <= 1_090_000_000)begin
			if(do < 'd95_556)begin
				do <= do + 'd1;
			end else begin
				melody <= !melody;
				do <= 'd0;
			end
		end else begin
			tiempo <= 'b0;
		end
		
		tiempo <= tiempo + 'b1;

		
		if(tiempo > 1_160_000_000) tiempo <= 'b0;
		
		end
		
	end
	
endmodule