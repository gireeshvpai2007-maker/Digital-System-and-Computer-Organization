`timescale 1ns / 1ns
`include "RCounter.v"

module RCounter_tb();

reg clk, reset;
wire [3:0] q;

RCounter uut(
    .clk(clk),
    .reset(reset),
    .q(q)
);

initial begin
    $dumpfile("RCounter_tb.vcd");
    $dumpvars(0, RCounter_tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;
    #100 $finish;
end

always #5 clk = ~clk;

endmodule