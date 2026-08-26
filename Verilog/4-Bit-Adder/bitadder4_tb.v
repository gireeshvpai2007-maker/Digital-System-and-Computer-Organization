`timescale 1ns/1ns

module bitadder4_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    bitadder4 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("bitadder4_tb.vcd");
        $dumpvars(0, bitadder4_tb);

        // Test case 1: 1 + 2 = 3
        A = 4'b0001;
        B = 4'b0010;
        Cin = 1'b0;
        #10;

        // Test case 2: 15 + 1 = 16
        A = 4'b1111;
        B = 4'b0001;
        Cin = 1'b0;
        #10;

        // Test case 3: 10 + 5 + 1 = 16
        A = 4'b1010;
        B = 4'b0101;
        Cin = 1'b1;
        #10;

        // Test case 4: 15 + 15 + 1 = 31
        A = 4'b1111;
        B = 4'b1111;
        Cin = 1'b1;
        #10;

        $display("Test completed");
        $finish;

    end

endmodule