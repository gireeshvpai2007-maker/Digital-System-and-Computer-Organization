module JCounter (
    input clk,reset,
    output wire [3:0] q
);
dff dff0(.clk(clk), .reset(reset), .d(~q[3]), .q(q[0]));
dff dff1(.clk(clk), .reset(reset), .d(q[0]), .q(q[1]));
dff dff2(.clk(clk), .reset(reset), .d(q[1]), .q(q[2]));
dff dff3(.clk(clk), .reset(reset), .d(q[2]), .q(q[3]));
endmodule
module dff(
    input clk,
    input reset,
    input d,
    output reg q
);

    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule