module RCounter (
    input clk, reset,
    output wire [3:0] q
);
dff d0(.clk(clk), .reset(reset), .d(q[3]), .q(q[0]));
dff d1(.clk(clk), .reset(reset), .d(q[2]), .q(q[3]));
dff d2(.clk(clk), .reset(reset), .d(q[1]), .q(q[2]));
dff d3(.clk(clk), .reset(reset), .d(q[0]), .q(q[1]));

endmodule
module dff(
    input clk,
    input reset,
    input d,
    output reg q
);

    always @(posedge clk) begin
        if (reset)
            q <= 4'b1000;
        else
            q <= d;
    end
    endmodule