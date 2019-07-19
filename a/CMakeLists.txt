add_subdirectory(d)

add_library(a main.cpp)

target_include_directories(a PUBLIC include/)

target_link_libraries(a
  PRIVATE c
  PUBLIC  d
  )
