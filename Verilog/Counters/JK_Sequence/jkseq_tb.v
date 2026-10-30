`timescale 1ns / 1ps
`include "jkseq.v"
module jkseq_tb();
reg clk,reset,e,mode;
wire [1:0] Q;
jkseq uut(
    .clk(clk),
    .reset(reset),
    .e(e),
    .mode(mode),
    .Q(Q)
);
always #5 clk = ~clk;
initial begin
    $dumpfile("jkseq.vcd");
    $dumpvars(0,jkseq_tb);
    clk=0;
    reset=1;
    e=1;
    mode=0;
    #10 reset=0;
    #10 e=0; mode=1;
    #10 e=0; mode=0;
    #10 e=1; mode=1;
    $finish;
end
initial begin
    $monitor("Time=%0t | e=%b | mode=%b | Q=%b",
             $time, e, mode, Q);
end
endmodule