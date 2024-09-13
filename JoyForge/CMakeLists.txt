cmake_minimum_required(VERSION 3.10)

# Project name
project(JoyForge)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

# Enable generation of compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Define the build directory
set(BUILD_DIR ${CMAKE_BINARY_DIR}/build)

# Find all source files
file(GLOB_RECURSE SRCS "src/*.cpp")

# Add an executable target
add_executable(JoyForge ${SRCS})

# # Add NIX_CFLAGS_COMPILE to the target
# if(DEFINED ENV{NIX_CFLAGS_COMPILE})
#   target_compile_options(JoyForge PRIVATE $ENV{NIX_CFLAGS_COMPILE})
# endif()
