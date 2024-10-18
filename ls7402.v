// ls7402.v
// 74LS02: Quad 2-Input NOR Gates

module ls7402 (
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);

    assign y = ~(a | b);

endmodule
