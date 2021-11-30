//MUX
`ifndef MUX_SV
	`define  MUX_SV
module MUX 
import my_pkg::*;
(
   input [(DATA_WIDTH-1):0] my_rom,
   input [(DATA_WIDTH-1):0] my_ram,
	input bit sel,
	output [(DATA_WIDTH-1):0] out
   
);

assign out = sel ? my_rom : my_ram; 
endmodule 
`endif