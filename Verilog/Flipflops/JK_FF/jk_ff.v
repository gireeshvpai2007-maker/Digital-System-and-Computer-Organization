module jk_ff(
input j,
input k,
input clk,
input reset,
output reg q
);
always@(negedge clk or negedge reset)
begin
    if(!reset)
     q<=0;
    else begin
    case({j,k})
    2'b00: q<=q;
    2'b01: q<=0;
    2'b10: q<=1;
    2'b11: q<=~q;
    default: q<=0;
    endcase
    end
end
endmodule