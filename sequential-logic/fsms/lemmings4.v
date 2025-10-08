module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    // One hot encoded states
    parameter LEFT   = 7'b0000001;
    parameter RIGHT  = 7'b0000010;
    parameter FALL_L = 7'b0000100;
    parameter FALL_R = 7'b0001000;
    parameter DIG_L  = 7'b0010000;
    parameter DIG_R  = 7'b0100000;
    parameter SPLAT  = 7'b1000000;

    reg [6:0] state, next_state;
    reg [4:0] cycle_count = 5'b00000; // variable to keep track of clock cycle count
    // next_state logic
    always@(*) begin
        case(state) 
            LEFT:
                if(!ground) next_state = FALL_L;
                else if(dig) next_state = DIG_L;
                else if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            RIGHT:
                if(!ground) next_state = FALL_R;
                else if(dig) next_state = DIG_R;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            FALL_L:
                if(!ground) next_state = FALL_L;
                else if(cycle_count == 5'b10101) next_state = SPLAT;
                else next_state = LEFT;
            FALL_R:
                if(!ground) next_state = FALL_R;
                else if(cycle_count == 5'b10101) next_state = SPLAT;
                else next_state = RIGHT;
            DIG_L:
                if(!ground) next_state = FALL_L;
                else next_state = DIG_L;
            DIG_R:
                if(!ground) next_state = FALL_R;
                else next_state = DIG_R;
            SPLAT: next_state = SPLAT;
            default: next_state = LEFT;
        endcase
    end

    // sequential logic
    always@(posedge clk, posedge areset) begin
        if(areset) 
            begin
                state <= LEFT;
                cycle_count <= 5'b00000; 
            end
        else
            begin
                if (state == FALL_L || state == FALL_R) cycle_count
            end
    end

    // output logic
    always@(*) begin
        case(state)
            LEFT:    {walk_left, walk_right, aaah, digging} = 4'b1000;
            RIGHT:   {walk_left, walk_right, aaah, digging} = 4'b0100;
            FALL_L:  {walk_left, walk_right, aaah, digging} = 4'b0010;
            FALL_R:  {walk_left, walk_right, aaah, digging} = 4'b0010;
            DIG_L:   {walk_left, walk_right, aaah, digging} = 4'b0001;
            DIG_R:   {walk_left, walk_right, aaah, digging} = 4'b0001;
            SPLAT:   {walk_left, walk_right, aaah, digging} = 4'b0000;
            default: {walk_left, walk_right, aaah, digging} = 4'b1000;
        endcase
    end
endmodule
