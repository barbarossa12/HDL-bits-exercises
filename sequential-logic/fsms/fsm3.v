// https://hdlbits.01xz.net/wiki/Fsm3
module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    // onehot encoded states
    parameter A = 4'b0001;
    parameter B = 4'b0010;
    parameter C = 4'b0100;
    parameter D = 4'b1000;

    reg [3:0] state, next_state;

    // State transition logic
    always@(*)begin
        case(state)
            A: if(in) next_state = B;
               else   next_state = A; 
            B: if(in) next_state = B;
               else   next_state = C;
            C: if(in) next_state = D;
               else   next_state = A;
            D: if(in) next_state = B;
               else   next_state = C;
        endcase
    end

    // State flip-flops with asynchronous reset
    always@(posedge clk, posedge areset) begin
        if(areset) state <= A;
        else state <= next_state;
    end

    // Output logic
    assign out = (state == D);

endmodule
