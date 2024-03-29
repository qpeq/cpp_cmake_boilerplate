cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project({{cookiecutter.project_name}}	
    VERSION {{cookiecutter.project_version}}
	DESCRIPTION "{{cookiecutter.project_description}}"
    LANGUAGES CXX)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

if(NOT CONAN_PROFILE)
    set(CONAN_PROFILE "default")
endif()

enable_testing()

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/prefetch_conan.cmake)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/include_submodules.cmake)
add_submodules_in_directory(submodules)

add_subdirectory({{cookiecutter.project_name}})
add_subdirectory(test_{{cookiecutter.project_name}})