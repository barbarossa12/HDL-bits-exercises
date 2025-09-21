// https://hdlbits.01xz.net/wiki/Fsm1s
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 1'b0,
              B = 1'b1;

    reg present_state, next_state;
    
    // sequential logic part
    always@(posedge clk) begin
        if(reset)
            present_state <= B;
        else
            present_state <= next_state;
    end
    
    // next state logic
    always@(*) begin
        case(present_state)
            B: if(in) next_state = B;
               else next_state   = A;
            A: if(in) next_state = A;
               else next_state   = B;
            default next_state   = B; // do we put the reset state here? - yes
        endcase
    end

    // output logic
    always@(*) begin
        case (present_state)
            B: out      = 1'b1;
            A: out      = 1'b0;
            default out = 1'b0;
            // what should I keep the default state here?
            // No because you have covered all cases.
            // But put it there as a safety net.
        endcase
    end

endmodule

