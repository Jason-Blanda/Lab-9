module controlunit (reset, clock, C0, alu_m, RW, ALU_op, MRW, WB, PCsrc, imm_sel);

input reset, clock;

output reg C0;
output reg alu_m;
output reg RW;
output reg [3:0] ALU_op;
output reg MRW;
output reg WB;
output reg PCsrc;
output reg [1:0] imm_sel;

reg [31:0] inst; //this is from the ROM file. code won't work without it so make sure that's on hand
reg [3:0] status_flag;

always @(inst or reset)
if (reset == 0)
case (inst [6:0])
	7'b0110011: begin
	C0 = 1'b0;
		alu_m = 1'b0;
		RW = 1'b1;
		MRW = 1'b1;
		WB = 1'b1;
		PCsrc = 1'b0;
		imm_sel = 2'b00;
		ALU_op = {inst[30],inst[14:12]};
		
		end
		
		7'b0010011: begin
		C0 = 1'b0;
		alu_m = 1'b1;
		RW = 1'b1;
		MRW = 1'b1;
		WB = 1'b1;
		PCsrc = 1'b0;
		imm_sel = 2'b01;
		ALU_op = {inst[30], inst[14:12]};
		
		end
		
		7'b0000011: begin
		C0 = 1'b0;
		alu_m = 1'b1;
		RW = 1'b1;
		MRW = 1'b1;
		WB = 1'b0;
		PCsrc = 1'b0;
		ALU_op = 4'b00000;
		imm_sel = 2'b01;
		
		end
		
		7'b010001: begin
		C0 = 1'b0;
		alu_m = 1'b1;
		RW = 1'b1;
		MRW = 1'b1;
		WB = 1'b1;
		PCsrc = 1'b0;
		ALU_op = 4'b0000;
		imm_sel = 2'b01;
		
		
		end
		
		7'b1100011: begin
		C0 = 1'b0;
		alu_m = 1'b1;
		RW = 1'b1;
		MRW = 1'b1;
		WB = 1'b1;
		imm_sel = 2'b01;
		
		case(inst[14:12])
		3'b000: begin
		PCsrc = status_flag[0]? 1'b1: 1'b0;
		end
		
		3'b100: begin
		PCsrc = status_flag[1]? 1'b1:1'b0;
		end
		endcase
		
		ALU_op = 4'b0000;
		
		end
		
	endcase
else
C0 = 1'b0;

endmodule
