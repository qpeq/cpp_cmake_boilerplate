cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

{% if cookiecutter.binary_type == "exe" %}
add_executable(${PROJECT_NAME} 
{% elif cookiecutter.binary_type == "static" %}
add_library(${PROJECT_NAME} STATIC 
{% elif cookiecutter.binary_type == "shared" %}
add_library(${PROJECT_NAME} SHARED 
{% endif %}
    inc/hello.hpp
    src/hello.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>    
        $<INSTALL_INTERFACE:inc>
)

target_sources(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/hello.cpp
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/inc/hello.hpp
)
