`timescale 1ns / 1ns
`include "JCounter.v"

module JCounter_tb();

reg clk, reset;
wire [3:0] q;

JCounter uut(
    .clk(clk),
    .reset(reset),
    .q(q)
);

initial begin
    $dumpfile("JCounter_tb.vcd");
    $dumpvars(0, JCounter_tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #100 $finish;
end

always #5 clk = ~clk;

endmodule