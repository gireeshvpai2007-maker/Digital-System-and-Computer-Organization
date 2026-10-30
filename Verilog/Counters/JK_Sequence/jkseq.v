module jkseq(
    input clk,
    input reset,
    input e,
    input mode,
    output [1:0] Q
);
reg [1:0] next_state;
wire [1:0]J, K;
always @(*)
begin
    if(e==1)
     next_state=Q;
     else
     begin
        case(Q)
            2'b00: next_state = (mode) ? 2'b01 : 2'b11;
            2'b01: next_state = (mode) ? 2'b10 : 2'b00;
            2'b10: next_state = (mode) ? 2'b11 : 2'b01;
            2'b11: next_state = (mode) ? 2'b00 : 2'b10;

            default: next_state = 2'b00;
            endcase
     end
end
assign J=next_state & ~Q;
assign K=~next_state & Q;
JK_FF FF0(J[0], K[0], clk, reset, Q[0]);
JK_FF FF1(J[1], K[1], clk, reset, Q[1]);

endmodule
module JK_FF(
    input J,
    input K,
    input clk,
    input reset,
    output reg Q
);
always @(posedge clk or posedge reset)
begin
    if (reset)
        Q <= 1'b0;
    else
    begin
        case ({J,K})
            2'b00: Q <= Q;       // No change
            2'b01: Q <= 1'b0;    // Reset
            2'b10: Q <= 1'b1;    // Set
            2'b11: Q <= ~Q;      // Toggle
        endcase
    end
end
endmodule