# Boost Software License - Version 1.0 - August 17th, 2003

# Permission is hereby granted, free of charge, to any person or organization
# obtaining a copy of the software and accompanying documentation covered by
# this license (the "Software") to use, reproduce, display, distribute,
# execute, and transmit the Software, and to prepare derivative works of the
# Software, and to permit third-parties to whom the Software is furnished to
# do so, all subject to the following:

# The copyright notices in the Software and this entire statement, including
# the above license grant, this restriction and the following disclaimer,
# must be included in all copies of the Software, in whole or in part, and
# all derivative works of the Software, unless such copies or derivative
# works are solely in the form of machine-executable object code generated by
# a source language processor.


if(NOT COMMAND FetchContent_Populate)

    if(CMAKE_VERSION VERSION_LESS 3.11)

        message(STATUS "Fetching FetchContent.cmake")

        file(DOWNLOAD
            "https://gitlab.kitware.com/cmake/cmake/raw/v3.11.3/Modules/FetchContent.cmake"
            "${CMAKE_BINARY_DIR}/Modules/FetchContent.cmake"
        )

        file(DOWNLOAD
            "https://gitlab.kitware.com/cmake/cmake/raw/v3.11.3/Modules/FetchContent/CMakeLists.cmake.in"
            "${CMAKE_BINARY_DIR}/Modules/FetchContent/CMakeLists.cmake.in"
        )

        include(${CMAKE_BINARY_DIR}/Modules/FetchContent.cmake)

    else()

        include(FetchContent)

    endif()

endif()
set(FETCHCONTENT_QUIET FALSE)

message(STATUS "TB      =>  Downloading")
FetchContent_Declare(
    tb
    GIT_REPOSITORY "https://github.com/tigerbeetledb/tigerbeetle.git"
    GIT_TAG main
)
if(USE_FMT)
    message(STATUS "-----------------------------------------")
    message(STATUS "FMT     =>  Downloading")
    FetchContent_Declare(
        fmt
        GIT_REPOSITORY "https://github.com/fmtlib/fmt.git"
        GIT_TAG 10.1.1
    )
    FetchContent_GetProperties(fmt)
    if(NOT fmt_POPULATED)
        FetchContent_Populate(fmt)
    endif()
    set(FMT_PATH ${fmt_SOURCE_DIR})
endif()

FetchContent_GetProperties(tb)
if(NOT tb_POPULATED)
    FetchContent_Populate(tb)
endif()
set(TB_PATH ${tb_SOURCE_DIR})

message(STATUS "-----------------------------------------")
if(USE_FMT)
    message(STATUS "FMT     =>  Downloaded")
    FetchContent_MakeAvailable(fmt)
endif()
message(STATUS "TB      =>  Downloaded")
FetchContent_MakeAvailable(tb)
message(STATUS "-----------------------------------------")

if(USE_FMT)
    add_subdirectory(${FMT_PATH} ${CMAKE_CURRENT_BINARY_DIR}/fmt EXCLUDE_FROM_ALL)
    include_directories(${FMT_PATH}/include)
endif()
include_directories(${TB_PATH}/src/clients/c)
