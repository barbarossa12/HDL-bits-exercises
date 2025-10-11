// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5a
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    // onehot encoded states
    localparam S0 = 3'b001;
    localparam S1 = 3'b010;
    localparam S2 = 3'b100;

    // registers
    reg [2:0] state, next_state;

    // sequential logic
    always @(posedge clk, posedge areset) begin
        if(areset) state <= S0;
        else state <= next_state;
    end

    // next state logic
    always @(*) begin
        case (state)
            S0: if(x) next_state = S1;
                else next_state  = S0;
            S1: if(x) next_state = S2;
                else next_state  = S1;
            S2: if(x) next_state = S2;
                else next_state  = S1;
            default: next_state  = S0;
        endcase
    end

    // output logic
    assign z = (state == S1);

endmodule