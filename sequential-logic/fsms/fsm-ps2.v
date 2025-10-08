// https://hdlbits.01xz.net/wiki/Fsm_ps2
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter BYTE1 = 4'b0001;
    parameter BYTE2 = 4'b0010;
    parameter BYTE3 = 4'b0100;
    parameter DONE  = 4'b1000;

    reg [3:0] state, next_state;

    // next state logic
    always @(*) begin
        case(state)
            BYTE1: next_state = in[3] ? BYTE2 : BYTE1;
            BYTE2: next_state = BYTE3;
            BYTE3: next_state = DONE;
            DONE:  next_state = in[3] ? BYTE2 : BYTE1;
        endcase
    end

    // NOTE: at the done state, we have another byte in the input register
    // we need to check if that has in[3] condition and then decide to go to 
    // BYTE1 or BYTE2 state because if it does, than that is the first byte.

    // sequential logic
    always @(posedge clk ) begin
        if(reset) state = BYTE1;
        else state <= next_state;
    end

    // output logic
    assign done = (state == DONE);

endmodule
