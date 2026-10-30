module t_seq(
    input clk,
    input reset,
    input s,
    input [1:0] a,
    output reg w,
    output [2:0] Q
);
always@(*)
begin
    if(s==0)
     
        w=a[0];
     
    else
     
        w=a[1];
     
end
reg [2:0] next_state;
wire [2:0] T;
always@(*)
begin
    case(Q)
        3'b001: next_state = (w) ? 3'b110 : 3'b010;
        3'b010: next_state = (w) ? 3'b001 : 3'b011;
        3'b011: next_state = (w) ? 3'b010 : 3'b100;
        3'b100: next_state = (w) ? 3'b011 : 3'b101;
        3'b101: next_state = (w) ? 3'b100 : 3'b110;
        3'b110: next_state = (w) ? 3'b101 : 3'b001;

        default: next_state = 3'b000;
    endcase
end
assign T=(next_state ^ Q);

t_ff tff0(T[0], clk, reset, Q[0]);
t_ff tff1(T[1], clk, reset, Q[1]);   
t_ff tff2(T[2], clk, reset, Q[2]);
endmodule
module t_ff(
    input clk,
    input reset,
    input t,
    output reg Q
);
always@(posedge clk or posedge reset)
begin
    if(reset)
        Q<=1'b0;
    else 
     Q<=t^Q;

end
endmodule