cmake_minimum_required(VERSION 3.13)

project(abc_example CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(a)
add_subdirectory(b)
add_subdirectory(c)
add_subdirectory(app)

add_custom_target(graphviz ALL
    COMMAND ${CMAKE_COMMAND} "--graphviz=abc-structure.dot" .
    COMMAND dot -Tsvg abc-structure.dot -o abc-structure.svg
    COMMAND dot -Tpdf abc-structure.dot -o abc-structure.pdf
    COMMAND dot -Tpng abc-structure.dot -o abc-structure.png
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
)
