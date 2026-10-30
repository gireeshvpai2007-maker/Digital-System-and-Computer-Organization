module Sequence_Counter(
    input clk,
    input reset,
    input w,
    output [2:0] Q
);

reg [2:0] next_state;
wire [2:0] J, K;

// Determine next state based on direction
always @(*)
begin
    case (Q)
        3'b000: next_state = (w) ? 3'b001 : 3'b110;
        3'b001: next_state = (w) ? 3'b010 : 3'b000;
        3'b010: next_state = (w) ? 3'b100 : 3'b001;
        3'b100: next_state = (w) ? 3'b110 : 3'b010;
        3'b110: next_state = (w) ? 3'b000 : 3'b100;

        default: next_state = 3'b000;
    endcase
end

// JK excitation equations
assign J = next_state & ~Q;
assign K = ~next_state & Q;

// Instantiate three JK flip-flops
JK_FF FF0(J[0], K[0], clk, reset, Q[0]);
JK_FF FF1(J[1], K[1], clk, reset, Q[1]);
JK_FF FF2(J[2], K[2], clk, reset, Q[2]);

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

