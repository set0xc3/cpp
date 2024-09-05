# Compiler
CXX = clang++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++14

# Build directory
BUILD_DIR = build

# Source files
SRCS = $(wildcard src/*/main.cpp)

# Executable names (one for each source file)
TARGETS = $(patsubst src/%/main.cpp, $(BUILD_DIR)/%.bin, $(SRCS))

# Default target
all: $(BUILD_DIR) $(TARGETS)

# Create directories for each target
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile source files to executables
$(BUILD_DIR)/%.bin: src/%/main.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

# Run specified executable
run: $(BUILD_DIR)
	@echo "Running executable: $(target)"
	@./$(BUILD_DIR)/$(target).bin

# Run all executables
run-all: $(TARGETS)
	@echo "Running executables..."
	@$(foreach target, $(TARGETS), \
		echo "Running $(target)"; \
		./$(target); \
	)

# Clean up build files
clean:
	rm -rf $(BUILD_DIR)
