module Mux8to1 (
    input [7:0] D,
    input [2:0] S,
    output wire Y
);

    wire Y1, Y2;

    Mux4to1 mux1 (
        .D(D[3:0]),
        .S(S[1:0]),
        .Y(Y1)
    );

    Mux4to1 mux2 (
        .D(D[7:4]),
        .S(S[1:0]),
        .Y(Y2)
    );

    Mux2to1 mux3 (
        .D({Y2, Y1}),
        .S(S[2]),
        .Y(Y)
    );

endmodule
module Mux4to1 (input [3:0] D, input [1:0] S, output reg Y);
    always @(*) begin
        case (S)
            2'b00: Y = D[0];
            2'b01: Y = D[1];
            2'b10: Y = D[2];
            2'b11: Y = D[3];
            default: Y = 1'b0; // Default case to avoid latches
        endcase
    end
    endmodule
    module Mux2to1 (input [1:0] D, input S, output reg Y);
    always @(*) begin
        case (S)
            1'b0: Y = D[0];
            1'b1: Y = D[1];
            default: Y = 1'b0; // Default case to avoid latches
        endcase
    end
    endmodule