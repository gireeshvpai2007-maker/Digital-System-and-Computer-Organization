module bitsubcomparator4(
    input [3:0] a,
    input [3:0] b,
    output f0,   // A = B
    output f1,   // A > B
    output f2    // A < B
);

wire z, v, n;
wire [3:0] sum;
wire c0, c1, c2, c3;

// A - B = A + (~B) + 1

assign {c0, sum[0]} = a[0] + (~b[0]) + 1'b1;
assign {c1, sum[1]} = a[1] + (~b[1]) + c0;
assign {c2, sum[2]} = a[2] + (~b[2]) + c1;
assign {c3, sum[3]} = a[3] + (~b[3]) + c2;

// Zero flag
assign z = ~|sum;

// Negative flag
assign n = sum[3];

// Signed overflow
assign v = c3 ^ c2;

// A = B
assign f0 = z;

// A > B
assign f1 = ~(n ^ v) & ~z;

// A < B
assign f2 = n ^ v;

endmodule