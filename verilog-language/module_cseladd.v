/*
* HDL bits module cseladd
* https://hdlbits.01xz.net/wiki/Module_cseladd
*/
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	
	wire [15:0]sum0;
	wire [15:0]sum1;
	wire [15:0]sum2;
	wire mux_sel;
	reg [15:0]mux_out;
	wire cin_0;
	wire cin_1;
	wire cin_2;
	wire cout_0;
	wire cout_1;
	wire cout_2;
	
	add16 adder0( .a(a[15:0]),  .b(b[15:0]),  .cin(cin_0), .sum(sum0[15:0]), .cout(mux_sel) );
	add16 adder1( .a(a[31:16]), .b(b[31:16]), .cin(cin_1), .sum(sum1[15:0]), .cout(cout_1) );
	add16 adder2( .a(a[31:16]), .b(b[31:16]), .cin(cin_2), .sum(sum2[15:0]), .cout(cout_2) );
	
	assign cin_0 = 1'b0;
	assign cin_1 = 1'b0;
	assign cin_2 = 1'b1;
	

	always@(*) begin
		case(mux_sel)
			1'b0: mux_out = sum1;
		    1'b1: mux_out = sum2;
		endcase
	end 
	
	assign sum = {mux_out, sum0};

endmodule

