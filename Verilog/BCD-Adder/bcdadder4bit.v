module bcdadder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output carry
);

    wire [3:0] temp_sum;
    wire first_carry;
    wire correction;
    wire [3:0] correction_value;
    wire second_carry;

    // First binary addition
    bitadder4 b0(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(temp_sum),
        .carry(first_carry)
    );

    // BCD correction condition
    assign correction = first_carry |
                        (temp_sum[3] & temp_sum[2]) |
                        (temp_sum[3] & temp_sum[1]);

    // Add 6 if correction is required
    assign correction_value =
                correction ? 4'b0110 : 4'b0000;

    // Second addition
    bitadder4 b1(
        .a(temp_sum),
        .b(correction_value),
        .cin(1'b0),
        .sum(sum),
        .carry(second_carry)
    );

    assign carry = correction;

endmodule


module bitadder4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output carry
);

    wire [2:0] c;

    fulladder fa0(
        a[0], b[0], cin,
        sum[0], c[0]
    );

    fulladder fa1(
        a[1], b[1], c[0],
        sum[1], c[1]
    );

    fulladder fa2(
        a[2], b[2], c[1],
        sum[2], c[2]
    );

    fulladder fa3(
        a[3], b[3], c[2],
        sum[3], carry
    );

endmodule


module fulladder(
    input a,
    input b,
    input c,
    output sum,
    output carry
);

    assign sum = a ^ b ^ c;

    assign carry = (a & b) |
                   (b & c) |
                   (a & c);

endmodule