
module lab6(out, address);
    output reg [31:0] out;
    input [7:0] address;
    
    always @(address)
    begin
        case (address)
            8'd00: out = 32'h00450693;
            8'd04: out = 32'h00100713;
            8'd08: out = 32'h00b76463;
            8'd12: out = 32'h00008067;
            
            8'd16: out = 32'h0006a803;
            8'd20: out = 32'h00068613;
            8'd24: out = 32'h00070793;
            8'd28: out = 32'hffc62883;
            
            8'd32: out = 32'h01185a63;
            8'd36: out = 32'h01162023;
            8'd40: out = 32'hfff78793;
            8'd44: out = 32'hffc60613;
            
            8'd48: out = 32'hfe0796e3;
            8'd52: out = 32'h00279793;
            8'd56: out = 32'h00f507b3;
            8'd60: out = 32'h0107a023;
            
            8'd64: out = 32'h00170713;
            8'd68: out = 32'h00468693;
            8'd72: out = 32'hfc1ff06f;
        endcase
    end
endmodule
