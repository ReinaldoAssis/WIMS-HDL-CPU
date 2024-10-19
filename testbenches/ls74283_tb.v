`timescale 1ns / 1ps

module ls74283_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg  cin;
    wire [3:0] sum;
    wire  cout;

    ls74283 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test vector 1
        a = 4'b1010; b = 4'b0101; cin = 1'b0;
        #10;

        if (sum !== 4'b1111 || cout !== 1'b0) begin
            $display("Unnamed Test failed for a=%b, b=%b, cin=%b. Expected sum=%b, cout=%b, got sum=%b, cout=%b", a, b, cin, 4'b1111, 1'b0, sum, cout);
        end else begin
            $display("Unnamed Test passed for a=%b, b=%b, cin=%b. sum=%b, cout=%b", a, b, cin, sum, cout);
        end

        // Test vector 3
        a = 4'b1111; b = 4'b0001; cin = 1'b1;
        #10;

        if (sum !== 4'b0001 || cout !== 1'b1) begin
            $display("Unnamed Test failed for a=%b, b=%b, cin=%b. Expected sum=%b, cout=%b, got sum=%b, cout=%b", a, b, cin, 4'b0001, 1'b1, sum, cout);
        end else begin
            $display("Unnamed Test passed for a=%b, b=%b, cin=%b. sum=%b, cout=%b", a, b, cin, sum, cout);
        end

        $finish;
    end

endmodule
