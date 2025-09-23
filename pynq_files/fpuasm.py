import struct
import time
import re
from typing import Dict, List, Tuple, Union, Optional

# Uncomment for hardware
from pynq import Overlay, MMIO

class FPUInterface:

    # Memory offsets
    INSTRUCTION = 0x00
    DBUS_LOW = 0x04
    DBUS_HIGH = 0x08
    RESULT_LOW = 0x10
    RESULT_HIGH = 0x14
    BUS1 = 0x18
    WRDATA_LOW = 0x1C
    WRDATA_HIGH = 0x20
   
    OPS = {
        'fadd.s': 0b00100, 'fsub.s': 0b00010, 'fmul.s': 0b00001,
        'fadd.d': 0b10100, 'fsub.d': 0b10010, 'fmul.d': 0b10001,
        'fld.s': 0b01100, 'fsd.s': 0b01010, 'fcmp.s': 0b01001,
        'fld.d': 0b11100, 'fsd.d': 0b11010, 'fcmp.d': 0b11001,
    }
    
    OPS_UPPER = {
        'FADD_S': 0b00100, 'FSUB_S': 0b00010, 'FMUL_S': 0b00001,
        'FADD_D': 0b10100, 'FSUB_D': 0b10010, 'FMUL_D': 0b10001,
        'FLD_S': 0b01100, 'FSD_S': 0b01010, 'FCMP_S': 0b01001,
        'FLD_D': 0b11100, 'FSD_D': 0b11010, 'FCMP_D': 0b11001,
    }
    
    def __init__(self, bitstream_path: str = "pynq_fpu.bit", base_addr: int = 0x43C00000, 
                 simulation: bool = False):
        """Initialize FPU interface
        
        Args:
            bitstream_path: Path to FPGA bitstream
            base_addr: Base address for MMIO
            simulation: If True, use mock MMIO for testing
        """
        if simulation:
            self.mmio = MockMMIO()
            print("FPU Interface initialized in SIMULATION mode")
        else:
            self.overlay = Overlay(bitstream_path)
            self.mmio = MMIO(base_addr, 0x1000)
            print(f"FPU Interface initialized with hardware at 0x{base_addr:08X}")
        
        # Register tracking for assembly interface
        self.registers = {}  # reg_num -> (precision, value)
        self.flags = {'gt': 0, 'eq': 0, 'lt': 0}
        
        print("Supported instructions:")
        print("  Arithmetic: fadd.s/d, fsub.s/d, fmul.s/d")
        print("  Load/Store: fld.s/d, fsd.s/d") 
        print("  Compare: fcmp.s/d")
        print("  Pseudo: li.s/d (load immediate)")
        print()
    
    # ========== AXI Interface Calls [DATA] ==========
    
    def write_dbus(self, data: int):
        """Write 64-bit data to dbus"""
        self.mmio.write(self.DBUS_LOW, data & 0xFFFFFFFF)
        self.mmio.write(self.DBUS_HIGH, (data >> 32) & 0xFFFFFFFF)
    
    def write_instruction(self, ins: int):
        """Write instruction and clear it"""
        self.mmio.write(self.INSTRUCTION, ins & 0xFFFFFF)
        self.wait(1)
        self.mmio.write(self.INSTRUCTION, 0x0)
    
    def read_wrdata(self) -> int:
        """Read result from wrdata bus"""
        low = self.mmio.read(self.WRDATA_LOW)
        high = self.mmio.read(self.WRDATA_HIGH)
        return (high << 32) | low
    
    def wait(self, cycles: int = 5):
        """Wait for operation to complete"""
        time.sleep(cycles * 0.01)
    
    # ========== Instruction Encoding ==========
    
    def encode_r_type(self, op: str, rs1: int, rs2: int, rd: int) -> int:
        """Encode R-type instruction"""
        op_key = op.upper() if op.upper() in self.OPS_UPPER else op.lower()
        opcode = self.OPS_UPPER.get(op_key, self.OPS.get(op_key))
        if opcode is None:
            raise ValueError(f"Unknown operation: {op}")
        return (opcode << 19) | (rs1 << 14) | (rs2 << 9) | rd
    
    def encode_load(self, op: str, rs1: int, imm: int, rd: int) -> int:
        """Encode load instruction"""
        op_key = op.upper() if op.upper() in self.OPS_UPPER else op.lower()
        opcode = self.OPS_UPPER.get(op_key, self.OPS.get(op_key))
        if opcode is None:
            raise ValueError(f"Unknown operation: {op}")
        return (opcode << 19) | (rs1 << 14) | (imm << 5) | rd
    
    def encode_store(self, op: str, rs1: int, rs2: int, imm: int) -> int:
        """Encode store instruction"""
        op_key = op.upper() if op.upper() in self.OPS_UPPER else op.lower()
        opcode = self.OPS_UPPER.get(op_key, self.OPS.get(op_key))
        if opcode is None:
            raise ValueError(f"Unknown operation: {op}")
        return (opcode << 19) | (rs1 << 14) | (rs2 << 9) | imm
    
    # ========== AXI Interface Calls [INS] ==========
    
    def load_float(self, reg: int, value: float) -> float:
        """Load single precision float into register"""
        hex_val = struct.unpack('>I', struct.pack('>f', value))[0]
        self.write_dbus(hex_val)
        self.write_instruction(self.encode_load('FLD_S', 0, 0x100, reg))
        self.wait(2)
        
        # Update register tracking
        self.registers[reg] = ('single', value)
        return value
    
    def load_double(self, reg: int, value: float) -> float:
        """Load double precision float into register"""
        hex_val = struct.unpack('>Q', struct.pack('>d', value))[0]
        self.write_dbus(hex_val)
        self.write_instruction(self.encode_load('FLD_D', 0, 0x100, reg))
        self.wait(2)
        
        # Update register tracking
        self.registers[reg] = ('double', value)
        return value
    
    def arithmetic_and_read(self, op: str, rs1: int, rs2: int, rd: int) -> float:
        """Issue arithmetic instruction and read result from hardware"""
        arith_ins = self.encode_r_type(op, rs1, rs2, rd)
        self.write_instruction(arith_ins)
        self.wait(7)
        
        # To read from hw, force store to memory
        store_op = 'FSD_S' if op.upper().endswith('_S') or op.lower().endswith('.s') else 'FSD_D'
        store_ins = self.encode_store(store_op, rd, 0, 0x200)
        self.write_instruction(store_ins)
        self.wait(2)
        result_hex = self.read_wrdata()
        if op.upper().endswith('_S') or op.lower().endswith('.s'):
            result = struct.unpack('>f', struct.pack('>I', result_hex & 0xFFFFFFFF))[0]
            precision = 'single'
        else:
            result = struct.unpack('>d', struct.pack('>Q', result_hex))[0]
            precision = 'double'
        
        # Update register tracking
        self.registers[rd] = (precision, result)
        return result
    
    def compare_and_read(self, op: str, rs1: int, rs2: int) -> Dict[str, int]:
        """Compare two registers and return actual flags from hardware"""
        ins = self.encode_r_type(op, rs1, rs2, 0)
        self.write_instruction(ins)
        self.wait(2)
        bus1 = self.mmio.read(self.BUS1)
        flags = (bus1 >> 26) & 0x7
        
        self.flags = {
            'gt': (flags >> 2) & 1,
            'eq': (flags >> 1) & 1,
            'lt': flags & 1
        }
        return self.flags
    
    # ========== Assembly Interface ==========
    
    def parse_register(self, reg_str: str) -> int:
        """Parse register string (f0, f1, etc.) to register number"""
        reg_str = reg_str.strip().lower()
        if reg_str.startswith('f'):
            return int(reg_str[1:])
        elif reg_str.isdigit():
            return int(reg_str)
        else:
            raise ValueError(f"Invalid register format: {reg_str}")
    
    def parse_immediate(self, imm_str: str) -> Union[float, int]:
        """Parse immediate value (float, hex, or decimal)"""
        imm_str = imm_str.strip()
        
        if imm_str.startswith('0x'):
            return int(imm_str, 16)
        
        try:
            return float(imm_str)
        except ValueError:
            return int(imm_str)
    
    def parse_instruction(self, instruction: str) -> Optional[Dict]:
        """Parse assembly instruction string"""
        instruction = instruction.split('#')[0].strip()
        if not instruction:
            return None
        
        parts = re.split(r'[,\s]+', instruction)
        opcode = parts[0].lower()
        
        if opcode in ['fadd.s', 'fsub.s', 'fmul.s', 'fadd.d', 'fsub.d', 'fmul.d']:
            if len(parts) != 4:
                raise ValueError(f"Expected 4 parts for {opcode}, got {len(parts)}")
            return {
                'type': 'arithmetic',
                'opcode': opcode,
                'rd': self.parse_register(parts[1]),
                'rs1': self.parse_register(parts[2]),
                'rs2': self.parse_register(parts[3])
            }
        
        elif opcode in ['fcmp.s', 'fcmp.d']:
            if len(parts) != 3:
                raise ValueError(f"Expected 3 parts for {opcode}, got {len(parts)}")
            return {
                'type': 'compare',
                'opcode': opcode,
                'rs1': self.parse_register(parts[1]),
                'rs2': self.parse_register(parts[2])
            }
        
        elif opcode in ['li.s', 'li.d']:
            if len(parts) != 3:
                raise ValueError(f"Expected 3 parts for {opcode}, got {len(parts)}")
            return {
                'type': 'load_immediate',
                'opcode': opcode,
                'rd': self.parse_register(parts[1]),
                'value': self.parse_immediate(parts[2])
            }
        
        else:
            raise ValueError(f"Unknown instruction: {opcode}")
    
    def execute_instruction(self, parsed_inst: Dict) -> Union[float, Dict]:
        """Execute a parsed instruction using hardware"""
        inst_type = parsed_inst['type']
        opcode = parsed_inst['opcode']
        
        if inst_type == 'load_immediate':
            rd = parsed_inst['rd']
            value = parsed_inst['value']
            
            if opcode == 'li.s':
                result = self.load_float(rd, float(value))
                print(f"Loaded {value} -> f{rd}")
            else:  # li.d
                result = self.load_double(rd, float(value))
                print(f"Loaded {value} -> f{rd}")
            
            return result
        
        elif inst_type == 'arithmetic':
            rs1, rs2, rd = parsed_inst['rs1'], parsed_inst['rs2'], parsed_inst['rd']
            result = self.arithmetic_and_read(opcode, rs1, rs2, rd)
            print(f"Executed: {opcode} f{rd}, f{rs1}, f{rs2}")
            print(f"Hardware result: {result} -> f{rd}")
            
            return result
        
        elif inst_type == 'compare':
            rs1, rs2 = parsed_inst['rs1'], parsed_inst['rs2']
            flags = self.compare_and_read(opcode, rs1, rs2)
            print(f"Compare {opcode} f{rs1}, f{rs2}: gt={flags['gt']}, eq={flags['eq']}, lt={flags['lt']}")
            
            return flags
        
        else:
            raise ValueError(f"Unknown instruction type: {inst_type}")
    
    def execute_assembly(self, assembly_code: str, verify_results: bool = True):
        """Execute assembly code with optional result verification"""
        print("=== Executing Assembly Code ===")
        lines = assembly_code.strip().split('\n')
        
        for i, line in enumerate(lines, 1):
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            
            print(f"Line {i}: {line}")
            try:
                parsed = self.parse_instruction(line)
                if parsed:
                    result = self.execute_instruction(parsed)
                    
                    if verify_results and parsed['type'] == 'arithmetic':
                        # TODO: Add verification logic here
                        pass
                        
            except Exception as e:
                print(f"Error on line {i}: {e}")
                break
            print()
        
        print("=== Execution Complete ===")
    
    # ========== Status and Testing ==========
    
    def show_registers(self):
        """Display current register values"""
        print("=== Register State ===")
        for reg, (precision, value) in sorted(self.registers.items()):
            print(f"f{reg}: {value} ({precision})")
        print()
    
    def show_flags(self):
        """Display current comparison flags"""
        print(f"Flags: GT={self.flags['gt']}, EQ={self.flags['eq']}, LT={self.flags['lt']}")
    
    def run_fasm_file(self, filepath: str, verify_results: bool = True):
        """Load and execute a .fasm file"""
        if not filepath.endswith(".fasm"):
            raise ValueError("Expected a .fasm file")

        try:
            with open(filepath, "r") as f:
                code = f.read()
        except FileNotFoundError:
            print(f"Error: File {filepath} not found")
            return

        print(f"=== Running {filepath} ===")
        self.execute_assembly(code, verify_results=verify_results)
        print(f"=== Finished {filepath} ===")
        
    def run_verification_tests(self):
        """Run comprehensive verification tests"""
        print("=== Hardware Verification Tests ===\n")
        
        # Single precision tests
        print("--- Single Precision Tests ---")
        self.load_float(1, 2.5)
        self.load_float(2, 1.5)
        
        # Test addition: 2.5 + 1.5 = 4.0
        result = self.arithmetic_and_read('FADD_S', 1, 2, 3)
        assert abs(result - 4.0) < 0.001, f"Expected 4.0, got {result}"
        print("PASS: 2.5 + 1.5 = 4.0")
        
        # Test subtraction: 2.5 - 1.5 = 1.0
        result = self.arithmetic_and_read('FSUB_S', 1, 2, 4)
        assert abs(result - 1.0) < 0.001, f"Expected 1.0, got {result}"
        print("PASS: 2.5 - 1.5 = 1.0")
        
        # Test multiplication: 2.5 * 1.5 = 3.75
        result = self.arithmetic_and_read('FMUL_S', 1, 2, 5)
        assert abs(result - 3.75) < 0.001, f"Expected 3.75, got {result}"
        print("PASS: 2.5 * 1.5 = 3.75")
        
        # Double precision tests
        print("\n--- Double Precision Tests ---")
        self.load_double(6, 3.14159)
        self.load_double(7, 2.0)
        
        result = self.arithmetic_and_read('FMUL_D', 6, 7, 8)
        expected = 3.14159 * 2.0
        assert abs(result - expected) < 0.001, f"Expected {expected}, got {result}"
        print(f"PASS: π * 2.0 = {result}")
        
        # Comparison tests
        print("\n--- Comparison Tests ---")
        flags = self.compare_and_read('FCMP_S', 1, 2)  # 2.5 > 1.5
        assert flags['gt'] == 1, f"Expected gt=1, got {flags}"
        print("PASS: 2.5 > 1.5")
        
        flags = self.compare_and_read('FCMP_S', 2, 2)  # 1.5 == 1.5
        assert flags['eq'] == 1, f"Expected eq=1, got {flags}"
        print("PASS: 1.5 == 1.5")
        
        print("\n=== All Hardware Tests Passed! ===")


