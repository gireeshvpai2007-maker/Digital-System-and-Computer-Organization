`timescale 1ns / 1ns
`include "Solution1.v"
module Solution1_tb();
reg [3:0]x;
wire f;
Solution1 uut(
    .x(x),
    .f(f)
);
initial begin
    $dumpfile("Solution1_tb.vcd");
    $dumpvars(0, Solution1_tb);
    x = 4'b0000;
    #10 x = 4'b0001;
    #10 x = 4'b0010;
    #10 x = 4'b0011;
    #10 x = 4'b0100;
    #10 x = 4'b0101;
    #10 x = 4'b0110;
    #10 x = 4'b0111;
    #10 x = 4'b1000;
    #10 x = 4'b1001;
    #10 x = 4'b1010;
    #10 x = 4'b1011;
    #10 x = 4'b1100;
    #10 x = 4'b1101;
    #10 x = 4'b1110;
    #10 x = 4'b1111;
    $display("Test completed");
end
endmodule