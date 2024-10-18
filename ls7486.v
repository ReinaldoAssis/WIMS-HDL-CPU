// ls7486.v
// 74LS86: Quad 2-Input XOR Gates

module ls7486 (
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);

    assign y = a ^ b;

endmodule
