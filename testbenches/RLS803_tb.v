`timescale 1ns / 1ps

module RLS803_tb;

    reg [7:0] data_in;
    reg [2:0] shift_amount;
    reg  direction;
    reg  clk;
    reg  clear_n;
    wire [7:0] data_out;

    RLS803 uut (
        .data_in(data_in),
        .shift_amount(shift_amount),
        .direction(direction),
        .clk(clk),
        .clear_n(clear_n),
        .data_out(data_out)
    );

    initial begin
        // Test vector 1
        data_in = 8'b11111111; shift_amount = 3'b000; direction = 1'b0; clear_n = 1'b0;

        clk = 1'b0;

        #5;

        clk = 1'b1;

        #5;

        if (data_out !== 8'b00000000) begin
            $display("Test failed: Clear Operation failed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. Expected data_out=%b, got data_out=%b", data_in, shift_amount, direction, clk, clear_n, 8'b00000000, data_out);
        end else begin
            $display("Test passed: Clear Operation passed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. data_out=%b", data_in, shift_amount, direction, clk, clear_n, data_out);
        end

        // Test vector 7
        data_in = 8'b10101010; shift_amount = 3'b000; direction = 1'b0; clear_n = 1'b1;

        clk = 1'b0;

        #10;

        clk = 1'b1;

        #10;

        if (data_out !== 8'b10101010) begin
            $display("Test failed: Load Operation failed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. Expected data_out=%b, got data_out=%b", data_in, shift_amount, direction, clk, clear_n, 8'b10101010, data_out);
        end else begin
            $display("Test passed: Load Operation passed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. data_out=%b", data_in, shift_amount, direction, clk, clear_n, data_out);
        end

        // Test vector 13
        shift_amount = 3'b010; direction = 1'b0; clear_n = 1'b1;

        clk = 1'b0;

        #5;

        clk = 1'b1;

        #5;

        if (data_out !== 8'b00101010) begin
            $display("Test failed: Right Shift by 2 failed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. Expected data_out=%b, got data_out=%b", data_in, shift_amount, direction, clk, clear_n, 8'b00101010, data_out);
        end else begin
            $display("Test passed: Right Shift by 2 passed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. data_out=%b", data_in, shift_amount, direction, clk, clear_n, data_out);
        end

        // Test vector 19
        shift_amount = 3'b011; direction = 1'b1; clear_n = 1'b1;

        clk = 1'b0;

        #5;

        clk = 1'b1;

        #5;

        if (data_out !== 8'b01010000) begin
            $display("Test failed: Left Shift by 3 failed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. Expected data_out=%b, got data_out=%b", data_in, shift_amount, direction, clk, clear_n, 8'b01010000, data_out);
        end else begin
            $display("Test passed: Left Shift by 3 passed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. data_out=%b", data_in, shift_amount, direction, clk, clear_n, data_out);
        end

        // Test vector 25
        shift_amount = 3'b000; direction = 1'b0; clear_n = 1'b1;

        clk = 1'b0;

        #5;

        clk = 1'b1;

        #5;

        if (data_out !== 8'b01010000) begin
            $display("Test failed: Hold Operation failed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. Expected data_out=%b, got data_out=%b", data_in, shift_amount, direction, clk, clear_n, 8'b01010000, data_out);
        end else begin
            $display("Test passed: Hold Operation passed for data_in=%b, shift_amount=%b, direction=%b, clk=%b, clear_n=%b. data_out=%b", data_in, shift_amount, direction, clk, clear_n, data_out);
        end

        $finish;
    end

endmodule
