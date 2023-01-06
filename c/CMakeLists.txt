add_library(C main.cpp)
add_library(C::C ALIAS C)

target_include_directories(
  C PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
           $<INSTALL_INTERFACE:include>)

install(
  TARGETS C
  EXPORT CConfig
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION lib
  INCLUDES
  DESTINATION include)
install(
  EXPORT CConfig
  FILE CConfig.cmake
  NAMESPACE C::
  DESTINATION lib/cmake/C)
install(FILES include/c.hpp DESTINATION include)
