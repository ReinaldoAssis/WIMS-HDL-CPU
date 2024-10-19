`timescale 1ns / 1ps

module ls7402_tb;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] y;

    ls7402 uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test vector 1
        a = 4'b0000; b = 4'b0011;
        #10;

        if (y !== 4'b1100) begin
            $display("Unnamed Test failed for a=%b, b=%b. Expected y=%b, got y=%b", a, b, 4'b1100, y);
        end else begin
            $display("Unnamed Test passed for a=%b, b=%b. y=%b", a, b, y);
        end

        // Test vector 3
        a = 4'b1010; b = 4'b0110;
        #10;

        if (y !== 4'b0001) begin
            $display("Unnamed Test failed for a=%b, b=%b. Expected y=%b, got y=%b", a, b, 4'b0001, y);
        end else begin
            $display("Unnamed Test passed for a=%b, b=%b. y=%b", a, b, y);
        end

        $finish;
    end

endmodule
