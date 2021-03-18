cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project({{cookiecutter.project_name}}	
    VERSION {{cookiecutter.project_version}}
	DESCRIPTION "{{cookiecutter.project_description}}"
    LANGUAGES CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

enable_testing()

add_subdirectory({{cookiecutter.project_name}})
add_subdirectory(test_{{cookiecutter.project_name}})