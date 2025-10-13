// https://hdlbits.01xz.net/wiki/Exams/2014_q3c
module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
); 

    //output logic z
    assign z =  ( y == 3'b011) | (y == 3'b100);

    // output Y0
    assign Y0 = ((y == 3'b000) || (y == 3'b010)) ? x : ~x;
endmodule
