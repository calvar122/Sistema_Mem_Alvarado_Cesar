//ROM
`ifndef ROM_SV
	`define  ROM_SV
module ROM
import my_pkg::*;
(
	input [(DATA_WIDTH-1):0] addr, //32 Input word
	output logic[(DATA_WIDTH-1):0] q //32 bit output
);
	logic [(DATA_WIDTH-1):0]i = 32'h400_000;    //para asignacion de direcciones
	// Declare the ROM variable(my pkg)
	rom myrom; 
					// ADD Bits
					//_____876543210_________
					// #0	 ||||||||| 
					// #1	 |||||||||
					// #............
					// #63 |||||||||
	initial
	begin
		$readmemh("C:/PROJECTS/Architecture/MemorySystem/src/text.dat", myrom);
	end
	
	always@(addr)	q <= myrom[(addr-i)>>2];
	
endmodule
`endif