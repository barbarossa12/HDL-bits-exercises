/*
    * HDLbits alwaysblock2
    * https://hdlbits.01xz.net/wiki/Alwaysblock2
    *
*/
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    

    // assignment statement
    assign out_assign = a ^ b;
    
    // combinational always block
    always@(*) begin
        out_always_comb = a ^b;

    end
    
    // clocked always block
    always@(posedge clk) begin
        out_always_ff <= a ^ b;
    end
endmodule

