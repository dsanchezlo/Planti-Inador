module divfreq(clk, clk1kHz);
input clk;
output reg clk1kHz;

reg [20:0]count;

initial begin
	count = 0;
	clk1kHz = 0;
end

always @(posedge clk)begin
	if(count < 25_000)begin
		count = count + 1'd1;
	end else begin
		clk1kHz = !clk1kHz;
		count = 0;
	end
end


endmodule