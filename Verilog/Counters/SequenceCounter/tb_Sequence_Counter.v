`timescale 1ns / 1ps
`include "Sequence_Counter.v"
module tb_Sequence_Counter;

reg clk, reset, w;
wire [2:0] Q;

Sequence_Counter uut (
    .clk(clk),
    .reset(reset),
    .w(w),
    .Q(Q)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    $dumpfile("Sequence_Counter.vcd");
    $dumpvars(0, tb_Sequence_Counter);

    clk = 0;
    reset = 1;
    w = 1;

    // Reset
    #10 reset = 0;

    // Forward sequence: 0, 1, 2, 4, 6
    #50;

    // Reverse sequence: 6, 4, 2, 1, 0
    w = 0;

    #50;

    $finish;
end

initial
begin
    $monitor("Time=%0t | w=%b | Q=%b | Decimal=%0d",
             $time, w, Q, Q);
end

endmodule
