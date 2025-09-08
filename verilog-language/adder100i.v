// HDL bits adder100i
// https://hdlbits.01xz.net/wiki/Adder100i
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    wire [100:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i++) begin : adder100i
            assign sum[i] = a[i] ^ b[i] ^ c[i];
            assign c[i+1] = (a[i] & b[i]) | (c[i] & (a[i] ^ b[i]));
            assign cout[i] = c[i+1];
        end
    endgenerate
endmodule

