// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5b
module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    // one hot encoded states
    localparam S0 = 2'b01;
    localparam S1 = 2'b10;

    reg[1:0] state, next_state;

    // sequential logic
    always@(posedge clk, posedge areset) begin
        if(areset) state = S0;
        else state <= next_state;
    end

    // next_state and output logic
    always@(*) begin
        next_state = S0;
        z = 1'b0;
        case(state)
            S0: if(x) {next_state, z} = {S1, 1'b1};
                else  {next_state, z} = {S0, 1'b0};
            S1: if(x) {next_state, z} = {S1, 1'b0};
                else  {next_state, z} = {S1, 1'b1};
            default:  {next_state, z} = {S0, 1'b0};
        endcase
    end
endmodule
