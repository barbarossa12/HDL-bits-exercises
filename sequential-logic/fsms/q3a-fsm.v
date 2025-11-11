module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    // first finite state machine
    // one hot encoded states
    localparam A = 2'b01;
    localparam B = 2'b10;

    reg [1:0] fsm1_state, fsm1_next_state;

    // fsm1 next_state logic
    always @(*) begin
        case(state)
            A : if(s) fsm1_next_state = B;
                else fsm1_next_state = A;
            B : if()
        endcase
    end
    // fsm1 sequential logic
    always @(posedge clk) begin
        if(reset) fsm1_state <= A;
        else fsm1_state <= fsm1_next_state;
    end
    // fsm1 output logic
    assign w = (state == B);

    // second finite state machine - counting W pulses
    localparam S0 = 4'b0001;
    localparam S1 = 4'b0010;
    localparam S2 = 4'b0100;
    localparam S3 = 4'b1000;

    reg[3:0] fsm2_state, fsm2_next_state;
    reg[1:0] w_pulse_counter;






endmodule