cmake_minimum_required(VERSION 3.13)
project(A CXX)

add_library(A main.cpp)
add_library(A::A ALIAS A)

target_include_directories(
  A PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
           $<INSTALL_INTERFACE:include>)

find_package(C REQUIRED)
find_package(D REQUIRED)

target_link_libraries(
  A
  PRIVATE C::C
  PUBLIC D::D)

install(
  TARGETS A
  EXPORT AConfig
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION lib
  INCLUDES
  DESTINATION include)
install(
  EXPORT AConfig
  FILE AConfig.cmake
  NAMESPACE A::
  DESTINATION lib/cmake/A)
install(FILES include/a.hpp DESTINATION include)