class MockMMIO:
    """Enhanced mock MMIO for simulation"""
    def __init__(self):
        self.regs = {}
        self.memory = {}
    
    def write(self, offset: int, value: int):
        self.regs[offset] = value & 0xFFFFFFFF
        if offset == 0x1C or offset == 0x20:  
            pass
    
    def read(self, offset: int) -> int:
        if offset == 0x1C or offset == 0x20:  
            return self.regs.get(offset, 0x40800000)  # Returns some default value
        elif offset == 0x18:
            return (0x5 << 26) 
        return self.regs.get(offset, 0)


def demo_complete_interface():
    """Demonstrate the complete interface"""
    
    # Initialize in simulation mode for demo
    fpu = FPUInterface(simulation=True)
    
    # Test direct API calls
    print("--- Direct Hardware API ---")
    fpu.load_float(1, 2.5)
    fpu.load_float(2, 1.5)
    result = fpu.arithmetic_and_read('FADD_S', 1, 2, 3)
    print(f"Direct API result: {result}")
    
    print("\n--- Assembly Interface ---")
    assembly_program = """
    # Assembly program with hardware verification
    li.s f4, 3.0        # Load 3.0
    li.s f5, 2.0        # Load 2.0  
    fadd.s f6, f4, f5   # f6 = 3.0 + 2.0 = 5.0
    fmul.s f7, f4, f5   # f7 = 3.0 * 2.0 = 6.0
    fcmp.s f4, f5       # Compare 3.0 vs 2.0
    """
    
    fpu.execute_assembly(assembly_program)
    fpu.show_registers()
    fpu.show_flags()
    print("\n--- Running Hardware Verification ---")
    fpu.run_verification_tests()


