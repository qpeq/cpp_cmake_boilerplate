cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project({{cookiecutter.project_name}}	
    VERSION {{cookiecutter.project_version}}
	DESCRIPTION "{{cookiecutter.project_description}}"
    LANGUAGES CXX)

include(cmake/conan_install.cmake)
include(cmake/conan_package.cmake)

enable_testing()

add_subdirectory({{cookiecutter.project_name}})
add_subdirectory(tests)