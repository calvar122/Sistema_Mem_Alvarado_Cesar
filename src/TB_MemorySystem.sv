//MemorySystem	TB
`ifndef TB_MEMORYSYSTEM_SV
	`define  TB_MEMORYSYSTEM_SV
module TB_MemorySystem;
import my_pkg::*;
	bit TB_clk;
	bit TB_Write_enable;
	logic [(DATA_WIDTH-1):0] TB_addr;
	logic [(DATA_WIDTH-1):0] TB_q;
	logic [(DATA_WIDTH-1):0] TB_Write_Data;

	
	
	MemoryUnit
	DUV(
		.WE_i(TB_Write_enable),
		.WD_i(TB_Write_Data),
		.clk(TB_clk),
		.ADDR_i(TB_addr),
		.RD_o(TB_q)
		);

		
	initial begin
	forever #1 TB_clk = ~TB_clk;
	end	
		
initial begin

	//ESCRIBIENDO DATOS EN RAM
	#1 TB_Write_enable = 1;
	#1 TB_addr =  32'h10010000;
	#0 TB_Write_Data <= 32'hFFFF_FFFF;

	//#50 TB_Write_Data <= 32'h0000_0000;
	//#1 TB_addr = 32'h10010004;
	

	#50 TB_addr = 32'h10010008;
	#1 TB_Write_Data <= 32'h12345678;

	#50 TB_addr = 32'h1001000c;
	#1 TB_Write_Data <= 32'h98761234;

	#50 TB_addr = 32'h10010010;
	#1 TB_Write_Data <= 32'hA0A0A0A0;

	#50 TB_addr = 32'h10010014;
	#1 TB_Write_Data <= 32'hABCDEF12;
	
	//#50 TB_addr = 32'h10010018;
	//#1 TB_Write_Data <= 32'h6;
	
	//#50 TB_addr = 32'h1001001C;
	//#1 TB_Write_Data <= 32'h7;
	
	//DESACTIVANDO ESCRITURA RAM 
	#50 TB_Write_enable = 0;
	
	//CONSULTANDO ROM
	#50 TB_addr <= 32'h400000;
	#50 TB_addr <= 32'h400004; //address 01
	#50 TB_addr <= 32'b0000_0000_0100_0000_0000_0000_0000_1000;
	#50 TB_addr <= 32'h40000c;
	#50 TB_addr <= 32'h400010;
	#50 TB_addr <= 32'h400014;
	#50 TB_addr <= 32'h400018;
	#50 TB_addr <= 32'h40001c;
	#50 TB_addr <= 32'h400020; //direccion sin datos escritos
	#50 TB_addr <= 32'h400024; //direccion sin datos escritos
	
	//consultando RAM
	#50 TB_addr <= 32'h10010008;
	#50 TB_addr <= 32'h10010014;
	#50 TB_addr <= 32'h10010018; //direccion sin datos escritos
	
	
	//Tratando de escribir en RAM pero con enable desactivado
	#50 TB_addr = 32'h10010008;
	#1 TB_Write_Data <= 32'hFFFF_ffff;
	
	//sobre-escribiendo en RAM
	#50 TB_Write_enable = 1;		//Habilitando escritura
	#1 TB_addr = 32'h10010008;
	#1 TB_Write_Data <= 32'hA0A0A0A0;
	
	
end		
		
endmodule
`endif