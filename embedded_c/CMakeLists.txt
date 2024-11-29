target_sources(${PROJECT_NAME} PRIVATE main.c)

file(GLOB SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/protocol/*.c")
target_sources(${PROJECT_NAME} PRIVATE ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")