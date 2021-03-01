cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

{% if cookiecutter.binary_type == "exe" -%}
add_executable(${PROJECT_NAME} 
{% elif cookiecutter.binary_type == "static" -%}
add_library(${PROJECT_NAME} STATIC 
{% elif cookiecutter.binary_type == "shared" -%}
add_library(${PROJECT_NAME} SHARED 
{% endif -%}
    inc/hello.h
    src/hello.cpp
{% if cookiecutter.binary_type == "exe" -%}
    src/main.cpp
{% endif -%}
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME} PRIVATE inc)
# target_link_libraries(${PROJECT_NAME} PRIVATE ${CONAN_LIBS})