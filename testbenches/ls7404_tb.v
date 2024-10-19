`timescale 1ns / 1ps

module ls7404_tb;

    reg [5:0] a;
    wire [5:0] y;

    ls7404 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test vector 1
        a = 4'b1010;
        #10;

        if (y !== 6'b110101) begin
            $display("Test failed for a=%b. Expected y=%b, got y=%b", a, 6'b110101, y);
        end else begin
            $display("Test passed for a=%b. y=%b", a, y);
        end

        // Test vector 3
        a = 4'b0101;
        #10;

        if (y !== 6'b111010) begin
            $display("Test failed for a=%b. Expected y=%b, got y=%b", a, 6'b111010, y);
        end else begin
            $display("Test passed for a=%b. y=%b", a, y);
        end

        $finish;
    end

endmodule
