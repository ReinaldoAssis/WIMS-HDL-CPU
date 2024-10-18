// ls74157.v
// 74LS157: Quad 2-Line to 1-Line Data Selector/Multiplexer

module ls74157 (
    input [3:0] a,
    input [3:0] b,
    input select,
    input enable_n,
    output [3:0] y
);

    assign y = enable_n ? 4'b0000 : (select ? b : a);

endmodule
