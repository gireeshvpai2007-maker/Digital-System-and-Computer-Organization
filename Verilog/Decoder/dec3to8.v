module dec3to8(
    input [2:0] A,
    output [7:0] Y
);

dec2to4 dec1(
    .EN(~A[2]),
    .A(A[1:0]),
    .Y(Y[3:0])
);

dec2to4 dec2(
    .EN(A[2]),
    .A(A[1:0]),
    .Y(Y[7:4])
);

endmodule


module dec2to4(
    input EN,
    input [1:0] A,
    output reg [3:0] Y
);

always @(*) begin

    if(EN == 1'b1) begin

        case(A)
            2'b00: Y = 4'b0001;
            2'b01: Y = 4'b0010;
            2'b10: Y = 4'b0100;
            2'b11: Y = 4'b1000;
            default: Y = 4'b0000;
        endcase

    end

    else begin
        Y = 4'b0000;
    end

end

endmodule