`timescale 1ns/1ns
`include "Mux8to1.v"
module Mux8to1_tb();

    reg [7:0] D;
    reg [2:0] S;
    wire Y;

    Mux8to1 uut (
        .D(D),
        .S(S),
        .Y(Y)
    );

    initial begin

        $dumpfile("Mux8to1_tb.vcd");
        $dumpvars(0, Mux8to1_tb);

        // Test case 1: Select D[0]
        D = 8'b10101010;
        S = 3'b000;
        #10;

        // Test case 2: Select D[1]
        D = 8'b10101010;
        S = 3'b001;
        #10;

        // Test case 3: Select D[2]
        D = 8'b10101010;
        S = 3'b010;
        #10;

        // Test case 4: Select D[3]
        D = 8'b10101010;
        S = 3'b011;
        #10;

        // Test case 5: Select D[4]
        D = 8'b10101010;
        S = 3'b100;
        #10;

        // Test case 6: Select D[5]
        D = 8'b10101010;
        S = 3'b101;
        #10;

        // Test case 7: Select D[6]
        D = 8'b10101010;
        S = 3'b110;
        #10;

        // Test case 8: Select D[7]
        D = 8'b10101010;
        S = 3'b111;
        #10;

        $display("Test completed");
        $finish;

    end
    endmodule