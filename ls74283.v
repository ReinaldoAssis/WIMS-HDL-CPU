// ls74283.v
// 74LS283: 4-bit Binary Full Adder with Fast Carry

module ls74283 (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    assign {cout, sum} = a + b + cin;

endmodule
