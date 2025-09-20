/**
* https://hdlbits.01xz.net/wiki/Edgedetect
*/

module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0] d;

    always@(posedge clk) begin
        d <= in;
        pedge <= in & ~ d;
    end
endmodule

