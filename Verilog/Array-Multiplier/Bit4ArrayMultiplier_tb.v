`timescale 1ns / 1ns
`include "Bit4ArrayMultiplier.v"
module Bit4ArrayMultiplier_tb();
reg [3:0] m, n;
wire [7:0] p;
bit4ArrayMultiplier uut(
    .m(m),
    .n(n),
    .p(p)
);
initial begin
    $dumpfile("Bit4ArrayMultiplier_tb.vcd");
    $dumpvars(0, Bit4ArrayMultiplier_tb);
    m = 4'b0000; n = 4'b0000;
    #10 m = 4'b0001; n = 4'b0001;
    #10 m = 4'b0010; n = 4'b0010;
    #10 m = 4'b0011; n = 4'b0011;
    #10 m = 4'b0100; n = 4'b0100;
    #10 m = 4'b0101; n = 4'b0101;
    #10 m = 4'b0110; n = 4'b0110;
    #10 m = 4'b0111; n = 4'b0111;
    #10 m = 4'b1000; n = 4'b1000;
    #10 m = 4'b1001; n = 4'b1001;
    #10 m = 4'b1010; n = 4'b1010;
    #10 m = 4'b1011; n = 4'b1011;
    #10 m = 4'b1100; n = 4'b1100;
    #10 m = 4'b1101; n = 4'b1101;
    #10 m = 4'b1110; n = 4'b1110;
    #10 m = 4'b1111; n = 4'b1111;
    $display("Test completed");
end
endmodule