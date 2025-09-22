import struct
import time
from typing import Dict, Tuple

# Uncomment for hardware
from pynq import Overlay, MMIO

class PynqFPUInterface:
   
    # Memory offsets
    INSTRUCTION = 0x00
    DBUS_LOW = 0x04
    DBUS_HIGH = 0x08
    RESULT_LOW = 0x10
    RESULT_HIGH = 0x14
    BUS1 = 0x18
    WRDATA_LOW = 0x1C
    WRDATA_HIGH = 0x20
   
    # Opcodes
    OPS = {
        'FADD_S': 0b00100, 'FSUB_S': 0b00010, 'FMUL_S': 0b00001,
        'FADD_D': 0b10100, 'FSUB_D': 0b10010, 'FMUL_D': 0b10001,
        'FLD_S': 0b01100, 'FSD_S': 0b01010, 'FCMP_S': 0b01001,
        'FLD_D': 0b11100, 'FSD_D': 0b11010, 'FCMP_D': 0b11001,
    }
   
    def __init__(self, bitstream_path: str = "pynq_fpu.bit", base_addr: int = 0x43C00000):
        """Initialize FPU interface"""
        # For hardware (uncomment):
        self.overlay = Overlay(bitstream_path)
        self.mmio = MMIO(base_addr, 0x1000)
       
        # For simulation:
        # self.mmio = MockMMIO()
        print(f"FPU initialized at 0x{base_addr:08X}")
   
    def write_dbus(self, data: int):
        """Write 64-bit data to dbus"""
        self.mmio.write(self.DBUS_LOW, data & 0xFFFFFFFF)
        self.mmio.write(self.DBUS_HIGH, (data >> 32) & 0xFFFFFFFF)
   
    def write_instruction(self, ins: int):
        """Write instruction and clear it"""
        self.mmio.write(self.INSTRUCTION, ins & 0xFFFFFF)
        self.wait(1)  # Let instruction execute
        self.mmio.write(self.INSTRUCTION, 0x0)  # Clear instruction register
   
    def read_wrdata(self) -> int:
        """Read result from wrdata bus"""
        low = self.mmio.read(self.WRDATA_LOW)
        high = self.mmio.read(self.WRDATA_HIGH)
        return (high << 32) | low
   
    def wait(self, cycles: int = 5):
        """Wait for operation to complete"""
        time.sleep(cycles * 0.01)  # 10ns per cycle
   
    def encode_r_type(self, op: str, rs1: int, rs2: int, rd: int) -> int:
        """Encode R-type instruction: op rs1 rs2 rd"""
        return (self.OPS[op] << 19) | (rs1 << 14) | (rs2 << 9) | rd
   
    def encode_load(self, op: str, rs1: int, imm: int, rd: int) -> int:
        """Encode load instruction: op rs1 imm rd"""
        return (self.OPS[op] << 19) | (rs1 << 14) | (imm << 5) | rd
   
    def encode_store(self, op: str, rs1: int, rs2: int, imm: int) -> int:
        """Encode store instruction: op rs1 rs2 imm"""
        return (self.OPS[op] << 19) | (rs1 << 14) | (rs2 << 9) | imm
   
    def load_float(self, reg: int, value: float):
        """Load single precision float into register"""
        hex_val = struct.unpack('>I', struct.pack('>f', value))[0]
        self.write_dbus(hex_val)
        self.write_instruction(self.encode_load('FLD_S', 0, 0x100, reg))
        self.wait(2)  # Additional wait for load to complete
        print(f"Loaded {value} -> R{reg}")
   
    def load_double(self, reg: int, value: float):
        """Load double precision float into register"""
        hex_val = struct.unpack('>Q', struct.pack('>d', value))[0]
        self.write_dbus(hex_val)
        self.write_instruction(self.encode_load('FLD_D', 0, 0x100, reg))
        self.wait(2)  # Additional wait for load to complete
        print(f"Loaded {value} -> R{reg}")
   
    def arithmetic_and_read(self, op: str, rs1: int, rs2: int, rd: int) -> float:
        """Issue arithmetic instruction, store to memory, read from wrdata"""
        # Step 1: Issue arithmetic instruction
        arith_ins = self.encode_r_type(op, rs1, rs2, rd)
        self.write_instruction(arith_ins)
        self.wait(7)  # Wait for arithmetic to complete
        print(f"Executed: {op} R{rs1}, R{rs2} -> R{rd}")
       
        # Step 2: Issue store instruction to write result to memory
        store_op = 'FSD_S' if op.endswith('_S') else 'FSD_D'
        store_ins = self.encode_store(store_op, rd, 0, 0x200)
        self.write_instruction(store_ins)
        self.wait(2)  # Wait for store to complete
       
        # Step 3: Read from wrdata bus
        result_hex = self.read_wrdata()
       
        # Convert back to float
        if op.endswith('_S'):
            result = struct.unpack('>f', struct.pack('>I', result_hex & 0xFFFFFFFF))[0]
        else:
            result = struct.unpack('>d', struct.pack('>Q', result_hex))[0]
       
        print(f"Result: {result}")
        return result
   
    def compare(self, op: str, rs1: int, rs2: int) -> Dict[str, int]:
        """Compare two registers and return flags"""
        ins = self.encode_r_type(op, rs1, rs2, 0)
        self.write_instruction(ins)
        self.wait(2)

        # Read flags from bus1
        bus1 = self.mmio.read(self.BUS1)
        flags = (bus1 >> 26) & 0x7
       
        result = {
            'gt': (flags >> 2) & 1,
            'eq': (flags >> 1) & 1,
            'lt': flags & 1
        }
        print(f"Compare {op}: gt={result['gt']}, eq={result['eq']}, lt={result['lt']}")
        return result


