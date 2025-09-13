// https://hdlbits.01xz.net/wiki/Kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = ((~b)& (~c)) | ((~a)&(~d)) | (~a&b&c) | (c&a&d);

endmodule

