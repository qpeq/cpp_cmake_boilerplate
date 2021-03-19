cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project({{cookiecutter.project_name}}	
    VERSION {{cookiecutter.project_version}}
	DESCRIPTION "{{cookiecutter.project_description}}"
    LANGUAGES CXX)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/prefetch_conan.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/include_submodules.cmake)

add_subdirectory({{cookiecutter.project_name}})
add_subdirectory(test_{{cookiecutter.project_name}})