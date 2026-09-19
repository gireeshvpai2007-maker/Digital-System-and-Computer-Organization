`timescale 1ns/1ns
`include "fulladder.v"
module fulladder_tb();
reg a, b, cin;
wire sum, cout;
fulladder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);initial begin
$dumpfile("fulladder_tb.vcd");
$dumpvars(0, fulladder_tb);

    // Test case 1: a=0, b=0, cin=0
    a = 0; b = 0; cin = 0;
    #10;
    $display("Test case 1: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);

    // Test case 2: a=0, b=0, cin=1
    a = 0; b = 0; cin = 1;
    #10;
    $display("Test case 2: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);

    // Test case 3: a=0, b=1, cin=0
    a = 0; b = 1; cin = 0;
    #10;
    $display("Test case 3: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);

    // Test case 4: a=0, b=1, cin=1
    a = 0; b = 1; cin = 1;
    #10;
    $display("Test case 4: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);

    // Test case 5: a=1, b=0, cin=0
    a = 1; b = 0; cin = 0;
    #10;
    $display("Test case 5: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);

    // Test case 6: a=1, b=0, cin=1
    a = 1; b = 0; cin = 1;
    #10;
    $display("Test case 6: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);

    // Test case 7: a=1, b=1, cin=0
    a = 1; b = 1; cin = 0;
    #10;
    $display("Test case 7: a=%b, b=%b, cin=%b => sum=%b, cout=%b", a, b, cin, sum, cout);       
end 
endmodule