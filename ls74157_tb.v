`timescale 1ns / 1ps

module ls74157_tb;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg select;
    reg enable_n;

    // Outputs
    wire [3:0] y;

    // Instantiate the Unit Under Test (UUT)
    ls74157 uut (
        .a(a),
        .b(b),
        .select(select),
        .enable_n(enable_n),
        .y(y)
    );

    // Test vectors
    reg [13:0] test_vectors[15:0];
    integer i;

    initial begin
        // Initialize test vectors
        // Format: {a, b, select, enable_n, expected_y}
        test_vectors[0]  = 14'b0000_1111_0_0_0000; // Select A, enabled
        test_vectors[1]  = 14'b0000_1111_1_0_1111; // Select B, enabled
        test_vectors[2]  = 14'b1010_0101_0_0_1010; // Select A, enabled
        test_vectors[3]  = 14'b1010_0101_1_0_0101; // Select B, enabled
        test_vectors[4]  = 14'b1111_0000_0_0_1111; // Select A, enabled
        test_vectors[5]  = 14'b1111_0000_1_0_0000; // Select B, enabled
        test_vectors[6]  = 14'b0101_1010_0_0_0101; // Select A, enabled
        test_vectors[7]  = 14'b0101_1010_1_0_1010; // Select B, enabled
        test_vectors[8]  = 14'b0000_1111_0_1_0000; // Select A, disabled
        test_vectors[9]  = 14'b0000_1111_1_1_0000; // Select B, disabled
        test_vectors[10] = 14'b1010_0101_0_1_0000; // Select A, disabled
        test_vectors[11] = 14'b1010_0101_1_1_0000; // Select B, disabled
        test_vectors[12] = 14'b1111_0000_0_1_0000; // Select A, disabled
        test_vectors[13] = 14'b1111_0000_1_1_0000; // Select B, disabled
        test_vectors[14] = 14'b0101_1010_0_1_0000; // Select A, disabled
        test_vectors[15] = 14'b0101_1010_1_1_0000; // Select B, disabled

        // Apply test vectors
        for (i = 0; i < 16; i = i + 1) begin
            {a, b, select, enable_n} = test_vectors[i][13:2];
            #10; // Wait for 10 ns
            if (y !== test_vectors[i][3:0]) begin
                $display("Test failed for a=%b, b=%b, select=%b, enable_n=%b. Expected y=%b, got y=%b",
                         a, b, select, enable_n, test_vectors[i][3:0], y);
            end else begin
                $display("Test passed for a=%b, b=%b, select=%b, enable_n=%b. y=%b",
                         a, b, select, enable_n, y);
            end
        end

        $finish;
    end

endmodule
