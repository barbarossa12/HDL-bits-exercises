// MOORE state machine for Lemmings2.v
// https://hdlbits.01xz.net/wiki/Lemmings2
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
	
	/* State encodings one hot encoding is used*/
	parameter LEFT   = 4'b0001;
	parameter RIGHT  = 4'b0010;
	parameter FALL_R = 4'b0100;
	parameter FALL_L = 4'b1000;
	
	// registers to hold the state
	reg[3:0 ]state, next_state;
	
	// next state logic
	always@(*)begin
		case(state)
			LEFT: 	if(!ground) next_state = FALL_L;
					else if(bump_left) next_state = RIGHT;
					else next_state = LEFT;
			RIGHT:  if(!ground) next_state = FALL_R;
			        else if(bump_right) next_state = LEFT;
				    else next_state = RIGHT;
			FALL_L: if(ground) next_state = LEFT;
				    else next_state = FALL_L;
			FALL_R: if(ground) next_state = RIGHT;
			  	    else next_state = FALL_R;
		endcase	
	end

	// sequential logic
	always@(posedge clk, posedge areset) begin
		if(areset) state <= LEFT;
		else state <=  next_state;
	end

	// output state logic
	assign walk_left = (state == LEFT);
	assign walk_right = (state == RIGHT);
	assign aaah = (state == FALL_L) | (state == FALL_R);

endmodule
