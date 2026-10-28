
`timescale 1ns/1ns
`include "jk_ff.v"

module jk_ff_tb();

reg j, k, clk, reset;
wire q;

jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Generate a clock with a 10 ns period
always #5 clk = ~clk;

initial begin
    $dumpfile("jk_ff_tb.vcd");
    $dumpvars(0, jk_ff_tb);

    clk = 0;
    reset = 0;
    j = 0;
    k = 0;

    #10 reset = 1;

    // Test 1: Hold
    j = 0; k = 0;
    #10;

    // Test 2: Reset through JK inputs
    j = 0; k = 1;
    #10;

    // Test 3: Set
    j = 1; k = 0;
    #10;

    // Test 4: Toggle
    j = 1; k = 1;
    #20;

    $display("Test completed");
    $finish;
end

endmodule
