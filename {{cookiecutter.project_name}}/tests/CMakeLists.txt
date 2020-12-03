cmake_minimum_required(VERSION 3.16)

project(tests)

add_executable (${PROJECT_NAME} 
    source/test_cmake.cpp
    ../{{cookiecutter.project_name}}/include/hello.h
    ../{{cookiecutter.project_name}}/source/hello.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 17
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME} PRIVATE ../{{cookiecutter.project_name}}/include)
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})