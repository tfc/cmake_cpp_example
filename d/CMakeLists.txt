cmake_minimum_required(VERSION 3.13)
project(D CXX)

add_library(D main.cpp)
add_library(D::D ALIAS D)

target_include_directories(
  D PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
           $<INSTALL_INTERFACE:include>)

install(
  TARGETS D
  EXPORT DConfig
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION lib
  INCLUDES
  DESTINATION include)
install(
  EXPORT DConfig
  FILE DConfig.cmake
  NAMESPACE D::
  DESTINATION lib/cmake/D)
install(FILES include/d.hpp DESTINATION include/)