def interactive_mode():
    """Interactive mode for user input"""
    print("=== Interactive FPU Interface ===")
    print("Commands:")
    print("  Assembly: li.s f1, 2.5; fadd.s f3, f1, f2; etc.")
    print("  Direct: load_float(1, 2.5); arithmetic_and_read('FADD_S', 1, 2, 3)")
    print("  Status: regs, flags, test")
    print("  Control: quit")
    print()
    
    # Ask for simulation or hardware mode
    mode = input("Use simulation mode? (y/n): ").lower().startswith('y')
    fpu = FPUInterface(simulation=mode)
    
    while True:
        try:
            line = input("fpu> ").strip()
            
            if line.lower() in ['quit', 'exit']:
                break
            elif line.lower() == 'regs':
                fpu.show_registers()
            elif line.lower() == 'flags':
                fpu.show_flags()
            elif line.lower() == 'test':
                fpu.run_verification_tests()
            elif line.startswith('load_float(') or line.startswith('arithmetic_and_read('):
                # Direct API call
                try:
                    result = eval(f"fpu.{line}")
                    print(f"Result: {result}")
                except Exception as e:
                    print(f"Error: {e}")
            elif line and not line.startswith('#'):
                # Try as assembly instruction
                try:
                    parsed = fpu.parse_instruction(line)
                    if parsed:
                        result = fpu.execute_instruction(parsed)
                        print(f"Result: {result}")
                except Exception as e:
                    print(f"Error: {e}")
                    
        except KeyboardInterrupt:
            print("\nGoodbye!")
            break
        except Exception as e:
            print(f"Error: {e}")


if __name__ == "__main__":
    # Run demonstration
    # demo_complete_interface()
    intf = FPUInterface(simulation=False)
    intf.run_fasm_file("test.fasm", verify_results=False)
    # Uncomment for interactive mode
    # interactive_mode()
