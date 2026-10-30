module mealy_sr(
    input clk,
    input reset,
    input x,
    output reg z,
    output [1:0]Q
);
reg [1:0] next_state;
wire [1:0] S, R;
always@(*)
begin
    case(Q)
        2'b00: 
        begin
            if(x==1)
                begin
                    next_state=2'b01;
                    z=0;
                end
                else
                begin
                    next_state=2'b11;
                    z=1;
                end
        end
        2'b01:
        begin
             if(x==1)
             begin
                next_state=2'b11;
                z=0;
             end
             else
             begin
                next_state=2'b01;
                z=1;
             end
        end
        2'b10: 
        begin
            if(x==1)
                begin
                    next_state=2'b11;
                    z=0;
                end
                else
                begin
                    next_state=2'b00;
                    z=1;
                end
      
        end
        2'b11:
        begin
            if(x==1)
                begin
                    next_state=2'b11;
                    z=1;
                end
                else
                begin
                    next_state=2'b10;
                    z=1;
                end
        end 

        default: begin
            next_state = 2'b00;z=0;
        end
                 
    endcase
end
assign S=next_state & ~Q;
assign R=~next_state & Q;
sr_ff sr0(S[0], R[0], clk, reset, Q[0]);
sr_ff sr1(S[1], R[1], clk, reset, Q[1]);
endmodule
module sr_ff(
    input S,
    input R,
    input clk,
    input reset,
    output reg Q
);
always@(posedge clk or posedge reset)
begin
    if(reset)
        Q<=1'b0;
    else
    begin
        case({S,R})
            2'b00: Q<=Q;
            2'b01: Q<=1'b0;
            2'b10: Q<=1'b1;
            2'b11: Q<=1'bx;
        endcase
    end
end
endmodule
