module fulladder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
 
    assign sum = a ^ b ^ cin; // Sum is the XOR of a, b, and cin
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry out is generated if any two inputs are 1
endmodule    