// HDL bits vector100r
// https://hdlbits.01xz.net/wiki/Vector100r
module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always@(*) begin
    for(i = 0; i < 100; i++)
        out[i] = in[100-i];
    end

endmodule
