//		Reloj para 115200 Baudios
//		clk50M / (2*clkBaud) = #pulsosclk50M

module BaudFreq(clk, clkBaud);
	input wire clk;
	output reg clkBaud;
	
	reg [20:0] count;

	initial begin
		count = 21'd0;
		clkBaud = 1'd0;
	end

	always @(posedge clk) begin
		if(count < 21'd217) begin
			count <= count + 21'd1;
		end else begin
			clkBaud <= !clkBaud;
			count <= 21'd0;
		end
	end

endmodule 