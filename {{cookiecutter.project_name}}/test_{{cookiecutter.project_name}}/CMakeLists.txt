cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project(test_{{cookiecutter.project_name}})

add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME} 
    PRIVATE
        src/test_{{cookiecutter.project_name}}.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<INSTALL_INTERFACE:inc>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
)

target_link_directories(${PROJECT_NAME}
    PUBLIC
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
{%- if cookiecutter.project_type != "exe" %}
        {{cookiecutter.project_name}}
{%- endif %}
    PRIVATE
{%- if cookiecutter.testing_framework == "gtest" %}
        CONAN_PKG::gtest
{%- else %}
        CONAN_PKG::catch2
{%- endif %}
        $<$<NOT:$<BOOL:${WIN32}>>:pthread>
)

{% if cookiecutter.testing_framework == "catch2" -%}
target_compile_definitions(${PROJECT_NAME} PRIVATE CATCH_CONFIG_MAIN)
{% endif -%}

{%- if cookiecutter.testing_framework == "gtest" -%}
include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})
{% else -%}
include(Catch)
catch_discover_tests(${PROJECT_NAME})
{% endif -%}
