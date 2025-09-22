import struct
import time
from typing import Union, Tuple

# Uncomment if HW
from pynq import Overlay, MMIO

class PYNQFPUInterface:
    """
    Interface class for PYNQ FPU hardware control.
    
    Memory Map:
    - 0x00: Instruction register (8'b0, ins[23:0])
    - 0x04: dbus_low (dbus[31:0]) 
    - 0x08: dbus_high (dbus[63:32])
    - 0x0C: result_low (also connected here)
    - 0x10: result_low (result[31:0])
    - 0x14: result_high (result[63:32])
    - 0x18: bus1 (fex, flags, draddr, wraddr)
    - 0x1C: wrdata_low (wrdata[31:0]) 
    - 0x20: wrdata_high (wrdata[63:32])
    
    Note : To achieve clock configurability, you have to change frequency in the ZQYN7 PS settings.
    """
    
    # Memory offsets
    OFFSET_INSTRUCTION = 0x00
    OFFSET_DBUS_LOW = 0x04
    OFFSET_DBUS_HIGH = 0x08
    OFFSET_RESULT_LOW = 0x10
    OFFSET_RESULT_HIGH = 0x14
    OFFSET_BUS1 = 0x18
    OFFSET_WRDATA_LOW = 0x1C
    OFFSET_WRDATA_HIGH = 0x20
    
    # Opcodes
    OPCODES = {
        'FADD_S': 0b00100,  'FSUB_S': 0b00010,  'FMUL_S': 0b00001,
        'FADD_D': 0b10100,  'FSUB_D': 0b10010,  'FMUL_D': 0b10001,
        'FLD_S':  0b01100,  'FSD_S':  0b01010,  'FCMP_S': 0b01001,
        'FLD_D':  0b11100,  'FSD_D':  0b11010,  'FCMP_D': 0b11001,
    }
    
    # Float and Double Constants for tests
    FLOAT_CONSTANTS = {
        'FLOAT_1_0': 0x3F800000, 'FLOAT_2_0': 0x40000000, 'FLOAT_3_0': 0x40400000,
        'FLOAT_0_5': 0x3F000000, 'FLOAT_NEG_1': 0xBF800000, 'FLOAT_ZERO': 0x00000000,
        'FLOAT_1_5': 0x3FC00000,
    }
    
    DOUBLE_CONSTANTS = {
        'DOUBLE_1_0': 0x3FF0000000000000, 'DOUBLE_2_0': 0x4000000000000000,
        'DOUBLE_3_0': 0x4008000000000000, 'DOUBLE_0_5': 0x3FE0000000000000,
        'DOUBLE_NEG_1': 0xBFF0000000000000, 'DOUBLE_ZERO': 0x0000000000000000,
    }
    
    def __init__(self, bitstream_path: str = "pynq_fpu.bit", base_address: int = 0x43C00000):
        """
        Initialize the FPU interface.
        
        Args:
            bitstream_path: Path to the FPGA bitstream file
            base_address: Base address of the MMIO region [get from Address Editor in Vivado]
        """
        self.base_address = base_address
        
        # For HW, uncomment below
        self.overlay = Overlay(bitstream_path)
        self.mmio = MMIO(base_address, 0x1000)  # 4KB address space
        
        # For simulation/testing, create a mock MMIO [if no hw, uncomment below]
        # self.mmio = self._create_mock_mmio()
        
        print(f"FPU Interface initialized at base address: 0x{base_address:08X}")
        
    def _create_mock_mmio(self):
        """Create a mock MMIO object for testing without hardware."""
        class MockMMIO:
            def __init__(self):
                self.registers = {}
                
            def write(self, offset, value):
                print(f"MMIO Write: offset=0x{offset:02X}, value=0x{value:08X}")
                self.registers[offset] = value & 0xFFFFFFFF
                
            def read(self, offset):
                value = self.registers.get(offset, 0)
                print(f"MMIO Read:  offset=0x{offset:02X}, value=0x{value:08X}")
                return value
                
        return MockMMIO()
    
    def write_instruction(self, instruction: int):
        """Writes input instruction at instruction register"""
        masked_instruction = instruction & 0xFFFFFF
        self.mmio.write(self.OFFSET_INSTRUCTION, masked_instruction)
        print(f"Instruction written: 0x{masked_instruction:06X}")
    
    def write_dbus(self, data: int):
        """Write doubleword to dbus register, which is accessed by load instruction."""
        low = data & 0xFFFFFFFF
        high = (data >> 32) & 0xFFFFFFFF
        self.mmio.write(self.OFFSET_DBUS_LOW, low)
        self.mmio.write(self.OFFSET_DBUS_HIGH, high)
        print(f"dbus written: 0x{data:016X} (high=0x{high:08X}, low=0x{low:08X})")
    
    def read_result(self) -> int:
        """Result is the input of regfile at any instant. So, read at the right time, is the output"""
        low = self.mmio.read(self.OFFSET_RESULT_LOW)
        high = self.mmio.read(self.OFFSET_RESULT_HIGH)
        result = (high << 32) | low
        print(f"Result read: 0x{result:016X}")
        return result
    
    def read_status(self) -> dict:
        """Read status information from bus1."""
        bus1 = self.mmio.read(self.OFFSET_BUS1)
        status = {
            'fex': (bus1 >> 29) & 0x7,      # Exception flags [31:29]
            'flags': (bus1 >> 26) & 0x7,    # Comparison flags [28:26]  
            'draddr': (bus1 >> 17) & 0x1FF, # Data read address [25:17]
            'wraddr': (bus1 >> 8) & 0x1FF,  # Write address [16:8]
            'raw_bus1': bus1
        }
        return status
    
    def read_wrdata(self) -> int:
        """ Read output written by store instruction"""
        low = self.mmio.read(self.OFFSET_WRDATA_LOW)
        high = self.mmio.read(self.OFFSET_WRDATA_HIGH)
        wrdata = (high << 32) | low
        print(f"Write data read: 0x{wrdata:016X}")
        return wrdata
    
    def wait_cycles(self, cycles: int):
        """Wait for specified number of clock cycles"""
        wait_time = cycles * 0.005  # assumption is 50MHz clock
        time.sleep(wait_time)
        print(f"Waited {cycles} cycles ({wait_time*1000:.1f}ms)")
    
    # Instruction encoding methods
    def encode_r_type(self, opcode: str, rs1: int, rs2: int, rd: int) -> int:
        """Encode R-type instruction."""
        if opcode not in self.OPCODES:
            raise ValueError(f"Unknown opcode: {opcode}")
        
        op_val = self.OPCODES[opcode]
        if not (0 <= rs1 <= 31 and 0 <= rs2 <= 31 and 0 <= rd <= 31):
            raise ValueError("Register addresses must be in range 0-31")
        
        instruction = (op_val << 19) | (rs1 << 14) | (rs2 << 9) | (0 << 5) | rd
        return instruction & 0xFFFFFF
    
    def encode_store(self, opcode: str, rs1: int, rs2: int, imm: int) -> int:
        """Encode Store instruction."""
        if opcode not in self.OPCODES:
            raise ValueError(f"Unknown opcode: {opcode}")
        
        op_val = self.OPCODES[opcode]
        if not (0 <= rs1 <= 31 and 0 <= rs2 <= 31):
            raise ValueError("Register addresses must be in range 0-31")
        if not (0 <= imm <= 511):
            raise ValueError("Immediate must be in range 0-511")
        
        instruction = (op_val << 19) | (rs1 << 14) | (rs2 << 9) | imm
        return instruction & 0xFFFFFF
    
    def encode_load(self, opcode: str, rs1: int, imm: int, rd: int) -> int:
        """Encode Load instruction."""
        if opcode not in self.OPCODES:
            raise ValueError(f"Unknown opcode: {opcode}")
        
        op_val = self.OPCODES[opcode]
        if not (0 <= rs1 <= 31 and 0 <= rd <= 31):
            raise ValueError("Register addresses must be in range 0-31")
        if not (0 <= imm <= 511):
            raise ValueError("Immediate must be in range 0-511")
        
        instruction = (op_val << 19) | (rs1 << 14) | (imm << 5) | rd
        return instruction & 0xFFFFFF
    
    # Abstracted test methods
    def load_register_single(self, reg_addr: int, value: float, mem_addr: int = 0x100):
        """Load a single precision float into a register."""
        hex_value = struct.unpack('>I', struct.pack('>f', value))[0]
        
        # Write value to dbus
        self.write_dbus(hex_value)
        
        # Create and execute load instruction
        instruction = self.encode_load('FLD_S', 0, mem_addr, reg_addr)
        self.write_instruction(instruction)
        
        self.wait_cycles(3)
        
        print(f"✓ Loaded {value} (0x{hex_value:08X}) into R{reg_addr}")
    
    def load_register_double(self, reg_addr: int, value: float, mem_addr: int = 0x100):
        """Load a double into a register."""
        
        hex_value = struct.unpack('>Q', struct.pack('>d', value))[0]
        self.write_dbus(hex_value)
        instruction = self.encode_load('FLD_D', 0, mem_addr, reg_addr)
        self.write_instruction(instruction)
        self.wait_cycles(3)
        
        print(f"✓ Loaded {value} (0x{hex_value:016X}) into R{reg_addr}")
    
    def execute_arithmetic(self, opcode: str, rs1: int, rs2: int, rd: int, wait_cycles: int = 8):
        """Execute an arithmetic operation and return the result."""
        instruction = self.encode_r_type(opcode, rs1, rs2, rd)
        self.write_instruction(instruction)
        print(f"Executing {opcode} R{rs1}, R{rs2} -> R{rd}")
        self.wait_cycles(wait_cycles)
        result = self.read_result()
        return result
    
    def execute_compare(self, opcode: str, rs1: int, rs2: int):
        """Execute a comparison operation and return flags."""
        instruction = self.encode_r_type(opcode, rs1, rs2, 0)  # rd=0 for compare
        self.write_instruction(instruction)
        print(f"Executing {opcode} R{rs1}, R{rs2}")
        self.wait_cycles(2)
        status = self.read_status()
        flags = status['flags']
        
        # Decode flags: [2:0] = [gt, eq, lt]
        gt = (flags >> 2) & 1
        eq = (flags >> 1) & 1  
        lt = flags & 1
        
        print(f"Compare result: gt={gt}, eq={eq}, lt={lt}")
        return {'gt': gt, 'eq': eq, 'lt': lt, 'raw_flags': flags}
    
    def execute_store(self, opcode: str, rs1: int, rs2: int, mem_addr: int):
        """Execute a store operation."""
        instruction = self.encode_store(opcode, rs1, rs2, mem_addr)
        self.write_instruction(instruction)
        
        print(f"Executing {opcode} R{rs1} -> addr 0x{mem_addr:03X}")
        self.wait_cycles(2)
        wrdata = self.read_wrdata()
        status = self.read_status()
        
        print(f"Store complete: addr=0x{status['wraddr']:03X}, data=0x{wrdata:016X}")
        return {'address': status['wraddr'], 'data': wrdata}

