include(CMakeDependentOption)

cmake_dependent_option(CM_BUILD_SHARED_LIBS "Specifies the type of CM to build" ON
        "BUILD_SHARED_LIBS" OFF)

if (MSVC)
    option(CM_WITH_STATIC_CRT "Link with STATIC CRT (this wont work if OpenCV is already linked with SHARED CRT)" OFF)
    set(MSVC_RUNTIME_TYPE MultiThreaded$<$<CONFIG:Debug>:Debug>$<$<NOT:$<BOOL:${CM_WITH_STATIC_CRT}>>:DLL>)
endif ()