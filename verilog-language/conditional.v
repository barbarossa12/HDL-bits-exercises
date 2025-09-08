/*
* HDL bits Conditional
* https://hdlbits.01xz.net/wiki/Conditional
*/
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    
    wire [7:0]min_ab;
    wire [7:0]min_cd;

    always@(*)begin
        min_ab = a < b ? a : b;
        min_cd = c < d ? c : d;
        min = min_ab < min_cd ? min_ab : min_cd;
    end

endmodule
