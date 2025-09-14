// https://hdlbits.01xz.net/wiki/Exams/2014_q4a
module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    reg d;
    
    // Combinational logic
    always@(*)begin
        case({E,L}) 
            2'b00: d = Q;
            2'b01: d = R;
            2'b10: d = w;
            2'b11: d = R;
        endcase
    end
    // sequential logic
    always@(posedge clk) begin
        Q <= d;
    end

endmodule

