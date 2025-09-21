// https://hdlbits.01xz.net/wiki/Fsm1
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output reg out);//  

    parameter A = 1'b0;
    parameter B = 1'b1;

    reg state, next_state;
    
    // next state logic
    always @(*) begin
        case(state)
            B: if(in) next_state = B;
               else   next_state = A;
            A: if(in) next_state = A;
               else   next_state = B;
            default next_state = B; 
        endcase
    end
    
    
    always @(posedge clk, posedge areset) begin
        if(areset) state <= B;
        else
            state <= next_state;
    end

    // Output logic
    always@(*) begin
        case(state)
            B: out = 1'b1;
            A: out = 1'b0;
        endcase
    end

endmodule

