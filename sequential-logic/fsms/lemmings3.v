module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging ); 

    // one hot encoded states
    parameter LEFT   = 6'b000001;
    parameter RIGHT  = 6'b000010;
    parameter FALL_L = 6'b000100;
    parameter FALL_R = 6'b001000;
    parameter DIG_L  = 6'b010000;
    parameter DIG_R  = 6'b100000;

    reg [5:0] state, next_state;

    // next_state logic
    always@(*) begin
        case(state)
            LEFT: 
                  if(!ground) next_state = FALL_L;
                  else if(dig) next_state = DIG_L;
                  else if (bump_left) next_state = RIGHT;
                  else next_state = LEFT;
            RIGHT: 
                  if(!ground) next_state = FALL_R;
                  else if(dig) next_state = DIG_R;
                  else if(bump_right) next_state = LEFT;
                  else next_state = RIGHT;
            FALL_L:
                  if(!ground) next_state = FALL_L;
                  else next_state = LEFT;
            FALL_R:
                  if(!ground) next_state = FALL_R;
                  else next_state = RIGHT;
            DIG_L:
                  if(ground) next_state = DIG_L;
                  else next_state = FALL_L;
            DIG_R:
                  if(ground) next_state = DIG_R;
                  else next_state = FALL_R;
            default: next_state = LEFT;
        endcase
    end

    // sequential logic
    always@(posedge clk, posedge areset) begin
        if(areset) state <= LEFT;
        else state <= next_state;
    end

    //output logic
    always@(*) begin
        case(state)
            LEFT:    {walk_left, walk_right, aaah, digging} = 4'b1000;
            RIGHT:   {walk_left, walk_right, aaah, digging} = 4'b0100;
            FALL_L:  {walk_left, walk_right, aaah, digging} = 4'b0010;
            FALL_R:  {walk_left, walk_right, aaah, digging} = 4'b0010;
            DIG_L:   {walk_left, walk_right, aaah, digging} = 4'b0001;
            DIG_R:   {walk_left, walk_right, aaah, digging} = 4'b0001;
            default: {walk_left, walk_right, aaah, digging} = 4'b1000;
        endcase
    end

endmodule
 