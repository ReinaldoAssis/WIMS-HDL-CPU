// ls7408.v
// 74LS08: Quad 2-Input AND Gates

module ls7408 (
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);

    assign y = a & b;

endmodule
