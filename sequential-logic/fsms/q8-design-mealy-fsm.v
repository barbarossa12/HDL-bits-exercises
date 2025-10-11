// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q8
module top_module(
    input clk,
    input aresetn, // asynchronous active low reset
    input x,
    output z
);
    // onehot state encoding
    localparam S0 = 3'b001;
    localparam S1 = 3'b010;
    localparam S2 = 3'b100;

    // registers
    reg [2:0] state, next_state;

    // sequential logic
    always @(posedge clk, negedge aresetn) begin
        if(!aresetn) state <= S0;
        else state <= next_state;
    end

    // next_state and output logic
    always @(*) begin
        next_state = S0;
        z = 1'b0;
        case(state)
            S0: if(x) {next_state, z} = {S1, 1'b0};
                else  {next_state, z} = {S0, 1'b0};
            S1: if(x) {next_state, z} = {S1, 1'b0};
                else  {next_state, z} = {S2, 1'b0};
            S2: if(x) {next_state, z} = {S1, 1'b1};
                else  {next_state, z} = {S0, 1'b0};
            default {next_state, z} = {S0, 1'b0};
        endcase 
    end
    

endmodule
