`timescale 1ns / 1ps

module RM802_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg  select;
    reg  enable_n;
    wire [7:0] y;

    RM802 uut (
        .a(a),
        .b(b),
        .select(select),
        .enable_n(enable_n),
        .y(y)
    );

    initial begin
        // Test vector 1
        a = 8'b10101010; b = 8'b01010101; select = 1'b0; enable_n = 1'b0;
        #10;

        if (y !== 8'b10101010) begin
            $display("Test failed: Select A failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 8'b10101010, y);
        end else begin
            $display("Test passed: Select A passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        // Test vector 3
        a = 8'b10101010; b = 8'b01010101; select = 1'b1; enable_n = 1'b0;
        #10;

        if (y !== 8'b01010101) begin
            $display("Test failed: Select B failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 8'b01010101, y);
        end else begin
            $display("Test passed: Select B passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        // Test vector 5
        a = 8'b10101010; b = 8'b01010101; select = 1'b0; enable_n = 1'b1;
        #10;

        if (y !== 8'b00000000) begin
            $display("Test failed: Disabled Output failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 8'b00000000, y);
        end else begin
            $display("Test passed: Disabled Output passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        // Test vector 7
        a = 8'b11110000; b = 8'b00001111; select = 1'b0; enable_n = 1'b0;
        #10;

        if (y !== 8'b11110000) begin
            $display("Test failed: Different Inputs failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b", a, b, select, enable_n, 8'b11110000, y);
        end else begin
            $display("Test passed: Different Inputs passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b", a, b, select, enable_n, y);
        end

        $finish;
    end

endmodule
