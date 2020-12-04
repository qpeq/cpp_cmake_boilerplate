cmake_minimum_required(VERSION 3.16)

add_executable (${PROJECT_NAME} 
    source/main.cpp
    include/hello.h
    source/hello.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 17
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME} PRIVATE include)
# target_link_libraries(${PROJECT_NAME} CONAN_PKG::boost)