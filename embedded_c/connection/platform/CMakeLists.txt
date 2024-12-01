target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

if(WIN32)
    target_sources(${PROJECT_NAME} PRIVATE connection_win32.c)
elseif(UNIX)
    target_sources(${PROJECT_NAME} PRIVATE connection_unix.c)
endif()