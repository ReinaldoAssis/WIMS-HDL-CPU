`timescale 1ns / 1ps

module ls7400_tb;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;

    // Outputs
    wire [3:0] y;

    // Instantiate the Unit Under Test (UUT)
    ls7400 uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Test vectors
    reg [11:0] test_vectors[15:0];
    integer i;

    initial begin
        // Initialize test vectors
        test_vectors[0]  = 12'b0000_0011_1111;
        test_vectors[1]  = 12'b0001_0111_1110;
        test_vectors[2]  = 12'b0010_0110_1101;
        test_vectors[3]  = 12'b0011_0110_1101;
        test_vectors[4]  = 12'b0100_0101_1011;
        test_vectors[5]  = 12'b0101_0101_1010;
        test_vectors[6]  = 12'b0110_0100_1011;
        test_vectors[7]  = 12'b0111_0100_1011;
        test_vectors[8]  = 12'b1000_0011_1111;
        test_vectors[9]  = 12'b1001_0111_1110;
        test_vectors[10] = 12'b1010_0110_1101;
        test_vectors[11] = 12'b1011_0110_1101;
        test_vectors[12] = 12'b1100_0101_1011;
        test_vectors[13] = 12'b1101_0101_1010;
        test_vectors[14] = 12'b1110_0100_1011;
        test_vectors[15] = 12'b1111_0100_1011;

        // Apply test vectors
        for (i = 0; i < 16; i = i + 1) begin
            {a, b} = test_vectors[i][11:4];
            #10; // Wait for 10 ns
            if (y !== test_vectors[i][3:0]) begin
                $display("Test failed for a=%b, b=%b. Expected y=%b, got y=%b", a, b, test_vectors[i][3:0], y);
            end else begin
                $display("Test passed for a=%b, b=%b. y=%b", a, b, y);
            end
        end

        $finish;
    end

endmodule
