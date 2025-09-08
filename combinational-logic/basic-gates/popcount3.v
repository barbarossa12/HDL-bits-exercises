// https://hdlbits.01xz.net/wiki/Popcount3
module top_module( 
    input [2:0] in,
    output [1:0] out );

    always@(*) begin
        integer i;
        out = 2'b0;
        for (i = 0; i < 3; i++) begin
            out += in[i];
        end
    end

endmodule
