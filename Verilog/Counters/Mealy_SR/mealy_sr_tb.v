`timescale 1ns / 1ps
`include "mealy_sr.v"
module mealy_sr_tb();
reg clk,reset,x;
wire z;
wire [1:0] Q;
mealy_sr uut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .z(z),
    .Q(Q)
);
initial begin
    $dumpfile("mealy_sr.vcd");
    $dumpvars(0,mealy_sr_tb);
    clk=0;
    reset=1;
    x=0;
    #10 reset=0;
    #10 x=1;
    #10 x=0;
end
initial begin
    $monitor("Time=%0t | x=%b | z=%b | Q=%b",
             $time, x, z, Q);
end
endmodule