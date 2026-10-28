`timescale 1ns / 1ns
`include "CaseMux4_1.v"
module CaseMux4_1_tb();
reg [3:0] a;
reg [1:0] s;
wire y;
CaseMux4_1 uut (
    .a(a),
    .s(s),
    .y(y)
);
initial begin
    $dumpfile("CaseMux4_1_tb.vcd");
    $dumpvars(0,CaseMux4_1_tb);
    
     a = 4'b1010;
        s = 2'b00;
        #10;

        // Test case 2: Select a[1]
        a = 4'b1010;
        s = 2'b01;
        #10;

        // Test case 3: Select a[2]
        a = 4'b1010;
        s = 2'b10;
        #10;

        // Test case 4: Select a[3]
        a = 4'b1010;
        s = 2'b11;
        #10;

        $display("Test completed");
end
endmodule