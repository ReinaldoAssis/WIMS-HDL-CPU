`timescale 1ns / 1ps

module ls74194_tb;

    reg  clk;
    reg  clear_n;
    reg [1:0] s;
    reg [3:0] p;
    reg  sil;
    reg  sir;
    wire [3:0] q;

    ls74194 uut (
        .clk(clk),
        .clear_n(clear_n),
        .s(s),
        .p(p),
        .sil(sil),
        .sir(sir),
        .q(q)
    );

    initial begin
        // Test vector 1
        p = 4'b1010; s = 2'b00; sir = 1'b0; sil = 1'b0; clk = 1'b1; clear_n = 1'b0;
        #10;

        if (q !== 4'b0000) begin
            $display("Test failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b0000, q);
        end else begin
            $display("Test passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 3
        p = 4'b1010; s = 2'b11; sir = 1'b0; sil = 1'b0; clk = 1'b1; clear_n = 1'b1;
        #10;

        if (q !== 4'b1010) begin
            $display("Test failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b1010, q);
        end else begin
            $display("Test passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 5
        p = 4'b1010; s = 2'b01; sir = 1'b0; sil = 1'b0; clk = 1'b1; clear_n = 1'b1;
        #10;

        if (q !== 4'b0101) begin
            $display("Test failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b0101, q);
        end else begin
            $display("Test passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 7
        p = 4'b1010; s = 2'b10; sir = 1'b0; sil = 1'b1; clk = 1'b1; clear_n = 1'b1;
        #10;

        if (q !== 4'b0101) begin
            $display("Test failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b0101, q);
        end else begin
            $display("Test passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 9
        p = 4'b1010; s = 2'b00; sir = 1'b0; sil = 1'b0; clk = 1'b1; clear_n = 1'b1;
        #10;

        if (q !== 4'b1010) begin
            $display("Test failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b1010, q);
        end else begin
            $display("Test passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        $finish;
    end

endmodule
