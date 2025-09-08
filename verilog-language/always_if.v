// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    // always block
    always@(*) begin
        if(sel_b1 == 1'b1 && sel_b2 == 1'b1) begin
            out_always = b;
        end else begin
            out_always = a;
        end
    end

    // continuous assignment
    assign out_assign = (sel_b1 & sel_b2) ? b : a;


endmodule


// a more compact way to write the same thing would be as follows
// if one line after if, can remove the beign and end lines.
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    // always block
    always@(*) begin
        out_always = (sel_b1 & sel_b2) ? b : a;
    end

    // continuous assignment
    assign out_assign = (sel_b1 & sel_b2) ? b : a;


endmodule

