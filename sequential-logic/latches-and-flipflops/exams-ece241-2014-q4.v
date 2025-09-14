// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4
module top_module (
    input clk,
    input x,
    output z
);  

    reg d0;
    reg d1;
    reg d2;
    reg q0;
    reg q1;
    reg q2;

    // Input combinational logic
    always@(*) begin
        d0 = q0 ^ x;
        d1 = x & (~q1);
        d2 = x | (~q2);
    end
    
    // Sequential logic
    always@(posedge clk) begin
       q0 <= d0; 
       q1 <= d1; 
       q2 <= d2; 
    end
    
    // Output combinational logic
    always@(*) begin
        z = ~(q0 | q1 | q2);
    end

endmodule

