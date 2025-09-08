/*
* HDL bits Always case 2 
* https://hdlbits.01xz.net/wiki/Always_case2
* Both MSB friendly and LSB friendly
* versions are implemented.
*/
// MSB friendly version
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always@(*) begin
        casez(in)
            4'b1???: pos = 2'b11;
            4'b01??: pos = 2'b10;
            4'b001?: pos = 2'b01;
            4'b0001: pos = 2'b00;
            default:  pos = 2'b00;
        endcase
    end

endmodule

// LSB friendly version
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always@(*) begin
        casez(in)
            4'b???1: pos = 2'b00;
            4'b??1?: pos = 2'b01;
            4'b?1??: pos = 2'b10;
            4'b1???: pos = 2'b11;
            default:  pos = 2'b00;
        endcase
    end

endmodule
