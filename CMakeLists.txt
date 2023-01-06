cmake_minimum_required(VERSION 3.13)

project(abc_example CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(as_subproject A B C D)

# This macro originates from Daniel Pfeifer's talk at C++Now 2017:
# https://www.youtube.com/watch?v=bsXLMQ6WgIk
macro(find_package)
  message(STATUS "as subproject is ${as_subproject}")
  message(STATUS "ARG0 is ${ARGV0}, ${ARGV1}")
  if(NOT "${ARGV0}" IN_LIST as_subproject)
    message(STATUS "using native find_package for ${ARGV0}: ${ARGV}")
    _find_package(${ARGV})
  endif()
endmacro()

add_subdirectory(a)
add_subdirectory(b)
add_subdirectory(c)
add_subdirectory(d)
add_subdirectory(app)

add_custom_target(
  graphviz ALL
  COMMAND ${CMAKE_COMMAND} "--graphviz=abc-structure.dot" .
  COMMAND dot -Tsvg abc-structure.dot -o abc-structure.svg
  COMMAND dot -Tpdf abc-structure.dot -o abc-structure.pdf
  COMMAND dot -Tpng abc-structure.dot -o abc-structure.png
  WORKING_DIRECTORY "${CMAKE_BINARY_DIR}")
