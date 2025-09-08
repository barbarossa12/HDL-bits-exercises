// HDL Bits ringer
// https://hdlbits.01xz.net/wiki/Ringer
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

    assign ringer = (ring == 1'b1) && (vibrate_mode == 1'b0) ? 1'b1 : 1'b0;
    assign motor = (ring  == 1'b1) && (vibrate_mode == 1'b1) ? 1'b1 : 1'b0;

endmodule
