// ls7432.v
// 74LS32: Quad 2-Input OR Gates

module ls7432 (
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);

    assign y = a | b;

endmodule
