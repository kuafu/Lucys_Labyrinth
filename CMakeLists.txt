cmake_minimum_required(VERSION 3.14)
project(Lucys_Labyrinth VERSION 1.0 LANGUAGES C CXX RC)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ---------------------------------------------------------------------------
# Dependencies: llama_cpp (subdirectory), SFML (find_package)
# ---------------------------------------------------------------------------

# Build llama.cpp as static libs, no tests/examples
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_SERVER OFF CACHE BOOL "" FORCE)
set(LLAMA_CUBLAS OFF CACHE BOOL "" FORCE)
set(LLAMA_METAL OFF CACHE BOOL "" FORCE)
set(LLAMA_VULKAN OFF CACHE BOOL "" FORCE)
add_subdirectory(llama_cpp)

# SFML: use static libs from SFML-2.6.1
set(SFML_STATIC_LIBRARIES TRUE)
set(SFML_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/SFML-2.6.1")
set(SFML_DIR "${SFML_ROOT}/lib/cmake/SFML")
# Required by SFML static target files for IMPORTED_LOCATION
set(_IMPORT_PREFIX "${SFML_ROOT}")
find_package(SFML 2.6 COMPONENTS graphics window system audio main REQUIRED)

# ---------------------------------------------------------------------------
# App: source under Lucys_Labyrinth/ (per Makefile: main.cpp)
# ---------------------------------------------------------------------------
add_subdirectory(Lucys_Labyrinth)
