module div1Hz(clk, clk1Hz);
	input clk;
	output reg clk1Hz;

	reg [24:0] count;

	initial begin
		count = 25'd0;
		clk1Hz = 1'd0;
	end

	always @(posedge clk) begin
		if(count < 25'd25_000_000) begin
			count <= count + 25'd1;
		end else begin
			clk1Hz <= !clk1Hz;
			count <= 25'd0;
		end
	end


endmodule