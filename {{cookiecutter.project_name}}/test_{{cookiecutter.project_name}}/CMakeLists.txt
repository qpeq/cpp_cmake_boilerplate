cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project(test_{{cookiecutter.project_name}})

link_directories(${CONAN_LIB_DIRS})

add_executable (${PROJECT_NAME} 
    src/test_{{cookiecutter.project_name}}.cpp
    ../{{cookiecutter.project_name}}/inc/hello.h
    ../{{cookiecutter.project_name}}/src/hello.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME} PRIVATE 
    ${CONAN_INCLUDE_DIRS} 
    ../{{cookiecutter.project_name}}/inc
)

target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})