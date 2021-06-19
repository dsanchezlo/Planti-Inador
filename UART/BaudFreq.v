//Reloj para 115200 Baudios
//clk50M / (2*clkBaud) = #pulsosclk50M

module BaudFreq(clk, clkBaud);
	input wire clk;
	output reg clkBaud;
	
	reg [20:0]count;

	initial begin
		count = 'd0;
		clkBaud = 'd0;
	end

	always @(posedge clk)begin
		if(count < 'd217)begin
			count <= count + 'd1;
		end else begin
			clkBaud <= !clkBaud;
			count <= 'd0;
		end
	end

endmodule 