// https://hdlbits.01xz.net/wiki/Kmap3
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = (a & ~d) | (~b & c) | (a & c);

endmodule

