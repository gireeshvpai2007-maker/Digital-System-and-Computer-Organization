
`timescale 1ns/1ns
`include "t_seq.v"
module tb_t_seq();

reg clk, reset, s;
reg [1:0] a;

wire [2:0] Q;
wire w;

t_seq uut(
    .clk(clk),
    .reset(reset),
    .s(s),
    .a(a),
    .w(w),
    .Q(Q)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    $dumpfile("t_seq.vcd");
    $dumpvars(0, tb_t_seq);

    clk = 0;
    reset = 1;
    s = 0;
    a = 2'b00;

    #10 reset = 0;

    #10 s = 1; a = 2'b01;
    #10 s = 0; a = 2'b10;
    #10 s = 1; a = 2'b11;
    #10 s = 0; a = 2'b00;

    #30 $finish;
end

initial
begin
    $monitor("Time=%0t | s=%b | a=%b | w=%b | Q=%b",
             $time, s, a, w, Q);
end

endmodule
