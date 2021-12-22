# Excerpted from https://github.com/conan-io/cmake-conan
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_BINARY_DIR})

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.16.1/conan.cmake"
              "${CMAKE_BINARY_DIR}/conan.cmake"
              TLS_VERIFY ON)
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/conanfile.txt ${CMAKE_CURRENT_BINARY_DIR}/conanfile.txt COPYONLY)

conan_cmake_autodetect(settings)

conan_cmake_install(PATH_OR_REFERENCE .
                    BUILD missing
                    REMOTE conancenter
                    SETTINGS ${settings})