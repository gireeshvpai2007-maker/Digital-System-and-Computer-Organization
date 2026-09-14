module bitaddsub4(input [3:0]a, input [3:0]b,input cin,output [3:0]sum,output cout);
wire [3:0]b_xor;
assign b_xor = b ^ cin;
bitadd addsub(.a(a),.b(b_xor),.cin(cin),.sum(sum),.cout(cout));
endmodule
module bitadd(input [3:0]a, input [3:0]b,input cin,output [3:0]sum,output cout);
assign {cout,sum} = a + b + cin;
endmodule