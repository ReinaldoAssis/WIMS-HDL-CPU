from test import create_testbench
import os

def basic_tests(tb_dir):
    # Testbench for ls7402 (NOR gate)
    def ls7402_model(a, b):
        # Perform NOR operation
        result = ~(a | b) & 0xF  # Mask to 4 bits
        # Convert result back to Verilog format string
        return {"y": f"4'b{result:04b}"}

    tb = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls7402.v"))
    tb.set_golden_model(ls7402_model)
    tb.set_inputs(a="4'b0000", b="4'b0011")
    tb.assert_outputs()
    tb.set_inputs(a="4'b1010", b="4'b0110")
    tb.assert_outputs()
    tb.output_verilog(os.path.join(tb_dir, "ls7402_tb.v"))

    # Testbench for ls74157 (Quad 2-to-1 multiplexer)
    def ls74157_model(a, b, select, enable_n):
        # Perform multiplexer operation
        if enable_n:
            result = 0
        else:
            result = b if select else a
        # Convert result back to Verilog format string
        return {"y": f"4'b{result:04b}"}

    tb_74157 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls74157.v"))
    tb_74157.set_golden_model(ls74157_model)
    
    # Test case 1: select = 0, enable_n = 0
    tb_74157.set_inputs(a="4'b1010", b="4'b0101", select="1'b0", enable_n="1'b0")
    tb_74157.assert_outputs()
    
    # Test case 2: select = 1, enable_n = 0
    tb_74157.set_inputs(a="4'b1010", b="4'b0101", select="1'b1", enable_n="1'b0")
    tb_74157.assert_outputs()
    
    # Test case 3: enable_n = 1 (output should be all zeros)
    tb_74157.set_inputs(a="4'b1010", b="4'b0101", select="1'b0", enable_n="1'b1")
    tb_74157.assert_outputs()
    
    # Test case 4: enable_n = 1 (output should be all zeros regardless of select)
    tb_74157.set_inputs(a="4'b1010", b="4'b0101", select="1'b1", enable_n="1'b1")
    tb_74157.assert_outputs()
    
    # Generate the Verilog testbench file
    tb_74157.output_verilog(os.path.join(tb_dir, "ls74157_tb.v"))

    # Testbench for ls7408 (AND gate)
    def ls7408_model(a, b):
        # Perform AND operation
        result = a & b
        # Convert result back to Verilog format string
        return {"y": f"4'b{result:04b}"}

    tb_7408 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls7408.v"))
    tb_7408.set_golden_model(ls7408_model)
    tb_7408.set_inputs(a="4'b1010", b="4'b1100")
    tb_7408.assert_outputs()
    tb_7408.set_inputs(a="4'b1111", b="4'b0101")
    tb_7408.assert_outputs()
    tb_7408.output_verilog(os.path.join(tb_dir, "ls7408_tb.v"))

    # Testbench for ls7432 (OR gate)
    def ls7432_model(a, b):
        # Perform OR operation
        result = a | b
        # Convert result back to Verilog format string
        return {"y": f"4'b{result:04b}"}

    tb_7432 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls7432.v"))
    tb_7432.set_golden_model(ls7432_model)
    tb_7432.set_inputs(a="4'b1010", b="4'b0101")
    tb_7432.assert_outputs()
    tb_7432.set_inputs(a="4'b1100", b="4'b0011")
    tb_7432.assert_outputs()
    tb_7432.output_verilog(os.path.join(tb_dir, "ls7432_tb.v"))

    # Testbench for ls7486 (XOR gate)
    def ls7486_model(a, b):
        # Perform XOR operation
        result = a ^ b
        # Convert result back to Verilog format string
        return {"y": f"4'b{result:04b}"}

    tb_7486 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls7486.v"))
    tb_7486.set_golden_model(ls7486_model)
    tb_7486.set_inputs(a="4'b1010", b="4'b0101")
    tb_7486.assert_outputs()
    tb_7486.set_inputs(a="4'b1111", b="4'b1010")
    tb_7486.assert_outputs()
    tb_7486.output_verilog(os.path.join(tb_dir, "ls7486_tb.v"))

    # Testbench for ls7404 (NOT gate)
    def ls7404_model(a):
        # Perform NOT operation
        result = ~a & 0b111111  # Mask to keep only 6 bits
        # Convert result back to Verilog format string
        return {"y": f"6'b{result:06b}"}

    tb_7404 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls7404.v"))
    tb_7404.set_golden_model(ls7404_model)
    tb_7404.set_inputs(a="4'b1010")
    tb_7404.assert_outputs()
    tb_7404.set_inputs(a="4'b0101")
    tb_7404.assert_outputs()
    tb_7404.output_verilog(os.path.join(tb_dir, "ls7404_tb.v"))

    # Testbench for ls74194 (4-Bit Bidirectional Universal Shift Register)
    tb_74194 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls74194.v"))
    tb_74194.auto_wait = False

    # Test case 1: Clear operation
    tb_74194.test_name("Clear Operation")
    tb_74194.set_inputs(p="4'b1010", s="2'b00", sir="1'b0", sil="1'b0", clear_n="1'b0")
    tb_74194.drive_signal("clk", "1'b0")
    tb_74194.wait(5)
    tb_74194.drive_signal("clk", "1'b1")
    tb_74194.wait(5)
    tb_74194.assert_outputs(q="4'b0000")

    # Test case 2: Load operation
    tb_74194.test_name("Load Operation")
    tb_74194.set_inputs(p="4'b1010", s="2'b11", sir="1'b0", sil="1'b0", clear_n="1'b1")
    tb_74194.drive_signal("clk", "1'b0")
    tb_74194.wait(5)
    tb_74194.drive_signal("clk", "1'b1")
    tb_74194.wait(5)
    tb_74194.assert_outputs(q="4'b1010")

    # Test case 3: Shift right operation
    tb_74194.test_name("Shift Right Operation")
    tb_74194.set_inputs(s="2'b01", sir="1'b0", sil="1'b0", clear_n="1'b1")
    tb_74194.drive_signal("clk", "1'b0")
    tb_74194.wait(5)
    tb_74194.drive_signal("clk", "1'b1")
    tb_74194.wait(5)
    tb_74194.assert_outputs(q="4'b0101")

    # Test case 4: Shift left operation
    tb_74194.test_name("Shift Left Operation")
    tb_74194.set_inputs(s="2'b10", sir="1'b0", sil="1'b1", clear_n="1'b1")
    tb_74194.drive_signal("clk", "1'b0")
    tb_74194.wait(5)
    tb_74194.drive_signal("clk", "1'b1")
    tb_74194.wait(5)
    tb_74194.assert_outputs(q="4'b1011")

    # Test case 5: Hold operation
    tb_74194.test_name("Hold Operation")
    tb_74194.set_inputs(s="2'b00", sir="1'b0", sil="1'b0", clear_n="1'b1")
    tb_74194.drive_signal("clk", "1'b0")
    tb_74194.wait(5)
    tb_74194.drive_signal("clk", "1'b1")
    tb_74194.wait(5)
    tb_74194.assert_outputs(q="4'b1011")

    tb_74194.output_verilog(os.path.join(tb_dir, "ls74194_tb.v"))

    # Testbench for ls74283 (4-Bit Binary Full Adder)
    def ls74283_model(a, b, cin):
        result = a + b + cin
        sum_result = result & 0xF
        cout = 1 if result > 15 else 0
        return {"sum": f"4'b{sum_result:04b}", "cout": f"1'b{cout}"}

    tb_74283 = create_testbench(os.path.join(os.path.dirname(tb_dir), "ls74283.v"))
    tb_74283.set_golden_model(ls74283_model)
    tb_74283.set_inputs(a="4'b1010", b="4'b0101", cin="1'b0")
    tb_74283.assert_outputs()
    tb_74283.set_inputs(a="4'b1111", b="4'b0001", cin="1'b1")
    tb_74283.assert_outputs()
    tb_74283.output_verilog(os.path.join(tb_dir, "ls74283_tb.v"))

    # Testbench for RLS803 (8-bit Logical Shift Register)
    def rls803_model(data_in, shift_amount, direction, clear_n):
        if not clear_n:
            return {"data_out": "8'b00000000"}
        
        # Handle both string and integer inputs
        if isinstance(data_in, str):
            data = int(data_in[2:], 2)
        else:
            data = data_in
        
        if isinstance(shift_amount, str):
            shift = int(shift_amount[2:], 2)
        else:
            shift = shift_amount
        
        if isinstance(direction, str):
            direction = int(direction[2:], 2)
        
        if direction == 1:  # Left shift
            result = (data << shift) & 0xFF
        else:  # Right shift
            result = data >> shift
        
        return {"data_out": f"8'b{result:08b}"}

    tb_rls803 = create_testbench(os.path.join(os.path.dirname(tb_dir), "RLS803.v"))
    tb_rls803.set_golden_model(rls803_model)

    # Test case 1: No shift
    tb_rls803.test_name("No Shift")
    tb_rls803.set_inputs(data_in="8'b10101010", shift_amount="3'b000", direction="1'b0", clear_n="1'b1")
    tb_rls803.assert_outputs()

    # Test case 2: Right shift by 2
    tb_rls803.test_name("Right Shift by 2")
    tb_rls803.set_inputs(data_in="8'b10101010", shift_amount="3'b010", direction="1'b0", clear_n="1'b1")
    tb_rls803.assert_outputs()

    # Test case 3: Left shift by 3
    tb_rls803.test_name("Left Shift by 3")
    tb_rls803.set_inputs(data_in="8'b10101010", shift_amount="3'b011", direction="1'b1", clear_n="1'b1")
    tb_rls803.assert_outputs()

    # Test case 4: Clear operation
    tb_rls803.test_name("Clear Operation")
    tb_rls803.set_inputs(data_in="8'b11111111", shift_amount="3'b000", direction="1'b0", clear_n="1'b0")
    tb_rls803.assert_outputs()

    # Test case 5: Maximum left shift
    tb_rls803.test_name("Maximum Left Shift")
    tb_rls803.set_inputs(data_in="8'b10101010", shift_amount="3'b111", direction="1'b1", clear_n="1'b1")
    tb_rls803.assert_outputs()

    tb_rls803.output_verilog(os.path.join(tb_dir, "RLS803_tb.v"))
