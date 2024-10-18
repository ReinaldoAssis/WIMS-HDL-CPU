import os
import subprocess
import re
from colorama import init, Fore, Style

# Initialize colorama for cross-platform colored output
init()

def print_banner():
    banner = f"""{Fore.BLUE}
██     ██ ██ ███    ███ ███████      ██████ ██████  ██    ██ 
██     ██ ██ ████  ████ ██          ██      ██   ██ ██    ██ 
██  █  ██ ██ ██ ████ ██ ███████     ██      ██████  ██    ██ 
██ ███ ██ ██ ██  ██  ██      ██     ██      ██      ██    ██ 
 ███ ███  ██ ██      ██ ███████      ██████ ██       ██████  
                                                             
                                                             
    {Style.RESET_ALL}"""
    print(banner)

def find_testbenches():
    return [file for file in os.listdir('.') if file.endswith('_tb.v')]

def run_testbench(testbench):
    print(f"{Fore.YELLOW}[{testbench}] {Fore.BLUE}Compiling...{Style.RESET_ALL}")
    
    compile_command = f"iverilog -o {testbench[:-2]} {testbench[:-5]}.v {testbench}"
    compile_result = subprocess.run(compile_command, shell=True, capture_output=True, text=True)
    
    if compile_result.returncode != 0:
        print(f"{Fore.RED}[{testbench}] Compilation failed:{Style.RESET_ALL}")
        print(compile_result.stderr)
        return False
    
    print(f"{Fore.YELLOW}[{testbench}] {Fore.BLUE}Running...{Style.RESET_ALL}")
    run_command = f"vvp {testbench[:-2]}"
    run_result = subprocess.run(run_command, shell=True, capture_output=True, text=True)
    
    if run_result.returncode != 0:
        print(f"{Fore.RED}[{testbench}] Execution failed:{Style.RESET_ALL}")
        print(run_result.stderr)
        return False
    
    output = run_result.stdout
    passed_tests = len(re.findall(r"Test passed", output))
    failed_tests = len(re.findall(r"Test failed", output))
    
    print(f"{Fore.YELLOW}[{testbench}] {Fore.GREEN}Passed: {passed_tests} {Fore.RED}Failed: {failed_tests}{Style.RESET_ALL}")
    
    if failed_tests > 0:
        print(f"{Fore.RED}[{testbench}] Failed tests details:{Style.RESET_ALL}")
        for line in output.split('\n'):
            if "Test failed" in line:
                print(f"  {Fore.RED}✗ {line}{Style.RESET_ALL}")
        return False
    
    return True

def main():
    print_banner()
    
    testbenches = find_testbenches()
    
    if not testbenches:
        print(f"{Fore.YELLOW}No testbenches found.{Style.RESET_ALL}")
        return
    
    all_passed = True
    total_tests = len(testbenches)
    passed_tests = 0
    
    for testbench in testbenches:
        if run_testbench(testbench):
            passed_tests += 1
        else:
            all_passed = False
        print()  # Add a blank line between testbench results
    
    print(f"{Fore.CYAN}{'=' * 40}{Style.RESET_ALL}")
    if all_passed:
        print(f"{Fore.GREEN}All testbenches passed successfully! 🎉{Style.RESET_ALL}")
    else:
        print(f"{Fore.YELLOW}Some testbenches failed. Please check the output above for details.{Style.RESET_ALL}")
    print(f"{Fore.CYAN}Summary: {Fore.GREEN}{passed_tests}/{total_tests} passed{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'=' * 40}{Style.RESET_ALL}")

if __name__ == "__main__":
    main()
