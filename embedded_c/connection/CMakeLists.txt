project(connection)
add_library(${PROJECT_NAME} STATIC)

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

if(WIN32)
    target_sources(${PROJECT_NAME} PRIVATE win32/connection.c)
elseif(UNIX)
    target_sources(${PROJECT_NAME} PRIVATE unix/connection.c)
endif()