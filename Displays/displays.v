module displays(clk1kHz, humedad, hora, tipoPlanta, Sseg, anodos);

input wire clk1kHz;
input wire [11:0]humedad;
input wire [15:0] hora;
input wire [3:0] tipoPlanta;
output reg [6:0]Sseg;
output reg [7:0]anodos;

reg [2:0]contadorbar;

reg [6:0]Sseg0;
reg [6:0]Sseg1;
reg [6:0]Sseg2;
reg [6:0]Sseg3;
reg [6:0]Sseg4;
reg [6:0]Sseg5;
reg [6:0]Sseg6;
reg [6:0]Sseg7;

parameter seg0 = 7'b0000001; //0
parameter seg1 = 7'b1001111; //1
parameter seg2 = 7'b0010010; //2
parameter seg3 = 7'b0000110; //3
parameter seg4 = 7'b1001100; //4
parameter seg5 = 7'b0100100; //5
parameter seg6 = 7'b0100000; //6
parameter seg7 = 7'b0001111; //7
parameter seg8 = 7'b0000000; //8
parameter seg9 = 7'b0000100; //9
parameter nul = 7'b1111111; //

initial begin
	contadorbar = 'b0;
	Sseg0 = nul;
	Sseg1 = nul;
	Sseg2 = nul;
	Sseg3 = nul;
	Sseg4 = nul;
	Sseg5 = nul;
	Sseg6 = nul;
	Sseg7 = nul;
end

always @(posedge clk1kHz) begin
	contadorbar = contadorbar + 1'b1;
		case(contadorbar)
			3'b000: begin anodos <= 8'b11111110; Sseg <= Sseg0; end
			3'b001: begin anodos <= 8'b11111101; Sseg <= Sseg1; end
			3'b010: begin anodos <= 8'b11111011; Sseg <= Sseg2; end
			3'b011: begin anodos <= 8'b11110111; Sseg <= Sseg3; end
			3'b100: begin anodos <= 8'b11101111; Sseg <= Sseg4; end
			3'b101: begin anodos <= 8'b11011111; Sseg <= Sseg5; end
			3'b110: begin anodos <= 8'b10111111; Sseg <= Sseg6; end
			3'b111: begin anodos <= 8'b01111111; Sseg <= Sseg7; end
		endcase
		
			case(humedad[11:8])
					4'b0000: Sseg7 = seg0;
					4'b0001: Sseg7 = seg1;
					4'b0010: Sseg7 = seg2;
					4'b0011: Sseg7 = seg3;
					4'b0100: Sseg7 = seg4;
					4'b0101: Sseg7 = seg5;
					4'b0110: Sseg7 = seg6;
					4'b0111: Sseg7 = seg7;
					4'b1000: Sseg7 = seg8;
					4'b1001: Sseg7 = seg9;
					default: Sseg7 = nul;
			endcase
			case(humedad[7:4])
					4'b0000: Sseg6 = seg0;
					4'b0001: Sseg6 = seg1;
					4'b0010: Sseg6 = seg2;
					4'b0011: Sseg6 = seg3;
					4'b0100: Sseg6 = seg4;
					4'b0101: Sseg6 = seg5;
					4'b0110: Sseg6 = seg6;
					4'b0111: Sseg6 = seg7;
					4'b1000: Sseg6 = seg8;
					4'b1001: Sseg6 = seg9;
					default: Sseg6 = nul;
			endcase
			case(humedad[3:0])
					4'b0000: Sseg5 = seg0;
					4'b0001: Sseg5 = seg1;
					4'b0010: Sseg5 = seg2;
					4'b0011: Sseg5 = seg3;
					4'b0100: Sseg5 = seg4;
					4'b0101: Sseg5 = seg5;
					4'b0110: Sseg5 = seg6;
					4'b0111: Sseg5 = seg7;
					4'b1000: Sseg5 = seg8;
					4'b1001: Sseg5 = seg9;
					default: Sseg5 = nul;
			endcase
			case(hora[15:12])
					4'b0000: Sseg4 = seg0;
					4'b0001: Sseg4 = seg1;
					4'b0010: Sseg4 = seg2;
					4'b0011: Sseg4 = seg3;
					4'b0100: Sseg4 = seg4;
					4'b0101: Sseg4 = seg5;
					4'b0110: Sseg4 = seg6;
					4'b0111: Sseg4 = seg7;
					4'b1000: Sseg4 = seg8;
					4'b1001: Sseg4 = seg9;
					default: Sseg4 = nul;
			endcase
			case(hora[11:8])
					4'b0000: Sseg3 = seg0;
					4'b0001: Sseg3 = seg1;
					4'b0010: Sseg3 = seg2;
					4'b0011: Sseg3 = seg3;
					4'b0100: Sseg3 = seg4;
					4'b0101: Sseg3 = seg5;
					4'b0110: Sseg3 = seg6;
					4'b0111: Sseg3 = seg7;
					4'b1000: Sseg3 = seg8;
					4'b1001: Sseg3 = seg9;
					default: Sseg3 = nul;
			endcase
			case(hora[7:4])
					4'b0000: Sseg2 = seg0;
					4'b0001: Sseg2 = seg1;
					4'b0010: Sseg2 = seg2;
					4'b0011: Sseg2 = seg3;
					4'b0100: Sseg2 = seg4;
					4'b0101: Sseg2 = seg5;
					4'b0110: Sseg2 = seg6;
					4'b0111: Sseg2 = seg7;
					4'b1000: Sseg2 = seg8;
					4'b1001: Sseg2 = seg9;
					default: Sseg2 = nul;
			endcase
			case(hora[3:0])
					4'b0000: Sseg1 = seg0;
					4'b0001: Sseg1 = seg1;
					4'b0010: Sseg1 = seg2;
					4'b0011: Sseg1 = seg3;
					4'b0100: Sseg1 = seg4;
					4'b0101: Sseg1 = seg5;
					4'b0110: Sseg1 = seg6;
					4'b0111: Sseg1 = seg7;
					4'b1000: Sseg1 = seg8;
					4'b1001: Sseg1 = seg9;
					default: Sseg1 = nul;
			endcase
			case(tipoPlanta[3:0])
					4'b0000: Sseg0 = seg0;
					4'b0001: Sseg0 = seg1;
					4'b0010: Sseg0 = seg2;
					4'b0011: Sseg0 = seg3;
					4'b0100: Sseg0 = seg4;
					4'b0101: Sseg0 = seg5;
					4'b0110: Sseg0 = seg6;
					4'b0111: Sseg0 = seg7;
					4'b1000: Sseg0 = seg8;
					4'b1001: Sseg0 = seg9;
					default: Sseg0 = nul;
			endcase
end

endmodule