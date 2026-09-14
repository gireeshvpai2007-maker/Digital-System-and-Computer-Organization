module bitcomparator4(
    input [3:0] a,
    input [3:0] b,
    output f0,   // A = B
    output f1,   // A > B
    output f2    // A < B
);

wire [3:0] g;
wire equal;
wire greater;
wire less;

// Check equality of each bit
assign g = ~(a ^ b);

// All bits equal
assign equal = g[3] & g[2] & g[1] & g[0];

// A > B
assign greater =
       ( a[3] & ~b[3] )
     | ( g[3] &  a[2] & ~b[2] )
     | ( g[3] & g[2] &  a[1] & ~b[1] )
     | ( g[3] & g[2] & g[1] & a[0] & ~b[0] );

// A < B
assign less = ~equal & ~greater;

// Outputs
assign f0 = equal;
assign f1 = greater;
assign f2 = less;

endmodule