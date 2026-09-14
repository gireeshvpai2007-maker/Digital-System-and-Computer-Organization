`timescale 1ns/1ns
`include "bitaddsub4.v"
module bitaddsub4_tb();

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    bitaddsub4 uut (
        .a(A),
        .b(B),
        .cin(Cin),
        .sum(Sum),
        .cout(Cout)
    );

    initial begin

        $dumpfile("bitaddsub4_tb.vcd");
        $dumpvars(0, bitaddsub4_tb);

        // 5 + 3 = 8
        A = 4'b0101;
        B = 4'b0011;
        Cin = 1'b0;
        #10;

        // 9 - 7 = 2
        A = 4'b1001;
        B = 4'b0111;
        Cin = 1'b1; // Subtraction
        #10;

        // 6 + 5 = 11
        A = 4'b0110;
        B = 4'b0101;
        Cin = 1'b0;
        #10;

        // 2 - 8 = -6 (in two's complement)
        A = 4'b0010;
        B = 4'b1000;
        Cin = 1'b1; // Subtraction
        #10;

        // 9 + 9 + 1 = 19
        A = 4'b1001;
        B = 4'b1001;
        Cin = 1'b0;
        #10;

        $display("Test completed");
        $finish;

    end
endmodule