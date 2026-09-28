module JCounter (
    input clk,
    input rst,
    output reg [3:0] q
);
dff dff0(.clk(clk), .d(~q[3]), .q(q[0]));
dff dff1(.clk(clk), .d(q[0]), .q(q[1]));
dff dff2(.clk(clk), .d(q[1]), .q(q[2]));
dff dff3(.clk(clk), .d(q[2]), .q(q[3]));
endmodule
module dff(
    input clk,
    input d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule