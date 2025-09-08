// HDL bits Popcount255
// https://hdlbits.01xz.net/wiki/Popcount255
module top_module( 
    input [254:0] in,
    output reg [7:0] out );
    integer i; 
    always@(*) begin
        out = 8'b0;
        for(i = 0; i < 255; i++) begin
            out += in[i];
        end
    end
endmodule

