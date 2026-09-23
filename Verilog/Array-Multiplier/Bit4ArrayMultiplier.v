module bit4ArrayMultiplier(
    input [3:0] m,
    input [3:0] n,
    output [7:0] p
);

wire [2:0] c;
wire [11:0] s;

assign p[0] = m[0] & n[0];

bit4adder add1(
    .a({1'b0, (m[3:1] & {3{n[0]}})}),
    .b(m & {4{n[1]}}),
    .sum(s[3:0]),
    .cout(c[0])
);

assign p[1] = s[0];

bit4adder add2(
    .a({c[0], s[3:1]}),
    .b(m & {4{n[2]}}),
    .sum(s[7:4]),
    .cout(c[1])
);

assign p[2] = s[4];

bit4adder add3(
    .a({c[1], s[7:5]}),
    .b(m & {4{n[3]}}),
    .sum(s[11:8]),
    .cout(c[2])
);

assign p[6:3] = s[11:8];
assign p[7] = c[2];

endmodule


module bit4adder(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output cout
);

assign {cout, sum} = a + b;

endmodule