`timescale 1ns / 1ps

module ls74157_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg  select;
    reg  enable_n;
    wire [3:0] y;

    ls74157 uut (
        .a(a),
        .b(b),
        .select(select),
        .enable_n(enable_n),
        .y(y)
    );

    initial begin
        // Test vector 1
        a = 4'b1010; b = 4'b0101; select = 1'b0; enable_n = 1'b0;
        #10;

        if (y !== 4'b1010) begin
            $display("Test failed: Unnamed Test failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 4'b1010, y);
        end else begin
            $display("Test passed: Unnamed Test passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        // Test vector 3
        a = 4'b1010; b = 4'b0101; select = 1'b1; enable_n = 1'b0;
        #10;

        if (y !== 4'b0101) begin
            $display("Test failed: Unnamed Test failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 4'b0101, y);
        end else begin
            $display("Test passed: Unnamed Test passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        // Test vector 5
        a = 4'b1010; b = 4'b0101; select = 1'b0; enable_n = 1'b1;
        #10;

        if (y !== 4'b0000) begin
            $display("Test failed: Unnamed Test failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 4'b0000, y);
        end else begin
            $display("Test passed: Unnamed Test passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        // Test vector 7
        a = 4'b1010; b = 4'b0101; select = 1'b1; enable_n = 1'b1;
        #10;

        if (y !== 4'b0000) begin
            $display("Test failed: Unnamed Test failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 4'b0000, y);
        end else begin
            $display("Test passed: Unnamed Test passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        $finish;
    end

endmodule
