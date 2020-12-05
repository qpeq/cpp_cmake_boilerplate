cmake_minimum_required(VERSION {{cookiecutter.cmake_minimal_version}})

list(APPEND BUILD_FILES 
    include/hello.h
    source/hello.cpp
    source/main.cpp
)

list(APPEND LINK_LIBS 
    
)

{% if cookiecutter.binary_type == "exe" -%}
add_executable(${PROJECT_NAME} ${BUILD_FILES})
{% elif cookiecutter.binary_type == "static" -%}
add_library(${PROJECT_NAME} STATIC ${BUILD_FILES})
{% elif cookiecutter.binary_type == "shared" -%}
add_library(${PROJECT_NAME} SHARED ${BUILD_FILES})
{% endif %}
set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD {{cookiecutter.cpp_standard}}
    CXX_EXTENSIONS OFF
)

target_include_directories(${PROJECT_NAME} PRIVATE include)
target_link_libraries(${PROJECT_NAME} ${LINK_LIBS})