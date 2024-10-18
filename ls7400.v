// ls7400.v
// 74LS00: Quad 2-Input NAND Gates

module ls7400 (
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
);

    assign y = ~(a & b);

endmodule
