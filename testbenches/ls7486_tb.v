`timescale 1ns / 1ps

module ls7486_tb;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] y;

    ls7486 uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test vector 1
        a = 4'b1010; b = 4'b0101;
        #10;

        if (y !== 4'b1111) begin
            $display("Unnamed Test failed for a=%b, b=%b. Expected y=%b, got y=%b", a, b, 4'b1111, y);
        end else begin
            $display("Unnamed Test passed for a=%b, b=%b. y=%b", a, b, y);
        end

        // Test vector 3
        a = 4'b1111; b = 4'b1010;
        #10;

        if (y !== 4'b0101) begin
            $display("Unnamed Test failed for a=%b, b=%b. Expected y=%b, got y=%b", a, b, 4'b0101, y);
        end else begin
            $display("Unnamed Test passed for a=%b, b=%b. y=%b", a, b, y);
        end

        $finish;
    end

endmodule