def run_hardware_tests():
    """Run hardware tests replicating the Verilog testbench."""
    
    print("=== PYNQ FPU Hardware Tests ===\n")
    fpu = PYNQFPUInterface()
    
    print("\n--- Test 1: Single Precision Load/Store ---")
    
    # Load 2.0 into R1
    fpu.load_register_single(1, 2.0, 0x100)
    
    # Store R1 to memory address 0x050
    store_result = fpu.execute_store('FSD_S', 1, 0, 0x050)
    
    # Verify store
    expected_data = fpu.FLOAT_CONSTANTS['FLOAT_2_0']
    if store_result['data'] & 0xFFFFFFFF == expected_data:
        print("✓ PASS: Single precision store")
    else:
        print(f"✗ FAIL: Single precision store - expected 0x{expected_data:08X}, got 0x{store_result['data'] & 0xFFFFFFFF:08X}")
    
    print("\n--- Test 2: Double Precision Load/Store ---")
    
    # Load 3.0 into R2  
    fpu.load_register_double(2, 3.0, 0x100)
    
    # Store R2 to memory address 0x060
    store_result = fpu.execute_store('FSD_D', 2, 0, 0x060)
    
    # Verify store
    expected_data = fpu.DOUBLE_CONSTANTS['DOUBLE_3_0']
    if store_result['data'] == expected_data:
        print("✓ PASS: Double precision store")
    else:
        print(f"✗ FAIL: Double precision store - expected 0x{expected_data:016X}, got 0x{store_result['data']:016X}")
    
    print("\n--- Test 3: Initialize Test Registers ---")
    
    # Initialize registers for arithmetic tests
    fpu.load_register_single(1, 2.0)   # R1 = 2.0 (single)
    fpu.load_register_single(2, 1.0)   # R2 = 1.0 (single)
    fpu.load_register_double(3, 2.0)   # R3 = 2.0 (double)  
    fpu.load_register_double(4, 1.0)   # R4 = 1.0 (double)
    fpu.load_register_single(5, 0.5)   # R5 = 0.5 (single)
    fpu.load_register_double(6, 0.5)   # R6 = 0.5 (double)
    
    print("\n--- Test 4: Single Precision Arithmetic ---")
    
    # Test addition: R7 = R1 + R2 = 2.0 + 1.0 = 3.0
    result = fpu.execute_arithmetic('FADD_S', 1, 2, 7)
    expected = fpu.FLOAT_CONSTANTS['FLOAT_3_0']
    if (result & 0xFFFFFFFF) == expected:
        print("✓ PASS: Single ADD 2.0 + 1.0 = 3.0")
    else:
        print(f"✗ FAIL: Single ADD - expected 0x{expected:08X}, got 0x{result & 0xFFFFFFFF:08X}")
    
    # Test subtraction: R8 = R1 - R2 = 2.0 - 1.0 = 1.0
    result = fpu.execute_arithmetic('FSUB_S', 1, 2, 8)
    expected = fpu.FLOAT_CONSTANTS['FLOAT_1_0']
    if (result & 0xFFFFFFFF) == expected:
        print("✓ PASS: Single SUB 2.0 - 1.0 = 1.0")
    else:
        print(f"✗ FAIL: Single SUB - expected 0x{expected:08X}, got 0x{result & 0xFFFFFFFF:08X}")
    
    # Test multiplication: R9 = R1 * R5 = 2.0 * 0.5 = 1.0
    result = fpu.execute_arithmetic('FMUL_S', 1, 5, 9)
    expected = fpu.FLOAT_CONSTANTS['FLOAT_1_0']
    if (result & 0xFFFFFFFF) == expected:
        print("✓ PASS: Single MUL 2.0 * 0.5 = 1.0")
    else:
        print(f"✗ FAIL: Single MUL - expected 0x{expected:08X}, got 0x{result & 0xFFFFFFFF:08X}")
    
    print("\n--- Test 5: Double Precision Arithmetic ---")
    
    # Test addition: R10 = R3 + R4 = 2.0 + 1.0 = 3.0
    result = fpu.execute_arithmetic('FADD_D', 3, 4, 10)
    expected = fpu.DOUBLE_CONSTANTS['DOUBLE_3_0']
    if result == expected:
        print("✓ PASS: Double ADD 2.0 + 1.0 = 3.0")
    else:
        print(f"✗ FAIL: Double ADD - expected 0x{expected:016X}, got 0x{result:016X}")
    
    # Test subtraction: R11 = R3 - R4 = 2.0 - 1.0 = 1.0
    result = fpu.execute_arithmetic('FSUB_D', 3, 4, 11)
    expected = fpu.DOUBLE_CONSTANTS['DOUBLE_1_0']
    if result == expected:
        print("✓ PASS: Double SUB 2.0 - 1.0 = 1.0")
    else:
        print(f"✗ FAIL: Double SUB - expected 0x{expected:016X}, got 0x{result:016X}")
    
    # Test multiplication: R12 = R3 * R6 = 2.0 * 0.5 = 1.0
    result = fpu.execute_arithmetic('FMUL_D', 3, 6, 12)
    expected = fpu.DOUBLE_CONSTANTS['DOUBLE_1_0']
    if result == expected:
        print("✓ PASS: Double MUL 2.0 * 0.5 = 1.0")
    else:
        print(f"✗ FAIL: Double MUL - expected 0x{expected:016X}, got 0x{result:016X}")
    
    print("\n--- Test 6: Single Precision Compare ---")
    
    # Test R1 > R2 (2.0 > 1.0)
    flags = fpu.execute_compare('FCMP_S', 1, 2)
    if flags['gt'] == 1 and flags['eq'] == 0 and flags['lt'] == 0:
        print("✓ PASS: Single CMP 2.0 > 1.0 (gt flag)")
    else:
        print(f"✗ FAIL: Single CMP 2.0 > 1.0 - expected gt=1, got {flags}")
    
    # Test R2 < R1 (1.0 < 2.0)
    flags = fpu.execute_compare('FCMP_S', 2, 1)
    if flags['gt'] == 0 and flags['eq'] == 0 and flags['lt'] == 1:
        print("✓ PASS: Single CMP 1.0 < 2.0 (lt flag)")
    else:
        print(f"✗ FAIL: Single CMP 1.0 < 2.0 - expected lt=1, got {flags}")
    
    # Test R1 == R1 (2.0 == 2.0)
    flags = fpu.execute_compare('FCMP_S', 1, 1)
    if flags['gt'] == 0 and flags['eq'] == 1 and flags['lt'] == 0:
        print("✓ PASS: Single CMP 2.0 == 2.0 (eq flag)")
    else:
        print(f"✗ FAIL: Single CMP 2.0 == 2.0 - expected eq=1, got {flags}")
    
    print("\n--- Test 7: Double Precision Compare ---")
    
    # Test R3 > R4 (2.0 > 1.0)
    flags = fpu.execute_compare('FCMP_D', 3, 4)
    if flags['gt'] == 1 and flags['eq'] == 0 and flags['lt'] == 0:
        print("✓ PASS: Double CMP 2.0 > 1.0 (gt flag)")
    else:
        print(f"✗ FAIL: Double CMP 2.0 > 1.0 - expected gt=1, got {flags}")
    
    print("\n=== Hardware Tests Complete ===")

if __name__ == "__main__":
    run_hardware_tests()
