// RLS803.v
// 8-bit Logical Shift Register with variable shift amount and direction

module RLS803 (
    input [7:0] data_in,
    input [2:0] shift_amount,
    input direction,  // 0 for right shift, 1 for left shift
    input clk,
    input clear_n,
    output [7:0] data_out
);

    wire [7:0] stage1, stage2, stage3;
    wire [1:0] s;
    wire sil, sir;

    // Logic for shift direction
    assign s[1] = direction;
    assign s[0] = ~direction;
    assign sil = direction ? data_in[0] : 1'b0;
    assign sir = direction ? 1'b0 : data_in[7];

    // Two 74LS194 shift registers
    ls74194 lower_shift (
        .clk(clk),
        .clear_n(clear_n),
        .s(s),
        .p(data_in[3:0]),
        .sil(sil),
        .sir(data_in[4]),
        .q(stage1[3:0])
    );

    ls74194 upper_shift (
        .clk(clk),
        .clear_n(clear_n),
        .s(s),
        .p(data_in[7:4]),
        .sil(data_in[3]),
        .sir(sir),
        .q(stage1[7:4])
    );

    // Barrel shifter stages using RM802
    RM802 mux_stage1 (
        .a(stage1),
        .b({stage1[0], stage1[7:1]}),
        .select(shift_amount[0]),
        .enable_n(1'b0),
        .y(stage2)
    );

    RM802 mux_stage2 (
        .a(stage2),
        .b({stage2[1:0], stage2[7:2]}),
        .select(shift_amount[1]),
        .enable_n(1'b0),
        .y(stage3)
    );

    RM802 mux_stage3 (
        .a(stage3),
        .b({stage3[3:0], stage3[7:4]}),
        .select(shift_amount[2]),
        .enable_n(1'b0),
        .y(data_out)
    );

endmodule
