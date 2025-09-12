// https://hdlbits.01xz.net/wiki/Exams/m2014_q4j
module top_module( 
    input [3:0] x, y,
    output [4:0] sum );
    
    wire c0;
    wire c1;
    wire c2;
    wire c3;

    assign c0 = 1'b0;


    full_adder A0(.a(x[0]), .b(y[0]), .cin(c0), .cout(c1), .sum(sum[0]));
    full_adder A1(.a(x[1]), .b(y[1]), .cin(c1), .cout(c2), .sum(sum[1]));
    full_adder A2(.a(x[2]), .b(y[2]), .cin(c2), .cout(c3), .sum(sum[2]));
    full_adder A3(.a(x[3]), .b(y[3]), .cin(c3), .cout(sum[4]), .sum(sum[3]));
    

endmodule


module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
endmodule

