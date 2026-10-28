`timescale 1ns / 1ns
`include "dec3to8.v"
module dec3to8_tb();

reg [2:0]A;
wire [7:0]Y;
dec3to8 uut(
    .A(A),
    .Y(Y)
);
initial begin
    $dumpfile("dec3to8_tb.vcd");
    $dumpvars(0, dec3to8_tb);
    A = 3'b000;
    #10 A = 3'b001;
    #10 A = 3'b010;
    #10 A = 3'b011;
    #10 A = 3'b100;
    #10 A = 3'b101;
    #10 A = 3'b110;
    #10 A = 3'b111;
    $display("Test completed");
end
endmodule