module Solution1(input [3:0] x, output f);
wire a,b,c,d,g,h;

and(a,x[0],x[2]);
and(b,x[1],x[3]);
or(g,a,b);

or(c,x[0],~x[2]);
or(d,~x[1],x[3]);
and(h,c,d);

or(f,g,h);

endmodule

