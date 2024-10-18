// ls74194.v
// 74LS194: 4-bit Bidirectional Universal Shift Register

module ls74194 (
    input clk,
    input clear_n,
    input [1:0] s,
    input [3:0] p,
    input sil,
    input sir,
    output reg [3:0] q
);

    always @(posedge clk or negedge clear_n) begin
        if (!clear_n)
            q <= 4'b0000;
        else
            case (s)
                2'b00: q <= q;  // No change
                2'b01: q <= {sir, q[3:1]};  // Shift right
                2'b10: q <= {q[2:0], sil};  // Shift left
                2'b11: q <= p;  // Parallel load
            endcase
    end

endmodule
