 //https://hdlbits.01xz.net/wiki/Mux256to1v 
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    assign out = in[4*sel+3 -: 4];

endmodule

