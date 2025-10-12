// https://hdlbits.01xz.net/wiki/Exams/2014_q3bfsm
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    reg [2:0] state, next_state;

    // next state logic
    always @(*) begin
       case(state)
        S0: next_state = x ? S1 : S0;
        S1: next_state = x ? S4 : S1;
        S2: next_state = x ? S1 : S2;
        S3: next_state = x ? S2 : S1;
        S4: next_state = x ? S4 : S3;
        default : next_state = S0;
       endcase 
    end

    // sequential logic
    always @(posedge clk ) begin
        if(reset) state <= S0;
        else state <= next_state;
    end

    // output logic
    assign z = (state == S3) || (state == S4);

endmodule