# Compiler
CXX = clang++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Список библиотек
LIBS := \
    -lraylib

# Список дополнительных флагов
CXXFLAGS += -I$(RAYLIB_INCLUDE) \
						-I$(BOOST_INCLUDE) \
						-I$(ENTT_INCLUDE)

LDFLAGS :=	-L$(RAYLIB_LIB) \
						-L$(BOOST_LIB)

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
	bear -- $(CXX) $(CXXFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)

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
