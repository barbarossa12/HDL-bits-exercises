// https://hdlbits.01xz.net/wiki/Lemmings4
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

    // onehot encoded states
    localparam LEFT   = 7'b0000001;
    localparam RIGHT  = 7'b0000010;
    localparam DIG_L  = 7'b0000100;
    localparam DIG_R  = 7'b0001000;
    localparam FALL_L = 7'b0010000;
    localparam FALL_R = 7'b0100000;
    localparam SPLAT  = 7'b1000000;
    

    reg [6:0] state, next_state;
    reg [4:0] cycle_counter;

    // next state logic
    always @(*) begin
        case (state)
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
            DIG_L:
                if(!ground) next_state = FALL_L;
                else next_state = DIG_L;
            DIG_R:
                if(!ground) next_state = FALL_R;
                else next_state = DIG_R;
            FALL_L:
                if(!ground) next_state = FALL_L;
                else if( cycle_counter >= 5'd21) next_state = SPLAT;
                else next_state = LEFT;
            FALL_R:
                if(!ground) next_state = FALL_R;
                else if(cycle_counter >= 5'd21) next_state = SPLAT;
                else next_state = RIGHT;
            SPLAT:
                next_state = SPLAT;
        default: next_state = LEFT;
        endcase
    end

    // sequential registers
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= LEFT;
            cycle_counter <= 5'b00000;
        end
        else begin
            state <= next_state;
            if(state == FALL_L || state == FALL_R) begin
                // just landed do not count further
                if(ground) cycle_counter <= 5'b00000;
                // still falling, keep counting.
                else cycle_counter <= cycle_counter + 5'b00001;
            end
            else cycle_counter <= 5'b00000;
        end
    end


    // output logic
    always @(*) begin
       {walk_left, walk_right, aaah, digging} = 4'b0000;
       case (state)
            LEFT: walk_left    = 1'b1;
            RIGHT: walk_right  = 1'b1;
            FALL_L: aaah       = 1'b1;
            FALL_R: aaah       = 1'b1;
            DIG_L: digging     = 1'b1;
            DIG_R: digging     = 1'b1;
            SPLAT: {walk_left, walk_right, aaah, digging} = 4'b0000;
       endcase
    end
endmodule