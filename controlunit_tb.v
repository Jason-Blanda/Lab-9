`timescale 1ns / 1ps

module controlunit_tb();

reg clk;
reg reset;

wire C0;
wire alu_m;
wire RW;
wire [3:0] ALU_op;
wire MRW;
wire WB;
wire PCsrc;
wire [1:0] imm_sel;

controlunit dut (
	.reset (reset),
	.clock (clk),  
	.C0 (C0), 
	.alu_m (alu_m), 
	.RW (RW), 
	.ALU_op (ALU_op), 
	.MRW (MRW), 
	.WB (WB), 
	.PCsrc (PCsrc), 
	.imm_sel (imm_sel)
);

initial begin
	clk = 1'b0;
	forever #1 clk = ~clk;
end

initial begin 
	reset = 1'b1;
	#10
	reset = 1'b0;
end

endmodule
