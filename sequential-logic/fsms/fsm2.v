//https://hdlbits.01xz.net/wiki/Fsm2
module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=1'b0, ON=1'b1; 
    reg state, next_state;

	// sequential logic
	always@(posedge clk, posedge areset) begin
		if(areset) state <= OFF;
		else state <= next_state;
	end

	// next state logic
	always@(*) begin
		case(state)
			OFF: if(j) next_state = ON;
				 else  next_state = OFF;
			ON: if(k)  next_state = OFF;
				else   next_state = ON;
		endcase
	end

	// output logic
	assign out = (state == ON);

endmodule
