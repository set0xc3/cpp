# Compiler
CXX = clang++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++11

# Build directory
BUILD_DIR = build

# Source files
SRCS = $(shell find src -name "*.cpp")

# Executable names (one for each source file)
TARGETS = $(patsubst src/%/main.cpp, $(BUILD_DIR)/%.bin, $(SRCS))

# Default target
all: $(TARGETS)

# Pre-build
pre-build:
	@mkdir -p ./vendor/SDL2/build
	@cmake -S ./vendor/SDL2 -B ./vendor/SDL2/build
	@cmake --build ./vendor/SDL2/build -j$(shell nproc)

# Create directories for each target
$(BUILD_DIR)/%.bin: src/%/main.cpp
	@mkdir -p $(dir $@)
	bear -- $(CXX) $(CXXFLAGS) $(NIX_CFLAGS_COMPILE) $< -o $@ $(LIBS)

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

# Clean target
clean:
	rm -rf $(BUILD_DIR)
