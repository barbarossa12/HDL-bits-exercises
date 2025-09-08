/*
* HDL bits module addsub
* https://hdlbits.01xz.net/wiki/Module_addsub
*/

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cin0;
    wire cin1;
    wire cout0;
    wire cout1;
    wire [31:0]xor_out;
    wire [15:0]sum0;
    wire [15:0]sum1;


    assign xor_out = b ^ {32{sub}};

    add16 adder0( .a(a[15:0]), .b(xor_out[15:0]), .cin(sub), .sum(sum0[15:0]), .cout(cout0) );
    add16 adder1( .a(a[31:16]), .b(xor_out[31:16]), .cin(cout0), .sum(sum1[15:0]), .cout(cout1) );
    
    assign sum = {sum1, sum0};

endmodule
