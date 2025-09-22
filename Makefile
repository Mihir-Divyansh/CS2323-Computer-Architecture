SIM = iverilog -g2005-sv
VIEWER = gtkwave

RTL_DIR = rtl
TB_DIR = tb
COMMON_RTL = $(RTL_DIR)/regFile.v $(RTL_DIR)/insdec.v
OUT_DIR = sim_output
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Add - Tests Addition
add: $(OUT_DIR)
	$(SIM) -o $(OUT_DIR)/fpadd_sim $(RTL_DIR)/fpadd.v $(TB_DIR)/fpadd_tb.v $(COMMON_RTL)
	cd $(OUT_DIR) && ./fpadd_sim
	@echo "Floating point addition simulation complete"

# Mul - Tests Multiplication 
mul: $(OUT_DIR)
	$(SIM) -o $(OUT_DIR)/fpmul_sim $(RTL_DIR)/fpmul.v $(TB_DIR)/fpmul_tb.v $(COMMON_RTL)
	cd $(OUT_DIR) && ./fpmul_sim
	@echo "Floating point multiplication simulation complete"

# Top target - Tests the entire FPU
top: $(OUT_DIR)
	$(SIM) -o $(OUT_DIR)/fputop_sim $(RTL_DIR)/fputop.v $(RTL_DIR)/fpadd.v $(RTL_DIR)/fpmul.v $(RTL_DIR)/fpcmp.v $(TB_DIR)/fputop_tb.v $(COMMON_RTL)
	cd $(OUT_DIR) && ./fputop_sim
	@echo "Top level FPU simulation complete"

# View waveforms (if VCD files are generated)
view-add:
	$(VIEWER) $(OUT_DIR)/fpadd_tb.vcd &

view-top:
	$(VIEWER) $(OUT_DIR)/fpu_testbench.vcd &

# Run all simulations
all: add mul top

clean:
	rm -rf $(OUT_DIR)
	@echo "Cleaned simulation files"

# Help 
help:
	@echo "Available targets:"
	@echo "  add      - Run floating point addition simulation"
	@echo "  mul      - Run floating point multiplication simulation" 
	@echo "  top      - Run top level FPU simulation"
	@echo "  all      - Run all simulations"
	@echo "  view-*   - View waveforms for specific module"
	@echo "  clean    - Remove generated files"
	@echo "  help     - Show this help message"

.PHONY: add mul top all clean help view-add view-mul view-top