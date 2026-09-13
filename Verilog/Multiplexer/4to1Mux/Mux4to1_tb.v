`timescale 1ns/1ns
`include "Mux4to1.v"

module Mux4to1_tb();

    reg [3:0] D;
    reg [1:0] S;
    wire Y;

    Mux4to1 uut (
        .D(D),
        .S(S),
        .Y(Y)
    );

    initial begin

        $dumpfile("Mux4to1_tb.vcd");
        $dumpvars(0, Mux4to1_tb);

        // Test case 1: Select D[0]
        D = 4'b1010;
        S = 2'b00;
        #10;

        // Test case 2: Select D[1]
        D = 4'b1010;
        S = 2'b01;
        #10;

        // Test case 3: Select D[2]
        D = 4'b1010;
        S = 2'b10;
        #10;

        // Test case 4: Select D[3]
        D = 4'b1010;
        S = 2'b11;
        #10;

        $display("Test completed");
        $finish;

    end
    endmodule