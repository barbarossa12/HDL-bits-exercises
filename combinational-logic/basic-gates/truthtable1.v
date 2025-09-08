// https://hdlbits.01xz.net/wiki/Truthtable1
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    // using sum of products
    assign f = (~x3 & x2 & ~x1) + (~x3 & x2 & x1) + (x3 & ~x2 & x1) + (x1 & x2 & x3);
endmodule
