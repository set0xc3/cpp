# Compiler
CXX = clang++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++14

# Build directory
BUILD_DIR = build

# Source files
SRCS = $(shell find src -name "*.cpp")

# Executable names (one for each source file)
TARGETS = $(patsubst src/%/main.cpp, $(BUILD_DIR)/%.bin, $(SRCS))

# Default target
all: $(TARGETS)

# Create directories for each target
$(BUILD_DIR)/%.bin: src/%/main.cpp
	@mkdir -p $(dir $@)
	bear -- $(CXX) $(CXXFLAGS) -I$(VULKAN_VOLK_INCLUDE) -L$(VULKAN_VOLK_LIB) -I$(SDL2_INCLUDE) -L$(SDL2_LIB) -I$(IMGUI_INCLUDE) -L$(IMGUI_LIB) -lvolk -lSDL2 -limgui $< -o $@

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
