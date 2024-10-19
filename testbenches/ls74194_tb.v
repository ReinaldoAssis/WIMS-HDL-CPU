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
        p = 4'b1010; s = 2'b00; sir = 1'b0; sil = 1'b0; clear_n = 1'b0;
        #10;

        clk = 1'b0;

        #(5);

        clk = 1'b1;

        #(5);

        if (q !== 4'b0000) begin
            $display("Test failed: Clear Operation failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b0000, q);
        end else begin
            $display("Test passed: Clear Operation passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 7
        p = 4'b1010; s = 2'b11; sir = 1'b0; sil = 1'b0; clear_n = 1'b1;
        #10;

        clk = 1'b0;

        #(5);

        clk = 1'b1;

        #(5);

        if (q !== 4'b1010) begin
            $display("Test failed: Load Operation failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b1010, q);
        end else begin
            $display("Test passed: Load Operation passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 13
        p = 4'b1010; s = 2'b01; sir = 1'b0; sil = 1'b0; clear_n = 1'b1;
        #10;

        clk = 1'b0;

        #(5);

        clk = 1'b1;

        #(5);

        if (q !== 4'b0101) begin
            $display("Test failed: Shift Right Operation failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b0101, q);
        end else begin
            $display("Test passed: Shift Right Operation passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 19
        p = 4'b1010; s = 2'b10; sir = 1'b0; sil = 1'b1; clear_n = 1'b1;
        #10;

        clk = 1'b0;

        #(10);

        clk = 1'b1;

        #(10);

        if (q !== 4'b0101) begin
            $display("Test failed: Shift Left Operation failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b0101, q);
        end else begin
            $display("Test passed: Shift Left Operation passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        // Test vector 25
        p = 4'b1010; s = 2'b00; sir = 1'b0; sil = 1'b0; clear_n = 1'b1;
        #10;

        clk = 1'b0;

        #(5);

        clk = 1'b1;

        #(5);

        if (q !== 4'b1010) begin
            $display("Test failed: Hold Operation failed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. Expected q=%b, got q=%b", clk, clear_n, s, p, sil, sir, 4'b1010, q);
        end else begin
            $display("Test passed: Hold Operation passed for clk=%b, clear_n=%b, s=%b, p=%b, sil=%b, sir=%b. q=%b", clk, clear_n, s, p, sil, sir, q);
        end

        $finish;
    end

endmodule
