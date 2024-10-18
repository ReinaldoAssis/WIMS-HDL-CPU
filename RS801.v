// RS801.v
// 8-bit Full Adder

module RS801 (
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    wire middle_carry;

    ls74283 lower_adder (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(middle_carry)
    );

    ls74283 upper_adder (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(middle_carry),
        .sum(sum[7:4]),
        .cout(cout)
    );

endmodule
