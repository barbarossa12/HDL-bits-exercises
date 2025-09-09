// https://hdlbits.01xz.net/wiki/Adder3
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    wire s0;
    wire s1;
    wire s2;

    full_adder A0(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(s0));
    full_adder A1(.a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(s1));
    full_adder A2(.a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(s2));
    
    assign sum = {s2, s1, s0};

endmodule


module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
endmodule

