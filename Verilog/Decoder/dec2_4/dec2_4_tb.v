`timescale 1ns/1ns
`include "dec2_4.v"
module dec2_4_tb();
reg [1:0] A;
reg EN;
wire [3:0] Y;
dec2_4 uut (
    .A(A),
    .EN(EN),
    .Y(Y)
);
initial begin
    $dumpfile("dec2_4_tb.vcd");
    $dumpvars(0,dec2_4_tb);
    
     A = 2'b00;
        EN = 1'b1;
        #10;

        // Test case 2: Select input 1
        A = 2'b01;
        EN = 1'b1;
        #10;

        // Test case 3: Select input 2
        A = 2'b10;
        EN = 1'b1;
        #10;

        // Test case 4: Select input 3
        A = 2'b11;
        EN = 1'b1;
        #10;

        $display("Test completed");
end
endmodule