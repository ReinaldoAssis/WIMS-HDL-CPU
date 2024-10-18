module RM802 (
    input [7:0] a,
    input [7:0] b,
    input select,
    input enable_n,
    output [7:0] y
);

    ls74157 lower_mux (
        .a(a[3:0]),
        .b(b[3:0]),
        .select(select),
        .enable_n(enable_n),
        .y(y[3:0])
    );

    ls74157 upper_mux (
        .a(a[7:4]),
        .b(b[7:4]),
        .select(select),
        .enable_n(enable_n),
        .y(y[7:4])
    );

endmodule
