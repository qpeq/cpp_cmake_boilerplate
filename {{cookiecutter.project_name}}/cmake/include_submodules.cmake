# Excerpted from: https://stackoverflow.com/questions/7787823/cmake-how-to-get-the-name-of-all-subdirectories-of-a-directory
macro(GetSubmoduleList result curdir)
    file(GLOB children RELATIVE ${curdir} ${curdir}/*)
    set(dirlist "")
    foreach(child ${children})
        if(IS_DIRECTORY ${curdir}/${child})
            list(APPEND dirlist ${child})
        endif()
    endforeach()
    set(${result} ${dirlist})
endmacro()

GetSubmoduleList(SUBMODULEDIRS ${CMAKE_CURRENT_SOURCE_DIR}/submodules)

foreach(subdir ${SUBMODULEDIRS})
    add_subdirectory(submodules/${subdir})
endforeach()