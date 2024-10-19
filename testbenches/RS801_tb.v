`timescale 1ns / 1ps

module RS801_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg  cin;
    wire [7:0] sum;
    wire  cout;

    RS801 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test vector 1
        a = 8'b00101010; b = 8'b00010101; cin = 1'b0;
        #10;

        if (sum !== 8'b00111111 || cout !== 1'b0) begin
            $display("Test failed: Simple Addition failed for a=%b, b=%b, cin=%b. Expected sum=%b, cout=%b, got sum=%b, cout=%b", a, b, cin, 8'b00111111, 1'b0, sum, cout);
        end else begin
            $display("Test passed: Simple Addition passed for a=%b, b=%b, cin=%b. sum=%b, cout=%b", a, b, cin, sum, cout);
        end

        // Test vector 3
        a = 8'b11110000; b = 8'b00001111; cin = 1'b1;
        #10;

        if (sum !== 8'b00000000 || cout !== 1'b1) begin
            $display("Test failed: Addition with Carry In failed for a=%b, b=%b, cin=%b. Expected sum=%b, cout=%b, got sum=%b, cout=%b", a, b, cin, 8'b00000000, 1'b1, sum, cout);
        end else begin
            $display("Test passed: Addition with Carry In passed for a=%b, b=%b, cin=%b. sum=%b, cout=%b", a, b, cin, sum, cout);
        end

        // Test vector 5
        a = 8'b11111111; b = 8'b00000001; cin = 1'b0;
        #10;

        if (sum !== 8'b00000000 || cout !== 1'b1) begin
            $display("Test failed: Addition with Carry Out failed for a=%b, b=%b, cin=%b. Expected sum=%b, cout=%b, got sum=%b, cout=%b", a, b, cin, 8'b00000000, 1'b1, sum, cout);
        end else begin
            $display("Test passed: Addition with Carry Out passed for a=%b, b=%b, cin=%b. sum=%b, cout=%b", a, b, cin, sum, cout);
        end

        // Test vector 7
        a = 8'b11111111; b = 8'b11111111; cin = 1'b1;
        #10;

        if (sum !== 8'b11111111 || cout !== 1'b1) begin
            $display("Test failed: Maximum Value Addition failed for a=%b, b=%b, cin=%b. Expected sum=%b, cout=%b, got sum=%b, cout=%b", a, b, cin, 8'b11111111, 1'b1, sum, cout);
        end else begin
            $display("Test passed: Maximum Value Addition passed for a=%b, b=%b, cin=%b. sum=%b, cout=%b", a, b, cin, sum, cout);
        end

        $finish;
    end

endmodule
