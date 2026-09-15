`timescale 1ns/1ns
`include "bitsubcomparator4.v"
module bitsubcomparator4_tb();
wire f0;
wire f1;    
wire f2;
reg [3:0] a;
reg [3:0] b;
bitsubcomparator4 uut(
    .a(a),
    .b(b),
    .f0(f0),
    .f1(f1),
    .f2(f2)
);
initial begin
    $dumpfile("bitsubcomparator4_tb.vcd");
    $dumpvars(0, bitsubcomparator4_tb);

    // Test 1: A < B
    a = 4'b0001;
    b = 4'b0011;
    #10;
    $display("A=%b B=%b | Equal=%b Greater=%b Less=%b",
             a, b, f0, f1, f2);

    // Test 2: A > B
    a = 4'b1001;
    b = 4'b0111;
    #10;
     $display("A=%b B=%b | Equal=%b Greater=%b Less=%b",
             a, b, f0, f1, f2);
    // Test 3: A > B
    a = 4'b0110;
    b = 4'b0101;
    #10;
    $display("A=%b B=%b | Equal=%b Greater=%b Less=%b",
             a, b, f0, f1, f2);
    // Test 3: A < B
    a = 4'b0010;
    b = 4'b1000;
    #10;
    $display("A=%b B=%b | Equal=%b Greater=%b Less=%b",
             a, b, f0, f1, f2);
end
endmodule