class MockMMIO:
    """Mock MMIO for testing without hardware"""
    def __init__(self):
        self.regs = {}
   
    def write(self, offset: int, value: int):
        self.regs[offset] = value & 0xFFFFFFFF
        print(f"Write: 0x{offset:02X} = 0x{value:08X}")
   
    def read(self, offset: int) -> int:
        value = self.regs.get(offset, 0)
        print(f"Read: 0x{offset:02X} = 0x{value:08X}")
        return value


def run_tests():
    """Run simplified tests"""
    print("=== Simplified FPU Tests ===\n")
   
    fpu = PynqFPUInterface()
   
    # Load test values
    print("Loading test values...")
    fpu.load_float(1, 2.0)
    fpu.load_float(2, 1.0)
    fpu.load_double(3, 3.0)
    fpu.load_double(4, 1.5)
   
    print("\n--- Single Precision Tests ---")
    # Test: 2.0 + 1.0 = 3.0
    result = fpu.arithmetic_and_read('FADD_S', 1, 2, 5)
    assert abs(result - 3.0) < 0.001, f"Expected 3.0, got {result}"
    print("✓ PASS: 2.0 + 1.0 = 3.0")
   
    # Test: 2.0 - 1.0 = 1.0  
    result = fpu.arithmetic_and_read('FSUB_S', 1, 2, 6)
    assert abs(result - 1.0) < 0.001, f"Expected 1.0, got {result}"
    print("✓ PASS: 2.0 - 1.0 = 1.0")
   
    print("\n--- Double Precision Tests ---")
    # Test: 3.0 + 1.5 = 4.5
    result = fpu.arithmetic_and_read('FADD_D', 3, 4, 7)
    assert abs(result - 4.5) < 0.001, f"Expected 4.5, got {result}"
    print("✓ PASS: 3.0 + 1.5 = 4.5")
   
    print("\n--- Compare Tests ---")
    # Test: 2.0 > 1.0
    flags = fpu.compare('FCMP_S', 1, 2)
    assert flags['gt'] == 1, f"Expected gt=1, got {flags}"
    print("✓ PASS: 2.0 > 1.0")
   
    # Test: 1.0 == 1.0
    flags = fpu.compare('FCMP_S', 2, 2)
    assert flags['eq'] == 1, f"Expected eq=1, got {flags}"
    print("✓ PASS: 1.0 == 1.0")
   
    print("\n=== All Tests Passed! ===")


if __name__ == "__main__":
    run_tests()