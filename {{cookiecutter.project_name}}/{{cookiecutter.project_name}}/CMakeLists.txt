cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

{% if cookiecutter.project_type == "exe" -%}
add_executable(${PROJECT_NAME})
{% elif cookiecutter.project_type == "static" -%}
add_library(${PROJECT_NAME} STATIC)
{% elif cookiecutter.project_type == "shared" -%}
add_library(${PROJECT_NAME} SHARED)
{% elif cookiecutter.project_type == "header-only" -%}
add_library(${PROJECT_NAME} INTERFACE)
{%- endif %}

{% if cookiecutter.project_type != "header-only" -%}
set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
)
{%- endif %}

target_include_directories(${PROJECT_NAME}
{%- if cookiecutter.project_type == "header-only" %}
    INTERFACE
{%- else %}
    PUBLIC
{%- endif %}
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>    
        $<INSTALL_INTERFACE:inc>
)

target_sources(${PROJECT_NAME}
{%- if cookiecutter.project_type == "header-only" %}
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/inc/{{cookiecutter.project_name}}.hpp
)
{%- else %}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/inc/{{cookiecutter.project_name}}.hpp
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/{{cookiecutter.project_name}}.cpp
)
{% endif -%}
