cmake_minimum_required(VERSION 3.13)
project(MyApp CXX)

add_executable(MyApp main.cpp)

find_package(A REQUIRED)
find_package(B REQUIRED)
# transitive private dependency of A
if(NOT BUILD_SHARED_LIBS)
  find_package(C REQUIRED)
endif()
# transitive public dependency of A
find_package(D REQUIRED)

target_link_libraries(MyApp A::A B::B)
install(TARGETS MyApp DESTINATION bin)
