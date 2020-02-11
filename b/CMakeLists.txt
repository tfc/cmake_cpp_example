add_library(B main.cpp)
add_library(B::B ALIAS B)

target_include_directories(B PUBLIC  
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>  
    $<INSTALL_INTERFACE:include>
    )

install(TARGETS B EXPORT BConfig
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION lib
  INCLUDES DESTINATION include
  )
install(EXPORT BConfig
  FILE BConfig.cmake
  NAMESPACE B::
  DESTINATION lib/cmake/B
  )
install(FILES
  include/b.hpp
  DESTINATION include
  )

