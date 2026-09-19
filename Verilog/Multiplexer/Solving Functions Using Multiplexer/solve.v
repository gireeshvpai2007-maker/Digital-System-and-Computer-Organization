/*Solve this function using two 2:1 mux and a inverter ,
f(a,b,c)=∑(2,3,5,6) =ab'c+a'b+bc' */
module solve(
    input a,
    input b,
    input c,
    output f
);
wire g;
mux2to1 mux1(
    .s(b),
    .d({~c,c}),
    .y(g)
);
mux2to1 mux2(
    .s(a),
    .d({g, b}),
    .y(f)
);
endmodule
module mux2to1(
    input s,
    input [1:0] d,
    output reg y
);
always @(*) 
begin
if(s==0)
    y=d[0];
else
    y=d[1];
end
endmodule