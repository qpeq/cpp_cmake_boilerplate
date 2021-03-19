cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

project(test_{{cookiecutter.project_name}})

find_package(GTest REQUIRED)

add_executable (${PROJECT_NAME} 
    src/test_{{cookiecutter.project_name}}.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${GTest_INCLUDE_DIR}
        $<INSTALL_INTERFACE:inc>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
)

target_link_directories(${PROJECT_NAME}
    PUBLIC
        ${GTest_LIB_DIRS}
)

if(NOT WIN32)
    list(APPEND GTest_LIBRARY_LIST pthread)
endif()

target_link_libraries(${PROJECT_NAME}
    PUBLIC
{% if cookiecutter.binary_type != "exe" %}
        {{cookiecutter.project_name}}
{% endif %}
        ${GTest_LIBRARY_LIST}
)

enable_testing()
include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})
