// ls7404.v
// 74LS04: Hex Inverter

module ls7404 (
    input [5:0] a,
    output [5:0] y
);

    assign y = ~a;

endmodule
